---
layout: post
title: How I used VirtualBox snapshots to create my ultimate Linux post install script
---
###I have always wanted a really awesome Linux post install script to automatically install and set up everything I need to start being a productive web developer within an hour after installing Linux.

**I have a few reasons for this:**

1. It's cool
2. I saw thoughtbot created an OSX laptop script (aka, it's cool)
3. I don't like doing tedious, repetitive tasks, which is also why I love programming.
4. It breaks focus when I am in the middle of coding something and I need to apt-get install some dependancy.
5. Installing stuff manually can waste a lot of time, because while I wait for it to download or install I can get distracted.
6. I have taught a lot of people to code and really love getting people started. Windows is great but I don't do development on it, so if you want to "follow me" then I will help you set up your Linux environment so that it is ready to start coding. This means I actually get to use my install script quite often.
7. It gives me the freedom to try out different distros whenever I want. As long as I install Linux at the end of the day and set my script to run, I don't lose any time.

One challenge I always had with not getting my install script tuned quite the way I needed it, was that even while running a bootcamp, I use it less than once per week. So if I needed 25 iterations to get it where I wanted it, that's over half a year. The other problem is that if something fails halfway through installing things, you can't fix it and see it working in it's fixed state, you have to fix it and wait for next time to see the results, which kills motivation. I was slowly making my way through this process with no end in sight when I got annoyed and decided to solve this once and for all.

###Enter, VirtualBox Snapshots
It's like Git for a Virtual Machine. It allowed me take a couple of hours and run my script many times over.

**Here are the steps I took:**

1. Install Linux Mint in a VirtualBox (I switched from Ubuntu to Mint as my main distro this year).
2. Take a Snapshot.
3. Run my script.
4. When something fails I fix the part of the script that caused it to fail.
5. Restore to the snapshot. (This is instant on an SSD).
6. Repeat steps 3-5 until the whole thing runs without any problems.

Here is my current post-install script. <a href="https://github.com/dewetblomerus/linux-laptop" target="_blank">linux-laptop</a>
