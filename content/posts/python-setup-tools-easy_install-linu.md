---
title: Python setup tools easy_install Linux
author: admin
type: post
date: 2013-07-19T08:41:30+00:00
url: /python-setup-tools-easy_install-linu/
al2fb_facebook_link_id:
  - 100423586784297_197464460413542
al2fb_facebook_link_time:
  - 2013-07-19T08: 41:34+00:00
al2fb_facebook_link_picture:
  - post=..//?al2fb_image=1
categories:
  - IT
  - Linux
tags:
  - install python set up tools
  - install virtualenv
  - python

---
Let&#8217;s not use easy_install anyway: <https://packaging.python.org/discussions/pip-vs-easy-install/>

<https: //stackoverflow.com/questions/3220404/why-use-pip-over-easy-install>

Cai dat easy_install cho linux, unix :

I ran into a bit of trouble installing easy_install, after reading many useless articles, this is how I solved the problem,  actually it&#8217;s rather simple :

Type :

wget https: //bitbucket.org/pypa/setuptools/downloads/ez\_setup.py && python ez\_setup.py

and you&#8217;re done .

 

Bonus : to install virtualenv, all you have to do is &#8220;easy_install virtualenv&#8221;
