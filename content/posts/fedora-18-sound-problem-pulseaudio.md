---
title: fedora 18 sound problem pulseaudio
description: Cách khắc phục lỗi mất âm thanh sau khi cài Fedora 18 KDE bằng cách khởi động lại PulseAudio.
date: 2013-06-27T16:38:58+00:00
url: /fedora-18-sound-problem-pulseaudio/
categories:
  - IT
  - Linux
tags:
  - audio problem
  - fedora 18 audio
  - pulseaudio

---
> **Update (2026):** Fedora 18 đã hết hỗ trợ từ lâu. Các bản Fedora hiện đại dùng PipeWire thay cho PulseAudio; nếu mất âm thanh, thử `systemctl --user restart pipewire pipewire-pulse wireplumber`.

After installing Fedora 18 KDE and updating it, I got a sound problem and solved it with this workaround. Open a terminal and run:

```bash
# kill the running PulseAudio process
pulseaudio -k

# start it again; nohup keeps it running even if you close the terminal
nohup pulseaudio -vv > /dev/null 2>&1 &
```

I have no idea why a reboot didn't fix it (maybe PulseAudio was respawned in the same broken state after boot), but anyway it worked. Hope it helps :P
