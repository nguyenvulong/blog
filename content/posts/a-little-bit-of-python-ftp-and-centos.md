---
title: A little bit of Python, FTP and CentOS
description: Using a few lines of Python's ftplib against a vsftpd server on CentOS to see how FTP connections look in netstat.
date: 2013-10-19T17:11:00+00:00
url: /a-little-bit-of-python-ftp-and-centos/
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
> **Update (2026):** This post was written for CentOS 6 (`yum`, `service`). CentOS 6 and 7 are end of life; on a current distribution (e.g. Rocky/AlmaLinux with `dnf`, or Debian/Ubuntu with `apt`) install `vsftpd` and use `systemctl start vsftpd`. Plain FTP is unencrypted, so prefer SFTP or FTPS for anything beyond experiments. The `ftplib` code below works on Python 3 as is.

Today I will approach the system using a few lines of Python code:

- Python: FTP client
- CentOS: FTP server

Let's get started!

FTP uses two ports: **21** and (sometimes) 20 if the server is in active mode, or a random port in passive mode (we'll see this in this post).

First, install `vsftpd` and `ftp` on your server:

```bash
yum install -y vsftpd   # FTP server
yum install -y ftp      # FTP client
service vsftpd start
```

Check whether the FTP service is listening on port 21:

![netstat output showing vsftpd listening on port 21](/wp-content/uploads/2013/10/ftp1.png)

That's the server side. Now on the client, open Python IDLE and run this:

```python
from ftplib import FTP

f = FTP('ip_address_my_ftp_server')
f.login('anonymous', 'anonymous')  # anonymous login
# f.quit()  # omitted on purpose, explained below
```

Check netstat again and you will see what is happening:

![netstat output showing an established FTP connection](/wp-content/uploads/2013/10/ftp2.png)

Here `113.170.87.128:24567` is my computer's IP address and the port number that the FTP server picked at random (passive mode).

Because `f.quit()` was not executed, the connection is still open, which is why you see `ESTABLISHED` above. If `f.quit()` is executed, the connection closes before you can see anything.

Try it as many times as you like. This picture was taken when I used `f.quit()` to close a connection to the CentOS FTP server:

![netstat output after closing the connection with f.quit()](/wp-content/uploads/2013/10/ftp3.png)

Have fun. I will write more about this in the next few days; we're just scratching the surface, but it's fun, right?
