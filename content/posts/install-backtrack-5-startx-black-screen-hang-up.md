---
title: Install Backtrack 5 startx black screen hang up
author: admin
type: post
date: 2013-07-16T04:44:32+00:00
url: /install-backtrack-5-startx-black-screen-hang-up/
al2fb_facebook_link_id:
  - 100423586784297_196639183829403
al2fb_facebook_link_time:
  - 2013-07-16T04: 44:37+00:00
al2fb_facebook_link_picture:
  - post=../wp-content/uploads/2013/07/bt-boot-300x187.jpg
categories:
  - IT
  - Linux
tags:
  - black screen backtrack
  - install backtrack
  - startx black screen

---
Cài đặt Backtrack 5, bị treo sau khi &#8220;startx&#8221;

I encountered this problem whilst I was installing Backtrack 5 R3 using USB (multiboot)

Well, I did google it and really found some helps, but after all I had to fix it myself

If you have googled and try this** <span style="color: #ff0000;">but not sucess :</span>**

  1. Edit the file /etc/default/grub
  2. Find the line: GRUB\_CMDLINE\_LINUX_DEFAULT=&#8221;text splash nomodeset vga=791&#8243;
  3. Change it to: GRUB\_CMDLINE\_LINUX_DEFAULT=&#8221;quiet splash i915.modeset=1 vga=791&#8243;
  4. Save and close the file.
  5. Run update-grub to refresh grub.
  6. Reboot

I guess you got stuck in step 5, you **could not update grub**


![bt-boot-300x187.jpg](/wp-content/uploads/2013/07/bt-boot-300x187.jpg)


move your cursor to the top, BackTrack Text and press TAB to edit

**<span style="color: #ff0000;">A command line appears, all you have to do is replace</span>**

&#8220;text splash nomodeset vga=791&#8221;

by this one :

&#8220;quiet splash i915.modeset=1 vga=791&#8221;

ENTER, and you&#8217;re all set

just remember one thing, <span style="color: #ff0000;">after installation finishes, edit <strong>/etc/default/grub </strong><span style="color: #000000;">and</span> <strong>update-grub , then startx . </strong></span>

By the way, the default password for **root is toor**

 [1]: ../wp-content/uploads/2013/07/bt-boot.jpg
