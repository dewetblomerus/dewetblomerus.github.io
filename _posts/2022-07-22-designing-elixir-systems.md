---
layout: post
title: Designing Elixir Systems with OTP
tags: [elixir]
---

I just finished reading [Designing Elixir Systems with OTP](https://pragprog.com/titles/jgotp/designing-elixir-systems-with-otp/)

### Key Takeaways

The book is masterfully structured around teaching you a systematic process for layering your Elixir applications so that you or anyone that needs to work on the code after you, only has to deal with one specific layer of complexity at a time.

You should read the book to really get it, but here is my summary:

1.  Start with the data structures that your application will operate on. Come up with all your structs.
1.  Write your Functional Core. Create as-pure-as-possible funcitons that operate on those data structures. Flesh out as much of your complexity here as possible. The tests are easy to set up and they run stupid fast because there is no database and no framework to worry about.
1. Create processes (often Genservers) where you need them.
1. Set up supervision
1. Set up pools and dependencies. Only here do you get concerned with a web framework or the database when needed.

### Will I follow this advice for every app I build?

The first couple of steps yes. Starting with some data structures and pure functions makes sense in almost every scenario I can think of.
Will I reach for Phoenix early on? Well, because I am lazy, I am going to generate the application with `mix phx.new` so my first commits will probably go into a phoenix app. But I can still focus on data and functions inside the contexts before dealing with web requests and persistence.

It also depends on what I'm doing. I enjoy building really dumb small things in my personal time. Sometimes it is just a LiveView on a couple of database tables. If I never plan on growing past that starting by playing with the view is not going to create any tech debt that I will actually feel.

### What was my biggest surprise?

Yesterday, I was extending a Ruby worker that just did one ridiculously complex thing. After seeing the authors of this book put a lot of effort into test setup and helper funcitons to make the test read easily, I ended up doing the same for the RSpec tests I was writing. The test setup ended up more difficult to understand, but the tests themselves reads extremely well and because the business domain of the worker is difficult to understand, I considered it well worth the trade-off. Spend some brain power understanding the test setup (if you care) and then switch context and spend brain power understanding _WHY_ the tests are asserting certain behavior. Understanding _WHAT_ the tests actually assert is trivial because the extra helper functions creates such clean tests. I was surprised that reading a book about architecting Elixir systems with OTP made my RSpec tests better.

### Who is it for?

The intended audience is expert. But if you have been writing Elixir for a while and you have written Genservers before, don't let the word "expert" intimidate you. The book assumes that background but if you have it, you will find it very approachable.
