---
layout: post
title: How to flash my Ergodox Firmware
---

My version of the firmware closely follows the partial-rewrite branch of ben-blazak.
My working branch is also the partial-rewrite branch.

The link to my Github repo
<a href="http://github.com/dewetblomerus/ergodox-firmware" target="_blank">http://github.com/dewetblomerus/ergodox-firmware</a>

### Steps to set up when on a new computer

1. Make sure all the stuff needed to compile is installed `sudo apt-get install gcc-avr binutils-avr avr-libc`
2. Set up the Linux Dev Rules and install Teensy Loader
<a href="http://pjrc.com/teensy/loader_linux.html" target="_blank">http://pjrc.com/teensy/loader_linux.html</a>


### Steps to edit the layout and flash the firmware
1. Edit the layout file at `/firmware/keyboard/ergodox/layout`
2. `cd` to `/firmware` and run the `make` command to compile the firmware with your new layout
3. This will generate a new `firmware.hex` file and place it in the `/firmware` directory
3. Run the Teensy Loader to flash the new `firmware.hex` file to the keyboard



