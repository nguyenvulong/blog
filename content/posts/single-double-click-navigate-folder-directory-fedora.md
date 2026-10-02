---
title: single click, double click to nagivate folder fedora 18
description: How to switch KDE from single-click to double-click for opening folders and files by editing kdeglobals.
date: 2013-06-26T09:21:51+00:00
url: /single-double-click-navigate-folder-directory-fedora/
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
> **Update (2026):** Fedora 18 and KDE 4 are long obsolete. On KDE Plasma 5/6 use *System Settings > Workspace > General Behavior > Clicking files or folders*, and the config now lives in `~/.config/kdeglobals`.

This solution works for Fedora 18 (KDE). If you use another version or distro, give it a try anyway.

Open a terminal and edit the file:

```bash
vi ~/.kde/share/config/kdeglobals
```

Add (below anything that exists) or modify:

```ini
[KDE]
SingleClick=false
```

Log out and log in again and you're all set. You will now need a double-click to navigate into a folder or open an executable file.

Thanks to Peterius: [LinuxQuestions thread](https://www.linuxquestions.org/questions/linux-newbie-8/single-click-double-click-icons-in-kde-561262/)
