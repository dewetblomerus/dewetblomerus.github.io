---
layout: post
title: Designing Elixir Systems with OTP
tags: [elixir]
---

I just finished reading [Designing Elixir Systems with OTP](https://pragprog.com/titles/jgotp/designing-elixir-systems-with-otp/)

### Key Takeaways

The book is masterfully structured around teaching you a systematic process for layering your Elixir applications so that you or anyone that needs to work on the code after you only has to deal with one specific layer of complexity at a time.

It would help if you read the book to get it, but here is my summary:

1. Start with the data structures on which your application will operate. Come up with all your structs.
1. Write your Functional Core. Create as-pure-as-possible functions that operate on those data structures. Flesh out as much of your complexity here as possible. The tests are easy to set up, and they run stupidly fast because there is no database or framework.
1. Create processes (often Genservers) where you need them.
1. Set up supervision
1. Set up pools and dependencies. Only here do you get concerned with a web framework or the database when needed.

### Will I follow this advice for every app I build?

The first couple of steps, yes. Starting with some data structures and pure functions makes sense in almost every scenario I can think of.
Will I reach for Phoenix early on? Because I am lazy, I am going to generate the application with `mix phx.new`, so my first commits will probably go into a phoenix app. But I can still focus on data and functions inside the contexts before dealing with web requests and persistence.

It also depends on what I'm doing. I enjoy building dumb small things. Sometimes it is just a LiveView on a couple of database tables. If I never plan on growing past that, starting by playing with the view will not create any tech debt that I will feel.

### What was my biggest surprise?

Yesterday, I was extending a Ruby worker that just did one complex thing. After seeing the authors of this book put much effort into test setup and helper functions to make the test read clearly, I did the same for the RSpec tests I was writing. The test setup ended up more challenging to understand, but the tests themselves read exceptionally well. Because the business domain of the worker is difficult to understand, I considered it well worth the trade-off. Spend some brain power understanding the test setup (if you care), switch context, and spend brain power understanding **_why_** the tests are asserting specific behavior. Understanding **_what_** the tests assert is trivial because the extra helper functions create such clean tests. I was surprised that reading a book about designing Elixir systems with OTP improved my RSpec tests.
### Who is it for?

The intended audience is experts. But if you have been writing Elixir for a while and have written Genservers before, don't let the word "expert" intimidate you. The book assumes that background, but if you have it, you will find it very approachable.
