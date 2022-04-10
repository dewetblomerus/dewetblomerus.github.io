---
layout: post
title: Elixir Boundary
tags: [elixir]
---

I spent some time playing with [Boundary](https://github.com/sasa1977/boundary)

### What is Boundary?

A tool for enforcing any design of your choosing around which of your modules depends on which other ones.

### What it is for

- It seems ideal for enforcing some design of how Modules depend on each other. Especially when you won't be able to look at all the PRs yourself.
- I could see this being a great fit for a monolith or a large codebase that several teams touch or in a consulting situation where others could inherit a codebase without talking to the authors.

### Why I am not going to try and convince my team to adopt this

- Most people have never heard of Boundary, so there will be a cost to getting everyone on board before adopting.
- None of us have actually used it, I've just played with it for about 90 minutes, so there will be some learning curve or gotcha's.
- If it ever breaks, we could just remove it, but if I'm not there during that conversation and people don't know what it is, there could be a bunch of research cost before removing it.
- My delivery team owns a few Elixir services but other teams rarely write code in them.
- A high-level conversation about how we should design the relationship between modules is something I would be happy to have during code review, or before someone even gets started writing code if we know they are about to create something that could reach across different concerns.
- All of the above points to some very minor costs and some costs that might never show up, but the benefits for the size and ownership model of our codebase does not seem to weigh heavy enough against those costs.

### Surprises

- Documentation for getting the compiler warning to be considered an error by CI was hard to find.
- Given my assumption that every successful monolith could benefit from this. I am surprised that something like this is not in common use in any of the languages I've worked in.
