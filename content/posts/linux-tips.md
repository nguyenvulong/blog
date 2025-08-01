---
title: Linux Tips
author: admin
type: post
date: 2014-07-16T11:29:38+00:00
url: /linux-tips/
categories:
  - IT
  - Linux
tags:
  - linux mint
  - linux tip trick
  - user guide

---
**bash (zsh too) tricks from [tutorialLinux][1]** 

  * sudo !!: re-run previous command in sudo prepended
  * ctrl-k ctrl-u ctrl-w ctrl-y cutting/pasting text
  * less +F /  less then shift-f instead of tail
  * ctrl-x-e to continue editting shell in a text editor
  * alt-. to paste previous command&#8217;s argument
  * reset to reset/unbork your terminal
  * ctrl-a. ctrl-e to move to the start and end

[bash search exact string][2] 

<span class="s1">echo</span> <span class="s3">&#8220;This island is beautiful&#8221;</span> <span class="s2">| </span><span class="s1">grep</span> <span class="s2">-w<span class="Apple-converted-space">  </span>is</span>

[view all available HDD&#8217;s/partitions?][3]

`sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL<br />
` 

<p class="grid--cell fs-headline1 fl1">
  <a class="question-hyperlink" href="https: //stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting">Python locale error: unsupported locale setting</a>:
</p>

> export LC_ALL=C

<div class="grid--cell mr16">
  in fact, this shit can be solved completely if you understand the locale of your host and remote machine. [todo] &#8211; i forgot how it looks like
</div>

**Lock screen: ** &#8216;xscreensaver-command&#8217; -lock

**Free Proxies**

http: //www.publicproxyservers.com/

**Free VPN, OpenVPN**

http: //www.vpnbook.com/freevpn

**VirtualBox Ubuntu screen resolution resizable: **

sudo apt-get install virtualbox-guest-dkms

**multiple Python versions on any distros**:

use conda or virtualenv

**Repositories Centos Redhat Fedor**a epel: http://www.rackspace.com/knowledge_center/article/install-epel-and-additional-repositories-on-centos-and-red-hat

[**Bash cut string substring**][4]

<pre><code class="language-bash hljs">$ &lt;span class="hljs-built_in">echo&lt;/span> &lt;span class="hljs-string">"abcdefghi"&lt;/span> | cut -c2-6
bcdef
</code></pre>


![bashtrick.png](/wp-content/uploads/2014/07/bashtrick.png)


**Create user, change password remotely**

http: //www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/

Reload static ip address (when the old IP adress still persists):  
<span style="background-color: #f2f4f5; color: #222222; font-family: Monaco, Consolas, 'Andale Mono', 'DejaVu Sans Mono', monospace; font-size: 13px; font-style: normal; font-weight: normal;">sudo ifdown <network interface> && sudo ip addr flush <network interface> && sudo ifup <network interface></span>

https: //askubuntu.com/questions/829700/reload-static-ip-ubuntu-16

 [1]: https://www.youtube.com/channel/UCvA_wgsX6eFAOXI8Rbg_WiQ
 [2]: http://www.regular-expressions.info/wordboundaries.html
 [3]: https://askubuntu.com/questions/182446/how-do-i-view-all-available-hdds-partitions
 [4]: https://stackabuse.com/substrings-in-bash/
 [5]: ../wp-content/uploads/2014/07/bashtrick.png
