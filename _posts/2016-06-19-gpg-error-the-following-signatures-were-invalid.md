---
layout: post
title: GPG error rosa Release The following signatures were invalid
---

I got this error message while trying to run `sudo apt-get update`. Here is the full error message:
`W: GPG error: http://extra.linuxmint.com rosa Release: The following signatures were invalid: BADSIG 3EE67F3D0FF405B2 Clement Lefebvre (Linux Mint Package Repository v1) <root@linuxmint.com>`

This is what fixed it:
`sudo rm -rf /var/lib/apt/lists/*`

After removing those, `sudo apt-get update` ran just fine.
