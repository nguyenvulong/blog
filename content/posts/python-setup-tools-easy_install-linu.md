---
title: Python setup tools easy_install Linux
description: Cách cài easy_install trên Linux/Unix (cách cũ), kèm ghi chú nên dùng pip.
date: 2013-07-19T08:41:30+00:00
url: /python-setup-tools-easy_install-linu/
categories:
  - IT
  - Linux
tags:
  - install python set up tools
  - install virtualenv
  - python

---
> **Update (2026):** `easy_install` và `ez_setup.py` đã bị deprecated và gỡ khỏi setuptools; script tải từ Bitbucket bên dưới cũng không còn dùng được. Hãy dùng `pip` (`python3 -m pip install ...`) và `python3 -m venv` để tạo môi trường ảo. Bài này chỉ giữ lại để tham khảo.

Let's not use easy_install anyway:

- [pip vs easy_install (Python Packaging User Guide)](https://packaging.python.org/discussions/pip-vs-easy-install/)
- [Why use pip over easy_install? (Stack Overflow)](https://stackoverflow.com/questions/3220404/why-use-pip-over-easy-install)

Cài easy_install cho Linux, Unix: mình gặp chút rắc rối khi cài, đọc nhiều bài vô ích, cuối cùng cách giải quyết thực ra khá đơn giản:

```bash
wget https://bitbucket.org/pypa/setuptools/downloads/ez_setup.py && python ez_setup.py
```

Vậy là xong.

Bonus: để cài virtualenv, chỉ cần chạy `easy_install virtualenv`.
