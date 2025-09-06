---
layout: post
title: Elixir on Digital Ocean App Platform
tags: [Elixir]
---

# BLUF Bottom Line Up Front

DO NOT do this unless you absolutely have to. Fly.io is much simpler and more fully featured.

# Why I tried Digital Ocean App Platform when I already knew how to deploy stuff with Fly.io?

I recently had an idea for a side project that would enable ui-directional real-time public content delivery for a fraction of the cost of WebSocket-As-A-Service providers.

Most business ideas end up making no money, but because I like to dream, I dreamt that if this one makes it, my main cost would be my cloud bill, especially my egress networking bill. Because of this, I decided to try and use Digital Ocean App Platform. I could get easy deployment of my app through their PaaS, and if I ever scaled up, I could deliver the egress bandwidth from droplets with tons of included bandwidth and 1-cent/GB overage charges.

# Erlang Distribution Woes

The nodes can not connect to each other. Each individual service has an internal public address, so your `web` service can be accessed internally by your other services in App Platform on `http://web` with [an internal port that you specify](https://docs.digitalocean.com/products/app-platform/how-to/manage-internal-routing/). What they can not do is connect to other nodes within the same service.

# Elixir is not a first-class citizen

They have two ways of deploying code onto App platform. Looking at a Git repo and building it when new code is pushed to a branch (`main` would make sense for Prod). Looking at a container registry and deploying it when a new image is pushed `latest` would make sense for Prod. I actually like the image push solution, so I don't mind that they can't build the Elixir app from source. The concerning fact is that there are guides for several other popular languages, but no guides on how to deploy an Elixir apps and all the googling online described how to deploy on DigitalOcean droplets is what ultimately leaves me recommending that you stick with Fly.io
