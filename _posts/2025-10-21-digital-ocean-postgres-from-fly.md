---
layout: post
title: Connecting to a DigitalOcean Managed Postgres from Fly.io
tags: [Cloud Elixir Phoenix Postgres Fly DigitalOcean]
---

## BLUF (Bottom Line Up Front)

- There are no sponsored links on this page, I'm just trying to be helpful.
- I'm running a DigitalOcean fully manged & backed up Postgres instance with 1GB of ram and 10GB of storage, which makes it powerful enough to run databases for all of my current side projects.
- My Fly.io apps are connecting to this Postgres, and the latency from the network hop originating in Ashburn Virginia to New York is completely imperceivable.
- At $15 per month, this is less than half the price of [Fly Managed Postgres](https://fly.io/docs/mpg/)

## History

I received the email months ago that Fly.io will no longer be supporting the automated-but-not-managed Postgres apps that were usually the default. I have one of these old DBs for [spellsightwords.com](https://spellsightwords.com/) which means that my daughter and a bunch of other kids have years of their tutoring progress stored in this DB. It would break their little hearts if it was every lost, so I should probably store it in a DB with properly automated backups.

## Why I went looking

When the new [Fly Managed Postgres](https://fly.io/docs/mpg/) finally launched at a $38, I evaluated for about 5 seconds before deciding to go looking for something cheaper. I considered [Koyeb](https://koyeb.com/) and [Neon](http://neon.com/), but then I would be imposing an annoying startup latency on my users, and if I want [Neon](http://neon.com/) or [Koyeb](https://koyeb.com/) to always be on, it would cost about the same as Fly's offering.

Eventually, I settled on [DigitalOcean Managed Postgres](https://www.digitalocean.com/products/managed-databases-postgresql)

## Cost Comparison

<table>
  <thead>
    <tr>
      <th>Memory (RAM)</th>
      <th style="background-color: #e1bee7; color: #333;">Fly.io Plan</th>
      <th style="background-color: #e1bee7; color: #333;">Fly.io CPU</th>
      <th style="background-color: #e1bee7; color: #333;">Fly.io Monthly</th>
      <th style="background-color: #bbdefb; color: #333;">DigitalOcean vCPU</th>
      <th style="background-color: #bbdefb; color: #333;">DO Storage Min</th>
      <th style="background-color: #bbdefb; color: #333;">DO Conn Limit</th>
      <th style="background-color: #bbdefb; color: #333;">DO Monthly</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 GB</td>
      <td style="background-color: #e1bee7; color: #333;">Basic</td>
      <td style="background-color: #e1bee7; color: #333;">Shared-2x</td>
      <td style="background-color: #e1bee7; color: #333; text-align: right;"><strong>$38.00</strong></td>
      <td style="background-color: #bbdefb; color: #333;">1 vCPU</td>
      <td style="background-color: #bbdefb; color: #333;">15 GiB</td>
      <td style="background-color: #bbdefb; color: #333;">22</td>
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$15.00</strong></td>
    </tr>
    <tr>
      <td>2 GB</td>
      <td style="background-color: #e1bee7; color: #333;">Starter</td>
      <td style="background-color: #e1bee7; color: #333;">Shared-2x</td>
      <td style="background-color: #e1bee7; color: #333; text-align: right;"><strong>$72.00</strong></td>
      <td style="background-color: #bbdefb; color: #333;">1 vCPU</td>
      <td style="background-color: #bbdefb; color: #333;">40 GiB</td>
      <td style="background-color: #bbdefb; color: #333;">47</td>
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$28.00</strong></td>
    </tr>
    <tr>
      <td>8 GB</td>
      <td style="background-color: #e1bee7; color: #333;">Launch</td>
      <td style="background-color: #e1bee7; color: #333;">Performance-2x</td>
      <td style="background-color: #e1bee7; color: #333; text-align: right;"><strong>$282.00</strong></td>
      <td style="background-color: #bbdefb; color: #333;">2 vCPU</td>
      <td style="background-color: #bbdefb; color: #333;">80 GiB</td>
      <td style="background-color: #bbdefb; color: #333;">197</td>
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$82.00</strong></td>
    </tr>
    <tr>
      <td>32 GB</td>
      <td style="background-color: #e1bee7; color: #333;">Scale</td>
      <td style="background-color: #e1bee7; color: #333;">Performance-4x</td>
      <td style="background-color: #e1bee7; color: #333; text-align: right;"><strong>$962.00</strong></td>
      <td style="background-color: #bbdefb; color: #333;">8 vCPU</td>
      <td style="background-color: #bbdefb; color: #333;">340 GiB</td>
      <td style="background-color: #bbdefb; color: #333;">797</td>
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$324.00</strong></td>
    </tr>
    <tr>
      <td>64 GB</td>
      <td style="background-color: #e1bee7; color: #333;">Performance</td>
      <td style="background-color: #e1bee7; color: #333;">Performance-8x</td>
      <td style="background-color: #e1bee7; color: #333; text-align: right;"><strong>$1,922.00</strong></td>
      <td style="background-color: #bbdefb; color: #333;">16 vCPU</td>
      <td style="background-color: #bbdefb; color: #333;">680 GiB</td>
      <td style="background-color: #bbdefb; color: #333;">997</td>
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$636.00</strong></td>
    </tr>
  </tbody>
</table>

- Only RAM sizes available on both providers are shown.
- AMD Performance core pricing shown on DigitalOcean, in order to have the higher ones to compare. In reality, the true entry-level instance starts at $12, which has been working well for me.
- The above is only compute, storage is billed per-GB on both providers, but DigitalOcean makes you buy a minimum of 10GB on the smallest plan, which works out to about $2.15 which gets added to the $12 and how I ended at ~$15.

## How to actually connect to the DigitalOcean database from your Fly.io Elixir app.

If you ran `fly launch` on your Phoenix app (I will never get over how easy that is), you will basically have [this clustering setup, which is 100% up to date as Oct 21, 2025](https://fly.io/docs/elixir/the-basics/clustering/).

You will also have a `DATABASE_URL` secret environment variable that your app reads at boot to connect to the DB via connection string.

You only need to do two things.

1. Change this one line in `rel/env.sh.eex` from:

```bash
export ECTO_IPV6="true"
```

to:

```bash
export ECTO_IPV6="false"
```

2. Get the DB connection string from DigitalOcean, and set it on your Fly.io app. Makes sure to put quotes around the connection string before running the command with:

```bash
fly secrets set DATABASE_URL="your-connection-string-in-quotes"
```

That's it. You are done. Your app will restart, but it should start working immediately after the first boot with these two settings changed. Try `fly logs` to keep an eye on what is happening.

## Password Only Security

This is just for my side projects, and I am storing zero personal or sensitive data. So I have made the decision for now to live with the fact that if someone had my connection string, they could steal the data, or even write bad data to the DB. In a scenario where your business is making any money, you should set up at least IP allow-listing or some other firewall layer so that a bad actor would need more than just your DB connection string.

One layer of security that I have in place to limit the possible impact is that I use Auth0 for all my apps, so if my database was compromised and my users used the same password on my app as they did on Gmail... the bad guys would not have my users' Gmail passwords. Those would still be safe with Auth0.

If one of my side projects grew to the point where it mattered, I could always move the database or move the app so that they are co-located in the same cloud and then have the DB set up to only allow connections from the app that is supposed to access it.
