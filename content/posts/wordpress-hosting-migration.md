---
title: WordPress – hosting migration
description: Ghi chú ngắn về các bước chuyển một site WordPress sang hosting mới bằng UpdraftPlus.
date: 2018-12-06T05:34:28+00:00
url: /wordpress-hosting-migration/
categories:
  - IT
  - Wordpress
tags:
  - hostgator
  - migration
  - wordpress

---
**Backup & restore**

- UpdraftPlus -> Google Drive

**Setting**

- Cloudflare:
  - DNS (change IP, A record)
  - TLS/SSL
- Non-Cloudflare: change the DNS record at the domain provider
- Set up WordPress on the new host and use the UpdraftPlus plugin to restore data
- The hosting provider may not install an SSL cert by default; you must install it in cPanel/DirectAdmin

**Others**

- Use `localhost` instead of the domain in `wp-config.php`
- `rsync -P -e "ssh -p <port>" -avz source dest`
- Problems with `tar` compression? Redirect output to `/dev/null` so only errors are shown, to find the error
