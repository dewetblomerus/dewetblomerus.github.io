---
layout: post
title: Connecting to a DigitalOcean Managed Postgres from your Elixir Phoenix app on Fly.io
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
      <td style="background-color: #bbdefb; color: #333; text-align: right;"><strong>$12.00</strong></td>
    </tr>
  </tbody>
</table>

- Fly.io is providing a 2-node High-Availability cluster with automatic fallback. So the actual value you will be receiving is 100% comparable, and there is a reason for the $38 price tag.
- The above is only compute, storage is billed per-GB on both providers, but DigitalOcean makes you buy a minimum of 10GB on the smallest plan, which works out to about $2.15 which gets added to the $12 and how I ended at ~$15.
- I'm assuming data integrity & safety with the backup solution is comparable.
- I'm assuming the 2-node HA cluster from Fly would have higher uptime.

## How to actually connect to the DigitalOcean database from your Fly.io Elixir app.

If you ran `fly launch` on your Phoenix app (I will never get over how easy that is), you will basically have [this clustering setup, which is 100% up to date as Oct 21, 2025](https://fly.io/docs/elixir/the-basics/clustering/).

You will also have a `DATABASE_URL` secret environment variable that your app reads at boot to connect to the DB via connection string.

Change the following:

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

3. In `runtime.exs` you will have Repo config for `:prod`. It will look something like this:

```elixir
   config :mobile_worship, MobileWorship.Repo,
     # ssl: true,
     url: database_url,
     pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
     # For machines with several cores, consider starting multiple pools of `pool_size`
     # pool_count: 4,
     socket_options: maybe_ipv6
```

You need to add a line of config to make an SSL connection to DigitalOcean:

```elixir
    ssl: [verify: :verify_none]
```

That's it. You are done. You will need to re-deploy your app, but it should start working immediately after the first boot with these settings changed. Try `fly logs` to keep an eye on what is happening.

## Password Only Security

This is just for my side projects, and I am storing zero personal or sensitive data. So I have made the decision for now to live with the fact that if someone had my connection string, they could steal the data, or even write bad data to the DB. In a scenario where your business is making any money, you should set up at least IP allow-listing or some other firewall layer so that a bad actor would need more than just your DB connection string.

One layer of security that I have in place to limit the possible impact is that I use Auth0 for all my apps, so if my database was compromised and my users used the same password on my app as they did on Gmail... the bad guys would not have my users' Gmail passwords. Those would still be safe with Auth0.

If one of my side projects grew to the point where it mattered, I could always move the database or move the app so that they are co-located in the same cloud and then have the DB set up to only allow connections from the app that is supposed to access it.
