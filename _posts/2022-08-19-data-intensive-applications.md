---
layout: post
title: Designing Data Intensive Applications
tags: [elixir]
---

I recently finished listening to [Designing Data Intensive Applications](https://www.audible.com/pd/Designing-Data-Intensive-Applications-Audiobook/B08VLGDK32)

This is another technical book that worked very well as an audio book because it contains quite a bit of theory.

I don't have a computer sciense degree. This has not been a significant hurdle for me becuase I believe in continually learning and reading technical books. Most of the time however, the books I am reading are focused on how to use certain tools to get certain things done. Furthermore, most of my tech career has been spent in mid stage startups. Where Postgres can still get most of the persistence work done, and chasing after newer technologies is usually the wrong choice. Except when it isn't.

All of this has left me some gaps in my knowledge of Database Theory. Which types of databases are suitable for which types of work loads. And specific names for the problems we face during distributed computing.

### Main takeaways

- I learned a lot of terms for things. Knowing the right words are useful when trying to reason about a higher level concept. We use ElasticSearch at work, after reading the book I can explain that "ElasticSearch holds the derived data while Postgres is the system of record" or that "Service X is a batch processor while service Y is a stream processor". Without the terms I learned from the book, I would have to use a lot more words to describe these things. Of course, I might need to define some of these terms for people, but everyone having the words for things does elevate the conversation.
- I learned a lot about distributed correctness porblems and different approaches to solving them. The book goes into great detail about the problems with getting multi-leader databases to be consistent, with excellent examples for how the system could get into an inconsistent state. The book also covers many approaches for trying to solve this problem, including two-phase commit and consensus. This helped me understand why software engineers with decades of experience push hard toward "Just use Postgres if it will solve the problem".
- If I do need to choose a database to perform a task where Postgres is not suitable, the book has given me a good starting point with an excellent overview of categories of data stores with many examples of modern databases that fit in those categories and the tradeoffs they choose.

### Biggest Surprise

- I expected to benefit from a heavily theoretical book like this over years as I am asked to do more design and planning work. However, right after I started the book, our team picked up a problem where we needed to increase read-complexity in order to decrease write complexity and I was listening to examples of how other companies did this right as we were doing the work.

### Who is this for?

If you are still getting comfortable with the tools you need for writing code day-to-day, focus on learning materials for those. But as soon as you feel yourself getting comfortable with getting the work done, I would recommend this book becuase sooner or later people will look to you for making decisions on which approach to take with a data intensive problem.