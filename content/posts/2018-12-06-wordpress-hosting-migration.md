---
title: WordPress – hosting migration
author: admin
type: post
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
Backup & Restore:

  * Domain directory (public_html & other sites)
  * SQL (PHPmyadmin)

Setting:

  * DNS
  * wp-config.php
  * SSL 
      * https://www.hostgator.com/generatecsr
      * TLS/SSL
      * GBCclient check

Note:

  * Hosting provider may not install SSL cert by default
  * Use localhost instead of domain in wp-config.php
  * rsync -P<port> -avz source dest
  * compression problem with tar? subpress /dev/null to find error