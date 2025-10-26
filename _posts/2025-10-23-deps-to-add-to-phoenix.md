---
layout: post
title: Deps I add to every new Phoenix app
tags: [Elixir Phoenix]
---

## I learn by building side projects

I have found that I end up adding these deps to every project I build

```elixir
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_check, "~> 0.16.0", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.4", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false},
      {:tidewave, "~> 0.5", only: :dev},
      {:ueberauth_auth0, "~> 2.1"},
```
