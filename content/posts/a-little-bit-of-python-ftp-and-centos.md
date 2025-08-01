---
title: A little bit of Python, FTP and CentOS
author: admin
type: post
date: 2013-10-19T17:11:00+00:00
url: /a-little-bit-of-python-ftp-and-centos/
al2fb_facebook_link_id:
  - 100423586784297_224770991016222
al2fb_facebook_link_time:
  - 2013-10-19T17: 11:06+00:00
al2fb_facebook_link_picture:
  - post=../wp-content/uploads/2013/10/ftp1.png
categories:
  - IT
  - Linux
  - Protocol
  - Python
tags:
  - ftp client
  - ftp connection
  - ftp server
  - python ftp

---
Today I will approach the system using few lines of Python code :

&#8211; Python code : FTP client

&#8211; CentOS server :  FTP server

Let&#8217;s get started !

FTP uses 2 port : **21** and (sometimes) 20 if the server is in active mode &#8211; or a random port (we&#8217;ll see them in this posting)

First of all, you need to install vsftp & ftp on your Server, by using those commands

<pre class="brush: shell">yum install -y vsftpd #this one is for ftp server
yum install -y ftp #this one is for ftp client
service vsftpd start</pre>

Check whether FTP service is listening on port 21


![ftp1.png](/wp-content/uploads/2013/10/ftp1.png)


Alright, that&#8217;s for the server-side, now at your client, open Python IDLE and run this

<pre class="brush: py">from ftplib import FTP
f = FTP('ip_address_my_ftp_server')
f.login('anonymous','anonymous') #I'm using anonymous login
#f.quit() #omit this line, I'll explain below</pre>

Let&#8217;s check the netstat again and you&#8217;ll see what&#8217;s happening here :


![ftp2.png](/wp-content/uploads/2013/10/ftp2.png)


&nbsp;

There you go &#8220;113.170.87.128: 24567&#8221; is my computer&#8217;s ip address and the port number which the ftp-server randomized it (passive mode).

And because **f.quit() **wasn&#8217;t executed, so that the connection is still open, that&#8217;s why you see the line &#8220;ESTABLISHED&#8221; above. If f.quit() executed &#8211; the connection will close before you can see anything happen.

Try as many time as you can, and take a look at this picture &#8211; I was using &#8220;f.quit()&#8221; to close a connection to the CentOS FTP server :


![ftp3.png](/wp-content/uploads/2013/10/ftp3.png)


&nbsp;

Have fun, I will write more about this in the next few days, we&#8217;re just scratching the surface, but it&#8217;s fun, right?

 [1]: ../wp-content/uploads/2013/10/ftp1.png
 [2]: ../wp-content/uploads/2013/10/ftp2.png
 [3]: ../wp-content/uploads/2013/10/ftp3.png
