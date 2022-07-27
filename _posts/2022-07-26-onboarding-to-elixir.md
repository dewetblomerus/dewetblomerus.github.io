---
layout: post
title: Onboarding new Elixir Members
tags: [elixir]
---


### Things to ignore in the beginning.

These things are all super powerful and you will be very well served by learning them eventually, but you can get away with making your initial progress without them.

- Genservers
- Supervisors
- Recursive Functions
- Agents
- Processes
- Concurrency
- ETS
- OTP
- Behaviors
- Protocols
- Macros

### Things to learn right away.

- Pattern Matching values out of a Map
- Read all the errors carefully, with the attitude that (I am going to be great at understanding these) understanding those in any language is a huge help.
- How to create a Module
- How to create named functions
- How to create anonymous functions
- How you call named functions, always on the module, you don’t do "dewet".upcase but instead String.upcase("dewet"). Coming from OO, it is as if everything is a class method.
- How to use the List, Map, String and Enum modules.
- Pattern match on function heads instead of using if statements (just go with me on this, if you ignore this and write your code with if statements you will be confused the moment you try to read someone else’s code).
- Structs
- Writing tests with ExUnit.
- Ask for lots of help and review with config code.

### Mentor's notes. If you are helping people who are new to Elixir onboard.

- Think carefully about if they are an Elixir or programming language enthusiast or not.
- What is the point to learning Elixir? Other than "This is the language we need you to write this in". Why was it written in Elixir in the first place?
- Sell them on concurrency, which is might help them understand what is the point to learning Elixir.
- Share a few things about Elixir's strengths. You can make a web request, from a web request. If it is a better user experience to wait an extra 500 milliseconds for something to finish instead of creating a background task and sending the user an email, Elixir will have no problem with this.
- Don't suggest they do things that you haven't done. Do them the service of trying it yourself before asking them to do it. Only skip this if you are 100% sure it is the correct approach.
- Get ready to explain config several times, be patient. I don't believe Elixir made a mistake, Elixir just solved the Config problem with a different approach than other languages did, so it takes some getting used to.
- Get people started on something small if possible. Ideally, something that can be re-visited a year later and re-written in a week.
- Do not use recursion if an Enum function will do. It will be easier for a beginner to understand.
- Don't use if-statements just to make things easier for beginners to understand. While we might put off recursive functions until ater, pattern matching function heads for branching is a foundational concept.
