---
layout: post
title: Programming Phoenix Book
---

I just finished reading the [Programming Phoenix](https://pragprog.com/titles/phoenix14/programming-phoenix-1-4) book.

I was very impressed with the obvious amount of thought that went into the book, having the three authors write it together ended up forging a superior final product. It was also very approachable, it was not aimed at someone beginning with programming or web development, but as someone that has done some work in Elixir but never properly understood Phoenix, the book served me very well.

I can tell you more about how a request goes through Phoenix than Rails. Even though I've been doing Rails for some time and I've only read one book about Phoenix. Being able to see the pipeline of code that the request goes through and add my own steps in the pipeline is explicitly convenient.

### Takeaways

- Phoenix is a great example of how Elixir applications should be structured.
- If you want to interact with Phoenix channels through JS, there has been a lot of thought put into that and this book has some very practical examples.
- The book had a very helpful basic overview of Genservers, Processes and other OTP concepts.

### Should you read it?

You need to learn some Elixir before picking this up, but it is a much lighter/easier read than [Programming Elixir](https://dewetblomerus.com/2021/05/14/programming-elixir-book.html).

I am still not sure which to recommend as a first Elixir book, but this might be the second Elixir book that I would recommend.

Keep in mind that in the second half of the book there is a lot of time spent on JS interop with Channels. That part was a bit of a slog for me because I am not interested in that right now, it's not at all a downside to the book, it just didn't match my goals. The first part of the book showed me all I needed to know to start working on Phoenix API code at work. But when it comes to full-stack Phoenix, LiveView seems like the future so I'd rather spend my time learning that. But the book is still being written https://pragprog.com/titles/liveview/programming-phoenix-liveview/
