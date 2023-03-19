---
layout: post
title: LiveView Timed Flash
tags: [elixir]
---

If you need to put a flash message in LiveView but want it to disappear after a few seconds, you might be surprised that LiveView does not have this built-in.

Here is how to do it:

All these changes go into your LiveView file.

In your `mount` function, assign an empty `flash_timer`.

```elixir
assign(flash_timer: nil)
```

Define a `:clear_flash` handle info so we can send ourselves a message to clear the flash.

```elixir
@impl true
def handle_info(:clear_flash, socket) do
  {:noreply, clear_flash(socket)}
end
```

Define a `put_timed_flash` function.

```elixir
defp put_timed_flash(socket, key, message, timeout \\ 5000) do
  if socket.assigns.flash_timer do
    Process.cancel_timer(socket.assigns.flash_timer)
  end

  timer = Process.send_after(self(), :clear_flash, timeout)

  socket
  |> put_flash(key, message)
  |> assign(flash_timer: timer)
end
```

You're done!

Now you can use it with the same interface as [put_flash/3](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#put_flash/3){:target="\_blank" rel="noopener"} but it also accepts an optional 4th timeout argument.

Example usage:

```elixir
put_timed_flash(
  socket,
  :info,
  "This message will disappear after the default of 5 seconds ⏳."
)
```

You can [see it in action on quickaverage](https://quickaverage.com/){:target="\_blank" rel="noopener"} by clicking to copy the URL at the bottom or by clicking the "Clear Numbers" button.
