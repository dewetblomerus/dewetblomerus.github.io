---
layout: post
title: master.tmate.io lookup failure or ssh.tmate.io lookup failure
---
This error used to show up as `master.tmate.io lookup failure` but lately it's `ssh.tmate.io lookup failure`

Hardcode an IP address for master.tmate.io in /etc/hosts

Here's the Gitbug issue where I found the solution

https://github.com/nviennot/tmate/issues/32

Here is how:

1. Get the IP address for master.tmate.io by running `host master.tmate.io` at the command line. You will see several IP addresses, pick the first one.
2. Open your `/etc/hosts` file by typing `sudo vi /etc/hosts`
3. Put the ip address you copied at the top of the top of the file, with ssh.tmate.io after it like this: `the-ip-address ssh.tmate.io`.
