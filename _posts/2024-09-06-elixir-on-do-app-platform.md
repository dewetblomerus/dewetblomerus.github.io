---
layout: post
title: Elixir on Digital Ocean App Platform
tags: [Elixir]
---

# BLUF Bottom Line Up Front

DO NOT do this unless you absolutely have to. Fly.io is much simpler and more fully featured.

# What I was up to

I recently had an idea to build Server-Sent-Events-As-A-Service, which would enable uni-directional real-time public content delivery for a fraction of the cost of WebSocket-As-A-Service providers.

# Reasons to consider Digital Ocean App Platform vs Fly.io?

Most business ideas end up making no money, but because I like to dream, I dreamt that if this one makes it, my main cost would be my cloud bill, especially my egress networking bill. Even before factoring in the included free bandwidth DigitalOcean has much lower egress bandwidth costs.

# Erlang Distribution Woes

The nodes can not connect to each other. Each individual service has an internal public address, so your `web` service can be accessed internally by your other services in App Platform on `http://web` with [an internal port that you specify](https://docs.digitalocean.com/products/app-platform/how-to/manage-internal-routing/). What they can not do is connect to other nodes within the same service.

# Elixir is not a first-class citizen

They have two ways of deploying code onto App platform. Looking at a Git repo and building it when new code is pushed to a branch (`main` would make sense for Prod). Looking at a container registry and deploying it when a new image is pushed `latest` would make sense for Prod. I actually like the image push solution, so I don't mind that they can't build the Elixir app from source. The concerning fact is that there are guides for several other popular languages, but no guides on how to deploy an Elixir apps and all the googling online described how to deploy on DigitalOcean droplets is what ultimately leaves me recommending that you stick with Fly.io
