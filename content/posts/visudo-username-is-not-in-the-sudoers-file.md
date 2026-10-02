---
title: '[visudo] Username is not in the sudoers file'
description: Cách sửa file sudoers khi lỡ comment mất dòng quyền sudo, bằng pkexec visudo qua SSH mà không cần reboot.
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
**Username is not in the sudoers file. This incident will be reported.**

Ngoài việc kiểm tra username đã nằm trong group `sudo`, còn có những nguyên nhân khác gây ra lỗi này, trong đó có liên quan đến file `/etc/sudoers`.

Trong trường hợp của mình, mình lỡ tay comment mất một dòng quan trọng:

```
%sudo ALL=(ALL:ALL) ALL
```

Khi không còn quyền **sudo**, bạn cần dùng PolicyKit để sửa file **sudoers**. Cách này không cần reboot hay truy cập trực tiếp vào máy, bạn có thể làm ngay từ phiên SSH.

![Chạy pkexec visudo để sửa file sudoers](/wp-content/uploads/2021/04/image.png)

Chạy `pkexec visudo` để sửa file sudoers. Chi tiết xem [câu hỏi này trên Ask Ubuntu](https://askubuntu.com/questions/73864/how-to-modify-an-invalid-etc-sudoers-file).
