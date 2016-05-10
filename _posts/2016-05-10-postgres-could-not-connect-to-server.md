---
layout: post
title: Postgres could not connect to server because rails was connecting to it on the wrong port
---

So this tripped me up today and initial googling was not very helpful, maybe because I did not zero in on the right part of the error soon enough, but I hope you find this helpful.

I created a new Rails app and set up a Postgres database on my development machine. Then as soon as I tried to run `rake db:create`, I got the following error

    could not connect to server: Connection refused
        Is the server running on host "localhost" (127.0.0.1) and accepting
        TCP/IP connections on port 5432?

I ended up going down a different route, trying to figure out if the server is running, googling and renaming a pid file, etc.....

When I finally zeroed in on the port number at the end, I learned that I can check what port Postgres is listening on with `sudo -u postgres psql -c "SHOW port;"`

This showed me that postgres was running on 5433 while Rails was trying to connect to 5432. All I had to do was add a line in my `database.yml` to specify the port.

    default: &default
      adapter: postgresql
      encoding: unicode
      host: localhost
      port: 5433
      username: postgres
      password: postgres
      pool: 5

Full disclosure, my username and password is something else, but if you are setting up Postgres in development for the first time, you can get away with these.

Problem solved!
