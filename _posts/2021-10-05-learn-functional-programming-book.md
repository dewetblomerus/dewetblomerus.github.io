---
layout: post
title: Learn Functional Programming Book
---

I just finished reading the [Learn Functional Programming with Elixir](https://pragprog.com/titles/cdc-elixir/learn-functional-programming-with-elixir/) book.

I didn't set out with the goal of reading the book for the Elixir knowledge I would gain from the book. Instead, I wanted to know if it was a book I could recommend to beginners, spoiler alert, it is.

### Takeaways

- This is the beginner book I have been looking for to recommend to people as a first Elixir book.
- All the code examples solve easily understood problems, so you can focus on just understanding what the code does and spend less time understanding the problem it is supposed to solve.


### Surprises

I picked up a beginner book and learned two advanced concepts.

- A Closure is when a function preserves the value of a variable from the scope where the function was defined and takes that same value with it wherever you pass the function to (In the case of Elixir, even to a different machine on a different continent).
- A Monad is a data structure that wraps the return value of a function. It indicates to the rest of the pipeline of function calls if it was a success or a failure so that the pipeline can decide to terminate early and just return the error. Elixir does not have this built-in, some libraries provide support for it, but you don't need this, just use `with`.

I think a beginner book was the best place for me to learn about these concepts because I am a beginner with both of them.

### Should you read it?

If you are interested in learning Elixir and are not yet comfortable reading & writing Elixir code, yes.
