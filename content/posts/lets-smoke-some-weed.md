---
title: Let’s smoke some weed
description: Bộ sưu tập ghi chú và đường link về Linux, Python, machine learning, web và bảo mật.
date: 2014-10-13T07:34:05+00:00
url: /lets-smoke-some-weed/
categories:
  - IT

---
> **Update (2026):** đây là bản ghi chú cũ nên nhiều mục đã lỗi thời. `apt-key` đã bị deprecated (nên đặt khoá trong `/etc/apt/keyrings` hoặc dùng `signed-by`), Volatility 2 đã được thay bằng Volatility 3, và một số link có thể đã chết.

## Ghi chú nhanh

- MariaDB không đổi được mật khẩu root (do plugin `unix_socket`): xem [Authentication Plugin – Unix Socket](https://mariadb.com/kb/en/authentication-plugin-unix-socket/).
- Sửa lỗi pip hỏng sau khi cập nhật hệ thống: [StackOverflow](https://stackoverflow.com/questions/50157653/python3-pip-broken-since-system-update).

Ubuntu: cập nhật tất cả khoá hết hạn từ keyserver bằng một lệnh:

```bash
sudo apt-key list | \
 grep "expired: " | \
 sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | \
 xargs -n1 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys
```

## Python

- [PyInstaller](https://github.com/pyinstaller/pyinstaller)
- [virtualenv](https://virtualenv.pypa.io/en/latest/)
- Khoa học dữ liệu: pandas, numpy, scikit-learn, scipy, matplotlib, PyTables (h5py: định dạng file HDF5)
- `zipfile`:
  - [Cấu trúc PKZIP](https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html)
  - [Ví dụ code (PyMOTW)](https://pymotw.com/2/zipfile/)
  - [Bản sửa đổi của Android](https://android.googlesource.com/platform/libcore/+/25681be69e19a834b00cfbf54cd99ac13f12b9ff/luni/src/main/java/java/util/zip)

## Công cụ

- [Kiểm tra cú pháp SQL online](https://www.eversql.com/sql-syntax-check-validator/)
- [Chuyển bảng sang LaTeX](https://www.tablesgenerator.com/latex_tables)
- [Inkscape](https://inkscape.org/en/): vẽ và xuất sang nhiều định dạng
- [Vim](https://danielmiessler.com/study/vim/)
- [Khoá học Linux (LabEx)](https://labex.io/lab/2)
- [Top 10 thuật toán mọi software engineer nên thuộc (Quora)](https://www.quora.com/What-are-the-top-10-algorithms-every-software-engineer-should-know-by-heart)
- [Daniel Shiffman – Nature of Code, toán và lập trình](https://www.youtube.com/user/shiffman/playlists)

## Machine learning

- <https://www.dataschool.io>
- <https://lazyprogrammer.me/deep-learning-courses/>
- <http://adventuresinmachinelearning.com/neural-networks-tutorial/>
- [Machine Learning Crash Course (Google)](https://developers.google.com/machine-learning/crash-course/)
- [Machine Learning cơ bản (Tiệp Vũ)](https://tiepvupsu.github.io/2016/12/26/introduce/)

Một số khoá về deep learning / reinforcement learning trên Udemy:

- [Artificial Intelligence: Reinforcement Learning in Python](https://www.udemy.com/artificial-intelligence-reinforcement-learning-in-python/)
- [Deep Reinforcement Learning in Python](https://www.udemy.com/deep-reinforcement-learning-in-python/)
- [Artificial Intelligence for Business](https://www.udemy.com/ai-for-business/)

## Web development

- [Let's Build A Web Server (Ruslan Spivak)](https://ruslanspivak.com/lsbaws-part1/)

## Security

- [MalwareTech](https://www.malwaretech.com/): hooking
- [Mobile Security Wiki](https://mobilesecuritywiki.com/)
- [Website Hacking 101 (InfoSec Institute)](http://resources.infosecinstitute.com/website-hacking-101/)
- [VulnHub](https://www.vulnhub.com/resources/)
- [HackThis!!](https://www.hackthis.co.uk/)
- [Hackaserver](https://hackaserver.com)
- [Hack.me](https://hack.me/)
- [YARA signature exchange](http://www.deependresearch.org/2012/08/yara-signature-exchange-google-group.html)

## Một số project hay

- [Cuckoo Sandbox](https://cuckoosandbox.org)
- [Volatility](https://github.com/volatilityfoundation/volatility)
- [cve-search](https://github.com/wimremes/cve-search)
- [VirusTotalApi](https://github.com/doomedraven/VirusTotalApi)
- [WiFi-Pumpkin](https://github.com/P0cL4bs/WiFi-Pumpkin)

## Ảnh

- [PhotoFunia – hiệu ứng caricature](https://photofunia.com/effects/caricature)

_[đang cập nhật…]_
