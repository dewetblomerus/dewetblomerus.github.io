---
layout: post
title: Why I Symlinked Every Folder In My Home Directory
---
<img src='../../../assets/post-images/symlinks-screenshot.webp' height='300'>

### Why I don't have a home folder partition
You might think that the problem I am solving here can very easily be solved by creating a `home` folder partition. It's dead simple and well documented, what can go wrong?

Well, my personal preference is to keep my installation on my laptop as long as possible. From the time 14.04 was released until close to the time 16.04 was released I worked every day on the exat same installation of 14.04. So if I am going to reinstall the OS, I have a reason for LEAVING my current installation and putting an end to the relationship. If I had a `/home` partition I would then need to decide which things are settings I want to throw away, which hidden config files might be a part of my reason for leaving. Or I need to format it, which totally defeats the purpose of having it. So when I reinstall I NUKE!

### I didn't want to move my stuff around anymore
I love the comfort and freedom that comes from getting to set up my entire development environment with a script, it works great and [here is how I did it.]({% post_url 2016-04-24-how-i-used-virtualbox-snapshots-to-create-my-ultimate-linux-post-install-script %})

It lets me completely set up a development environment anywhere in a couple of minutes and my own laptop can have everything installed within an hour after reinstalling the OS.

This past week I benefited from this twice. The first time when I upgraded to Linux Mint 18. The second time when I discovered a weird triple monitor bug that was introduced in Mint 18 so I installed Ubuntu 16.04 which I am now happily using. I am not married to either, for me an operating system needs to be boring, free, have-built-in-window-management-keyboard-shortcuts and let me install everything with scripts. I am much more interested in what I can create with it than what favor of Linux I'm using.

The problem was that every time I need to reinstall I need to move all my stuff, and because I have many tiny files, they go slow even over SATA. Last night I <a href='https://www.youtube.com/watch?v=PJjHfa5yxlU' target='_blank'>watched a talk by Sandy Metz</a> which made me think of my problem as a coupling problem.

### My data and my methods were coupled too tightly

If the applications on the computer, acting on the data is like methods or functions, and the data is all the stuff I need to keep and bring to the next installation, I needed a way to decouple this.

### Here's what I did

The goal with these instructions is to create a separate partition on my SSD where I keep all my 'homy?' stuff but the OS does not mout it as `/home` it is just mounted as `media/dewet/ssd`

1) Here are the partitions I created during installation

    17 gig /swap #I have 16 gigs ram and want the option to hibernate with 10 vm's running if I felt like it
    30 gig / #Linux creates all of it's stuff in here, including my home folder
    the rest of the ssd /media/dewet/ssd #I could ignore this and do it later by partitioning with disk utility and setting the mount point with `fstab` but the option is in the install gui

2) Then after installing I delete every directory in my `home` folder except for my Desktop which Ubuntu didn't allow and I don't care becasue I don't usually keep stuff there.

3) Copy all of my backed up Home folder to the root of the partition mounted at `/media/dewet/ssd`

4) Run this

    S=(bin code dewetblomerus.github.io Documents Downloads Dropbox Music Pictures Public Templates Videos VirtualBox-VMs);
    SSDPATH=/media/dewet/ssd
    for i in ${FOLDERS[@]}
    do
      rm -f ~/$i
      ln -s $SSDPATH/$i ~/$i
    done

That is an Array and a For loop in Bash that creates Symlinks. The `rm` deletes the symlinks if they exist which makes the script idempotent and potentially dangerous.

This file is a part of my whole <a href='https://github.com/dewetblomerus/linux-laptop' target='_blank'>laptop setup script repo</a>

