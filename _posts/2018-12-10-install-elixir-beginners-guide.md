---
layout: post
title: Complete Beginners Guide for installing Elixir with Kiex on Ubuntu 18.04
---

By _Complete_ I don't mean you are a complete beginner to programming. You will
need to know how to type these commands in your terminal or ask for help. I mean
that the guide is complete. This guide should get everything installed for you
to start following any Elixir tutorial, including Kiex which will enable you to
switch between Elixir versions for different guides.

### Install Dependencies, this is the only part that would be different on OSX.

```shell
sudo apt update
sudo apt purge erlang
sudo apt autoremove -y
sudo apt install bash curl erlang git make openssl vim -y
```

### Check your Erlang Version

```shell
erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell
# This should be 20 or higher
```

### Install Kiex

```shell
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
```

### Check if Kiex is installed

```shell
kiex
```

### Add what is in the quotes to your .rc file or copy/paste the whole command into your terminal which will add the relevant bits to the bottom of your .bashrc

```shell
echo 'test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"' >> .bashrc
```
