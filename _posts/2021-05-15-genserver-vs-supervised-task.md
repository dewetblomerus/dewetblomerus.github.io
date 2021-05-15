---
layout: post
title: GenServer vs Supervised Task
---

If all you need is an Elixir process to sit under a `Supervisor` and do something over and over, these two options stand out:
- A GenServer
- A Supervised Task

For comparison I created each to write a heartbeat every second.

The GenServer:
```elixir
defmodule Whichsup.Genserver do
  use GenServer
  @self __MODULE__

  def start_link(_) do
    GenServer.start_link(@self, 1000, name: @self)
  end

  def init(delay) do
    Process.send_after(@self, :heartbeat, delay)
    {:ok, delay}
  end

  def handle_info(:heartbeat, delay) do
    IO.puts("Heartbeat from the GenServer")
    Process.send_after(@self, :heartbeat, delay)
    {:noreply, delay}
  end
end
```

The Task:
```elixir
defmodule Whichsup.Task do
  use Task, restart: :permanent

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [1000])
  end

  def run(delay) do
    IO.puts("Heartbeat from the Supervised Task")
    Process.sleep(delay)
    run(delay)
  end
end
```

Here is the [source code](https://github.com/dewetblomerus/whichsup)

## Let's list some benefits of each approach

### GenServer
- The process is not blocked, it can receive other messages while it waits.
- You can keep adding functionality with more callback functions.
- It is easy to test.

### Task
- Less code, two functions instead of three.
- Easier to understand the flow, and the intent.
- It not only provides the "All you need" I defined on my first sentence of this post, it also communicates to other programmers that it does not intend to do other things, it aspires to remain as simple as it is today.

If you are thinking of something I missed, please let me know.
