---
layout: post
title: Essential Postgres Book
tags: [Book]
---

I recently finished reading [Essential Postgres by Rick Silva](https://www.amazon.com/gp/product/B08KH136G4){:target="_blank"}.

I aimed to strengthen in an area where I have yet to spend time focused on learning. I was pleasantly surprised to learn that I already knew most of the basics covered in the book.

### Key takeaways
- ActiveRecord and Ecto are so good at abstracting SQL that there are a lot of SQL examples I get to look at and think, "That's nice, but I won't be writing that."
- Looking at complex joins with multiple tables in simple examples made them more approachable than trying to understand it in the middle of shipping a complex feature.
- From Postgres's perspective, a Primary Key is just a combination of "Not NULL", Unique, and indexed. A sequence to auto-increment the primary key for each new row is a completely different Postgres thing. ActiveRecord and Ecto handle creating it for you on a primary key column.

### Biggest Surprise
I have never considered myself _strong_ at Postgres, but I needed a more advanced book. This book provided lots of examples on how to get data in and out of Postgres using SQL and a bit of PL/pgSQL, but when I find myself needing more Postgres knowledge, it is always around indexes and how to make sure the query optimizer uses them. None of that was covered here.

### Who would I recommend it to?
If you are new to using any kind of database and new to SQL, I would 100% recommend this book.