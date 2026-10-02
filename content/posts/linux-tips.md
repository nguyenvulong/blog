---
title: Linux Tips
description: Một số mẹo nhỏ về bash, mạng, VirtualBox và quản lý người dùng trên Linux.
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
> **Update (2026):** bài viết cũ. `ifdown`/`ifup` và `/etc/network/interfaces` đã nhường chỗ cho Netplan / NetworkManager / systemd-networkd trên các bản Ubuntu mới. Các dịch vụ proxy/VPN miễn phí bên dưới có thể không còn hoạt động. Gói `virtualbox-guest-dkms` nay thường được thay bằng `virtualbox-guest-utils`.

## Mẹo bash (zsh cũng dùng được)

Từ [tutorialLinux](https://www.youtube.com/channel/UCvA_wgsX6eFAOXI8Rbg_WiQ):

- `sudo !!`: chạy lại lệnh trước đó với `sudo`
- `ctrl-k`, `ctrl-u`, `ctrl-w`, `ctrl-y`: cắt/dán văn bản trên dòng lệnh
- `less +F` (hoặc `less` rồi `shift-f`) thay cho `tail -f`
- `ctrl-x ctrl-e`: soạn tiếp dòng lệnh trong text editor
- `alt-.`: dán đối số của lệnh trước
- `reset`: khôi phục terminal bị lỗi hiển thị
- `ctrl-a`, `ctrl-e`: về đầu / cuối dòng

[Tìm chính xác một từ](https://www.regular-expressions.info/wordboundaries.html) với `grep -w`:

```bash
echo "This island is beautiful" | grep -w is
```

[Xem tất cả ổ đĩa/phân vùng](https://askubuntu.com/questions/182446/how-do-i-view-all-available-hdds-partitions):

```bash
sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
```

[Cắt chuỗi con trong bash](https://stackabuse.com/substrings-in-bash/):

```console
$ echo "abcdefghi" | cut -c2-6
bcdef
```

![Ví dụ cắt chuỗi con trong bash](/wp-content/uploads/2014/07/bashtrick.png)

## Locale

[Python locale error: unsupported locale setting](https://stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting):

```bash
export LC_ALL=C
```

Về lâu dài, lỗi này có thể giải quyết triệt để nếu hiểu locale của máy local và máy remote. [todo]

## Khác

- Khoá màn hình: `xscreensaver-command -lock`
- Proxy miễn phí: <http://www.publicproxyservers.com/>
- VPN miễn phí, OpenVPN: <https://www.vpnbook.com/freevpn>
- Đổi độ phân giải màn hình Ubuntu trong VirtualBox: `sudo apt-get install virtualbox-guest-dkms`
- Nhiều phiên bản Python trên mọi distro: dùng conda hoặc virtualenv.
- Repo EPEL cho CentOS / RedHat / Fedora: [hướng dẫn của Rackspace](http://www.rackspace.com/knowledge_center/article/install-epel-and-additional-repositories-on-centos-and-red-hat)
- [Tạo user, đổi mật khẩu từ xa bằng một dòng lệnh](http://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/)
- Nạp lại địa chỉ IP tĩnh (khi IP cũ vẫn còn) ([nguồn](https://askubuntu.com/questions/829700/reload-static-ip-ubuntu-16)):

```bash
sudo ifdown <network interface> && sudo ip addr flush <network interface> && sudo ifup <network interface>
```
