---
title: '[visudo] Username is not in the sudoers file'
author: admin
type: post
date: 2021-04-20T07:52:54+00:00
url: /visudo-username-is-not-in-the-sudoers-file/
categories:
  - IT
  - Linux
tags:
  - policykit
  - sudo
  - sudoers
  - visudo

---
**Username** is not in the sudoers file. This incident will be reported

Besides making sure that your username is in sudo group (I think it is), there are other cases that cause this problem. Some of them may have something to do with sudoers file (/etc/sudoers)

in my case, i accidently commented out 1 important line of the file, which is:

`%sudo ALL=(ALL: ALL) ALL`

Since you no longer have **sudo** permission anymore, you would need PolicyKit to fix the **sudoers** file. This fix does not require rebooting the device or console (physical) access. You can do it from your ssh session.


![image.png](/wp-content/uploads/2021/04/image.png)


Now, you can run **pkexec visudo** to fix your **sudoers** file. For more detail, see **<a href="https: //askubuntu.com/questions/73864/how-to-modify-an-invalid-etc-sudoers-file" target="_blank" rel="noreferrer noopener">this</a>**.

 [1]: ../wp-content/uploads/2021/04/image.png
