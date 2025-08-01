---
title: fedora 18 sound problem pulseaudio
author: admin
type: post
date: 2013-06-27T16:38:58+00:00
url: /fedora-18-sound-problem-pulseaudio/
al2fb_facebook_exclude:
  - 1
categories:
  - IT
  - Linux
tags:
  - audio problem
  - fedora 18 audio
  - pulseaudio

---
after installing fedora 18 KDE and have it updated, I got this problem and solved it by workaround :

open command line interface and type :

pulseaudio -k #to kill the process

nohup pulseaudio -vv & > /dev/null # run it again and even you disconnect from the terminal, it still running

&nbsp;

well, I have no idea why the reboot didn&#8217;t kill it (or may be it has been respawned after reboot), but anyway it worked and hope it helps : P
