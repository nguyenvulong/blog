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

  * UpdraftPlus &#8211;> GoogleDrive

Setting:

  * CloudFlare: 
      * DNS (change IP &#8211; A record)
      * TLS/SSL
  * Non CloudFlare: 
      * change DNS record in Domain provider
  * Set up WP on new host with UpdraftPlus plugin to restore data
  * Hosting provider may not install SSL cert by default, you must install it in cPanel/DirectAdmin

Others

<li style="list-style-type: none;">
  <ul>
    <li>
      Use localhost instead of domain in wp-config.php
    </li>
    <li>
      rsync -P<port> -avz source dest
    </li>
    <li>
      compression problem with tar? subpress /dev/null to find error
    </li>
  </ul>
</li>
