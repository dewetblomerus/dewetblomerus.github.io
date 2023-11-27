---
layout: post
title: My First Impressions of Ash
tags: [Book]
---

I recently built [SpellSightWords.com](https://spellsightwords.com/){:target="\_blank"}
to the point where my only user (my daughter) is using it every day and finding it useful.

This was my first experience with the [Ash Framework](https://ash-hq.org/){:target="\_blank"}.

Ash was enjoyable to use, I would definitely want to build with it again.

### Pros

- The community is incredible. I have never seen a community so ready to help
  when I get stuck
- You get all the proven cost savings of LiveView, without the
  cost of building a JSON or GraphQL API from scratch if you later need an API
  for a mobile app or integration.
- Understandability is really cheap. There is less code to read, and it is
  very declarative, so it is easy to understand what the code is doing.
- Less code to change when requirements change.
- Even with the learning curve, I believe that I will spend less time
  maintaining/owning the code than if I built it without Ash. So if the app
  ends up living for years, I will have eventually saved time, even on the first
  thing I built.

### Cons

- The documentation is off to a great start, but still needs to mature. I have
  been able to get by with the help of
  the community, but I would like to see more documentation. Especially, more
  code examples, which is helpful for someone using it for the first time.
- Error messages are not as clear as I would like. Often times, the error message
  made it clear to me which of my code caused the error, but I missed the normal
  Elixir experience where I get a stack trace that points me to the exact line
  of code that caused the error. If the error happened inside macro code, I would
  like the Phoenix experience where my config caused an error deep inside some
  library code, but the error includes suggestions on how to fix it.
- There is a learning curve. This is true for any framework, but because Ash
  does so many things, there are many things to learn. I could have built my app
  in less time without ash. I believe that building my second app with Ash
  could be faster than building without Ash, but that is just an educated hunch.

### Biggest Surprise

When I made a significant change to my data model, the changes to my UI code
were extremely minimal. I was able to make the change in what felt like minutes, and
then I was able to move on to the next feature. If I had written the code by hand,
I would probably have had a lot more code to move around when changing the data model.

### Who would I recommend it to?

If you already know Elixir, Phoenix and LiveView, and you like using the latest
and greatest tools, then I highly recommend giving Ash a try. If you are still learning Elixir,
I would recommend you learn the basics first, then come back to Ash. Using it in
a business would carry some risk. The only real risk I see is if something happened
to Zach Daniel and Josh Price and it stopped being maintained. Taking that risk
into account, the benefits of shipping value in less time
and then having less code to maintain and all the cost savings of how much code
needs to be read to understand the system, I would still recommend it.
