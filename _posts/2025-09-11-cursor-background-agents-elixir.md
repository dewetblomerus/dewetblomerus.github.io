---
layout: post
title: Elixir on Digital Ocean App Platform
tags: [Elixir]
---

# BLUF Bottom Line Up Front

This blog post assume that you know what Cursor Background agents are. As of this writing, Cursor background agents are useful, but not ready to replace regular agent mode and certainly not ready to replace an experienced programmer (who is probably using Cursor in Agent mode, or something similar at this point).

# My prediction of the future

It might be years away, but eventually, the cost in $ and time of AI generated code will be a lot lower than it is in 2025. Either the models will stop getting better, and someone will build specialized hardware on which to run them many times more efficiently (like what happened with specialized hardware for Bitcoin mining). Or the models will keep getting better, and will generate higher quality code per $ of electricity invested. Both of these options eventually gets us to the same destination, background agents that work independently, and humans verifying the work. How long we reside at that destination before AI reviews the code as well... There's only one right answer at this point: "I don't know."

# Shortcomings of Cursor Background Agents

Setup feels really immature. You can either manually set up an Ubuntu box that they spin up, and then you have to click to take a snapshot, from which it will start all future runs. (This made me feel like I'm doing cutting edge server setup in 2005).
The other option is using Docker, but it kept building my entire docker image from the beginning of the `Dockerfile` every time I start an agent.

# Database

I don't like to set stuff up, so I signed up for a free-tier Postgres database on [Koyeb](https://www.koyeb.com). The Koyeb free DB scales to 0 when not receiving any requests for 5 minutes, so it needs some warm-up time, I had to set the timeout really long.
I also really don't like to wait for computers when I'm working on them, so I wanted my local development to still use my local DB and run dev & test as fast as possible. After some trial & error, here is what I came up with in my `runtime.exs`

```elixir
if config_env() == :dev or config_env() == :test do
  database_name =
    if config_env() == :test do
      "eventblast_test#{System.get_env("MIX_TEST_PARTITION")}"
    else
      "eventblast_dev"
    end

  database_config =
    case System.fetch_env("DATABASE_URL") do
      {:ok, database_url} ->
        IO.inspect("DATABASE_URL is set 🤫")

        timeout = 120_000

        [
          connect_timeout: timeout,
          handshake_timeout: timeout,
          pool_size: 10,
          show_sensitive_data_on_connection_error: false,
          ssl: [verify: :verify_none],
          timeout: timeout,
          url: database_url
        ]

      :error ->
        [
          pool_size: System.schedulers_online() * 2,
          show_sensitive_data_on_connection_error: true,
          url: "postgres://postgres:postgres@localhost:5432/#{database_name}"
        ]
    end

  config :eventblast, Eventblast.Repo, database_config ++ [stacktrace: true]
end

```

# Dockerfile

Since Cursor re-builds the docker image from the Dockerfile on each start of a background agent, I made an [Elixir development image that you can find here with instructions on how to use it in the README](https://github.com/dewetblomerus/cursor-background-agent-base-image-elixir)
