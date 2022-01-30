---
layout: post
title: Testing Elixir Book
---

I just finished reading the [Testing Elixir](https://pragprog.com/titles/lmelixir/testing-elixir/) book.

### Takeaways

- ExUnit is fairly simple. As compared to RSpec that has a lot of bells and whistles built in.
- Setting up test contexts can not be nested but instead has a very elegant way to compose setup blocks together, this was done to prevent the pain of looking at a deeply nested RSpec file and needing to scroll up to find the setup data for the current test.
- Property Based Testing seems really cool. Especially how the frameworks will start shrinking the input data as soon as they find a failure to present you with the smallest/simplest possible input that caused the failure. I'll look for an opportunity to use this, but can't think of one right now.
- I already implemented some of what I learned into some of our tests at work.

### Surprises

I struggled with motivation to get through the end of the book. Maybe that was just personal motivation for technical learning waning, I am at a place where I know enough technical content to get all my needed testing done without learning more about Elixir testing. My other guess about why I struggled to get through it is because ExUnit is a fairly basic tool, so a 230 page book ends up with a lot of explanations for why best practices exist, it's good to know, but not terribly exciting. If I had more junior engineers at work asking questions about why we test how we test, I might have appreciated this a lot more.

### Should you read it?

Yes if you want to get better at testing Elixir. Maybe consider reading one chapter at a time, right before you are about to implement something that requires that chapter's topic. This might make it more of a page-turner.
