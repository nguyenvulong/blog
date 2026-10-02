---
title: Install Backtrack 5 startx black screen hang up
description: Cách xử lý lỗi màn hình đen khi chạy startx sau khi cài BackTrack 5 R3 từ USB.
date: 2013-07-16T04:44:32+00:00
url: /install-backtrack-5-startx-black-screen-hang-up/
categories:
  - IT
  - Linux
tags:
  - black screen backtrack
  - install backtrack
  - startx black screen
---
> **Update (2026):** BackTrack 5 đã ngừng phát triển từ lâu; người kế nhiệm là Kali Linux (cũng có thể dùng Parrot OS). Chỉ nên xem bài này như ghi chép lịch sử.

Cài đặt BackTrack 5 bị treo (màn hình đen) sau khi chạy `startx`.

I encountered this problem while installing BackTrack 5 R3 from a USB stick (multiboot). I googled it and found some help, but in the end I had to fix it myself.

If you have already tried the following and it **did not work**:

1. Edit the file `/etc/default/grub`.
2. Find the line: `GRUB_CMDLINE_LINUX_DEFAULT="text splash nomodeset vga=791"`
3. Change it to: `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.modeset=1 vga=791"`
4. Save and close the file.
5. Run `update-grub` to refresh GRUB.
6. Reboot.

I guess you got stuck at step 5 and **could not update GRUB**.

![BackTrack boot menu](/wp-content/uploads/2013/07/bt-boot-300x187.jpg)

At the boot menu, move the cursor to the top entry (BackTrack Text) and press `TAB` to edit it. A command line appears; replace

```
text splash nomodeset vga=791
```

with

```
quiet splash i915.modeset=1 vga=791
```

Press ENTER and you are all set.

Just remember: **after the installation finishes**, edit `/etc/default/grub`, run `update-grub`, then `startx`.

By the way, the default password for root is `toor`.
