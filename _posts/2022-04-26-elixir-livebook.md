---
layout: post
title: Elixir Livebook
tags: [elixir]
---

I spent some time playing with [Livebook](https://github.com/livebook-dev/livebook)

### What is Livebook?

According to the docs: Livebook is a web application for writing interactive and collaborative code notebooks for Elixir, built with Phoenix LiveView

### Why was I interested?

I have used a few different tools to show my kids how to code. [Scratch](https://scratch.mit.edu/) and [CodeCombat](https://codecombat.com/) were both hits but I have been looking for the next step.

I bought a color changing bulb for my oldest daughter's room to see if she would be interested in writing the code to send web requests to it and change the color. I could have used Curl to show her that but that seems a bit boring. If she learned the basics of Elixir she could build a LiveView interface with buttons for different colors. Or she could build some kind of question and answer quiz that let her light turn green if you answered correctly or red if you got it wrong.

I did set up a basic Elixir repo with an HTTP client and showed her some working code that could change the light color, but she wasn't all that interested. It as also kind of a pain, the instructions were many steps.

1. Open Terminal
1. `cd` into just the right directory with just the right command
1. `iex -S mix` to load the code
1. `EvaLight.set_color(:pink)`

She wrote this down but ultimately never used it. So I wanted an easier way to do this. And then I heard about **Livebook**. After getting it running on my Raspberry Pi where it is now always running, now she can just visit a bookmarked URL and click to evaluate the code that changes the light color.

### How did it turn out?

She thought it was very cool, but still does not seem interested. If ultimately, writing code is just not her thing, I'm fine with that, I just want to make sure that I provide my kids with every opportunity to learn the skill that is affording me so many privileges.

[Here is the repo](https://github.com/dewetblomerus/book) for starting up the Livebook on the Raspberry Pi.

The LiveBooks are saved in Markdown (which is what I write my blog posts in), let's see how it renders here if I just paste it:

<!-- livebook:{"autosave_interval_s":30} -->

# Eva Light

## Run the following in a shell in the container

```
mix local.hex
mix local.rebar --force
```

## Install Depependencies

```elixir
Mix.install([
  {:httpoison, "~> 1.8"},
  {:jason, "~> 1.3"}
])
```

## Set up client

```elixir
defmodule HomeAssistant do
  def webhook(webhook_id, body) do
    HTTPoison.post!(
      "http://homeassistant.local:8123/api/webhook/#{webhook_id}",
      Jason.encode!(body),
      headers()
    )
  end

  defp headers() do
    [
      {"content-type", "application/json"}
    ]
  end
end
```

```elixir
webhook_id = System.fetch_env!("EVA_LIGHT_WEBHOOK_ID")

set_color = fn color ->
  %HTTPoison.Response{status_code: 200} = HomeAssistant.webhook(webhook_id, %{color: color})

  :ok
end
```

## Make API Requests

```elixir
set_color.(:bright)
```

```elixir
set_color.(:warm)
```

```elixir
set_color.(:bedtime)
```

```elixir
set_color.(:night)
```

```elixir
set_color.(:green)
```

```elixir
set_color.(:pink)
```

```elixir
set_color.(:purple)
```
