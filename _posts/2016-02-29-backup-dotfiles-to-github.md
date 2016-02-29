---
layout: post
title: Backup Dotfiles to Github
---

So I was creating some aliases in my .zshrc to quickly create new posts, I realized that the file has grown into something that I quite like and I really don't want to re-make from scratch ever again.

There's also that moment when you know you should spend a few minutes in one of your .dotfiles sharpening your productivity tools, but you don't want to really bother. I think knowing that I have a backup system in place and that whatever time I invest in my .dotfiles is something I can draw dividents from for the rest of my "Linux Hacking Life".

I found an excellent post, telling me exactly how to set this up.

<a href="http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/" target="_blank">Using Git And Github To Manage Your Dotfiles</a> by Michael Smalley

I really like the approach he took and was happy to follow it step by step.

There were just two small gotchas that I figured out quite quickly but it is the type of thing that one can get stuck on & give up the whole process, so here they are, hopefully you or my future self will find them helpful.

1. The `makemysimlinks.sh` script is a tiny bit scary, but ended up being 100% fine.
It copied the directories belonging to zshell & vim to a `dotfiles_old` directory in the home directory. Because I didn't read the script before running it (I know, very irresponsible) I was expecting the `dotfiles_old` in the `~/dotfiles` directory. So for a minute there my Vim wasn't working properly & I didn't know where the directory went.

2. The `oh-my-zsh` installation directory is a Git repo
The way I installed Zshell on Ubuntu was by cloning the Git repository. I really like this method of installation because whenever I want to update it I just cd into it and do a git pull.

This is the first time I dealt with a Git repo inside a Git repo. I added it to a `.gitignore` and did a `git rm -r --cached <your directory>` to stop tracking it and all was well.

After that all was working perfectly, my dotfiles & relevant directories are now pushed to <a href="https://github.com/dewetblomerus/dotfiles" target="_blank">a git repo here</a>

I would suggest you do the same, it will take you way less time to set this up than to have to keep stopping in the middle of your work to go add things to your dotfiles that you forgot when you moved to your new machine.
