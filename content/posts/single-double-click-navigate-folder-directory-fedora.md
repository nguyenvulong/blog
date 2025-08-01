---
title: single click, double click to nagivate folder fedora 18
author: admin
type: post
date: 2013-06-26T09:21:51+00:00
url: /single-double-click-navigate-folder-directory-fedora/
al2fb_facebook_exclude:
  - 1
categories:
  - IT
  - Linux
tags:
  - directory
  - double click
  - fedora 18
  - folder
  - naviage
  - single click

---
This solution works for fedora 18 (KDE), if you&#8217;re currently using other versions or distros, just give it a try anyway :

open command line interface :

**vi ~/.kde/share/config/kdeglobals**

add (below anything if exists) or modify this one :

**[KDE]**  
 **SingleClick=false**

log out, log in and you&#8217;re all set . It&#8217;s going to take you a double-click to navigate inside a folder or open an executable file .

&nbsp;

Thanks to : Peterius

http: //www.linuxquestions.org/questions/linux-newbie-8/single-click-double-click-icons-in-kde-561262/
