---
layout: post
title: LiveView Timed Flash
tags: [elixir]
---

If you need to put a flash message in LiveView but want it to dissapear after a few seconds, you might be surprised to see that this is not built into LiveView yet.

Here is how to do it:

All these changes goes in your LiveView.

On mount, assign an empty `flash_timer`

```elixir
assign(flash_timer: nil)
```

Define a `:clear_flash` handle info so that we can send ourselves a message to clear the flash.

```elixir
@impl true
def handle_info(:clear_flash, socket) do
  {:noreply, clear_flash(socket)}
end
```

Define a `put_timed_flash` function

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

You're done! You can see it in action [on quickaverage](https://quickaverage.com/){:target="\_blank" rel="noopener"} by clicking to copy the URL at the bottom or by clicking the "Clear Numbers" button.
