---
layout: post
title: A GenServer can block senders without blocking itself
tags: [elixir]
---

I was discussing a data processing/aggregation problem with Ben Olive recently and he told me about a GenServer feature I didn't know about. Returning a `{:noreply, new_state}` to a `handle_call/3`. It is right there in the [GenServer documentation for `handle_call/3`](https://hexdocs.pm/elixir/1.14.0/GenServer.html#c:handle_call/3)

## The problem

You have many Elixir processes sending messages and you want to combine one message from each of many processes into a batch, only after the batch was successfully processed do you want the individual processes to continue their work.

## Where I was stuck

I was stuck thinking about only the basics of `GenServer.cast` and `GenServer.call`. If I let the processes do `GenServer.cast` which will hand control back to them immediately, they will keep sending messages with no backpressure. If I make the individual processes use `GenServer.call`, the GenServer itself is doing a blocking operation and can not process messages from other senders to batch them up.

## What I didn't know

In the OTP primitives there is no blocking syncronous communication between processes. One process sends a message to another process, it is async, that is all there is. The way that `GenServer.call` appears syncronous is that the sender sends a unique identifier and blocks itself to get a reply with that same unique identifier.

## The solution

The receiver can choose to continue doing other work and send the reply later, this will keep the sender blocked and waiting, but the receiver is free to process other messages and reply when appropriate, or even ask another process to send the reply.

## Example Code

```bash
mix new blocky --sup
```

`lib/blocky/producer.ex`
```elixir
defmodule Blocky.Producer do
  use GenServer

  def start_link(id) do
    GenServer.start_link(__MODULE__, %{id: id, number: 1})
  end

  def init(state) do
    send(self(), :produce)
    {:ok, state}
  end

  def handle_info(:produce, %{id: id, number: number} = state) do
    send(self(), :produce)
    # IO.inspect(id, label: "procucing 🛢")
    Blocky.Consumer.push(number)
    {:noreply, %{state | number: number + 1}}
  end
end
```

`lib/blocky/consumer.ex`
```elixir
defmodule Blocky.Consumer do
  @wait_to_aggregate 1000
  use GenServer

  def push(number) do
    GenServer.call(__MODULE__, {:push_number, number})
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    send(self(), :aggregate)
    {:ok, %{senders: [], numbers: []}}
  end

  def handle_call({:push_number, number}, from, state) do
    new_state =
      state
      |> Map.update!(:numbers, fn numbers -> [number | numbers] end)
      |> Map.update!(:senders, fn senders -> [from | senders] end)

    # blocks the sender
    {:noreply, new_state}

    # releases the sender
    # {:reply, :ok, new_state}
  end

  def handle_info(:aggregate, %{senders: senders, numbers: numbers}) do
    Process.send_after(self(), :aggregate, @wait_to_aggregate)

    IO.inspect("Adding #{Enum.count(numbers)} numbers ✅")
    IO.inspect("Total is #{Enum.sum(numbers)} 🧮")

    reply_to_senders(senders)

    {:noreply, %{senders: [], numbers: []}}
  end

  defp reply_to_senders(senders) do
    for sender <- senders do
      GenServer.reply(sender, :ok)
    end
  end
end
```

`lib/blocky/application.ex`
```elixir
defmodule Blocky.Application do
  use Application
  @number_of_producers 10

  @impl true
  def start(_type, _args) do
    producers =
      for id <- 1..@number_of_producers do
        %{
          id: id,
          start: {Blocky.Producer, :start_link, [id]}
        }
      end

    children = [Blocky.Consumer | producers]

    opts = [strategy: :one_for_one, name: Blocky.Supervisor]
    Supervisor.start_link(children, opts)

    {:ok, self()}
  end
end
```

Run it

```bash
mix run --no-halt
```

Notice that the consumer has time to handle messages from all 10 consumers and add them up before they are allowed to send more.
```elixir
"Adding 0 numbers ✅"
"Total is 0 🧮"
"Adding 10 numbers ✅"
"Total is 10 🧮"
"Adding 10 numbers ✅"
"Total is 20 🧮"
"Adding 10 numbers ✅"
"Total is 30 🧮"
```

If we comment out the `:noreply` and choose to send a reply rigt away, like this:

`lib/blocky/consumer.ex`
```elixir
    # blocks the sender
    # {:noreply, new_state}

    # releases the sender
    {:reply, :ok, new_state}
```

Now the producers will bury us in messages, not what we wanted:

```elixir
"Adding 0 numbers ✅"
"Total is 0 🧮"
"Adding 584734 numbers ✅"
"Total is 17151906968 🧮"
"Adding 451791 numbers ✅"
"Total is 36628491013 🧮"
"Adding 539047 numbers ✅"
"Total is 70417648445 🧮"
```
