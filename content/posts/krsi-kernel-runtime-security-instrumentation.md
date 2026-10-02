---
title: KRSI – Kernel Runtime Security Instrumentation
description: Ghi chú ngắn về KRSI, cho phép gắn chương trình eBPF vào các LSM hook của Linux để thực thi chính sách bảo mật.
date: 2022-12-08T11:06:30+00:00
url: /krsi-kernel-runtime-security-instrumentation/
categories:
  - IT
  - Linux
  - Security
tags:
  - ebpf
  - instrumentation
  - kernel
  - krsi
  - linux
  - security
---
KRSI (Kernel Runtime Security Instrumentation, xuất hiện từ Linux kernel v5.7) cho phép người dùng cài đặt các LSM hook bằng mã BPF đã biên dịch. Điều này thú vị vì hai lý do:

- **Thay đổi luồng gọi hàm trong kernel:** đây là ứng dụng đầu tiên của eBPF mà mã được chèn có thể từ chối/chặn việc thực thi một số logic của kernel.
- **Linh hoạt:** chương trình eBPF có thể được gắn vào/gỡ ra ngay khi hệ thống đang chạy.

> Lưu ý: trong kernel chính thức, tính năng này hiện được gọi là "BPF LSM".

## LSM

- Trước đây Linux chỉ có Discretionary Access Control (DAC).
- Hiện nay các mở rộng MAC (Mandatory Access Control) trong Linux được cài đặt dưới dạng LSM (Linux Security Modules), bao gồm KRSI, SELinux, v.v.

KRSI, do Google đề xuất (KP Singh, 9/2019), cho phép quản trị viên gắn chương trình BPF vào các LSM hook khác nhau, và có thể trả về lỗi để chặn thao tác đó. Nhờ vậy quản trị viên có thể tự định nghĩa chính sách MAC bằng mã tùy ý.

Kịch bản: các thao tác độc hại được định nghĩa trước sẽ được Falco giám sát và module KRSI thực thi chặn. KRSI phối hợp với eBPF bằng cách gắn chương trình eBPF vào các LSM hook.

## Bật KRSI

Kiểm tra tham số boot hiện tại:

```bash
cat /proc/cmdline
```

Chỉnh sửa tham số boot:

```bash
sudo vim /etc/default/grub
```

Ví dụ:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash foo=bar"
```

Kiểm tra cấu hình LSM, sau đó cập nhật GRUB:

```bash
zgrep CONFIG_LSM= /boot/config-5.12.0-051200-lowlatency
sudo update-grub
```

Sau đó sửa `/etc/default/grub` (thêm `bpf` vào danh sách `lsm=`) rồi chạy lại `update-grub`.
