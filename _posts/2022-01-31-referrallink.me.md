---
layout: post
title: ReferralLink.me
---

I just created a very bare and basic CRUD app with LiveView generators [ReferralLink.me](https://referrallink.me/).

### Takeaways

- Seeing how the generators generated forms gave me more elegant ways to do things than I've been using.
- LiveView Components, I knew these existed but didn't really know how/why/when to use them. The generators generated a bunch of them so I saw some good examples and then created some of my own components. It feels a lot like a React component, you pass values into it that becomes it's state, but it can also have it's own backend code that interacts with the database or anything else. An event inside a LiveComponent can be handled by the component or by the parent LiveView.
- The world didn't have a platform for credit card churners to share personal referral links with each other, now it does https://referrallink.me/ I don't think anyone will ever use it, but I can relax knowing it exists.
- Fly.io was super simple to set up and deploy with. Much easier than deploying to my own server.

### Surprises

Fuzzy searches searches in Postgres using Trigrams are super simple!!! You run a migration like this to enable fuzzy searching https://gitlab.com/dewetblomerus/refer/-/blob/main/priv/repo/migrations/20220123135146_enable_fuzzy_extensions.exs and then you can use `SIMILARITY` in your DB query like this https://gitlab.com/dewetblomerus/refer/-/blob/main/lib/refer/deals.ex#L36
