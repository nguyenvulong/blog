---
title: Một số lưu ý khi cứu hộ Windows
author: admin
type: post
date: 2020-09-04T06:06:20+00:00
url: /mot-so-luu-y-khi-cuu-ho-windows/
categories:
  - Uncategorized
tags:
  - cứu hộ
  - gparted
  - rescue
  - window

---
 

Khi mua máy cũ, tuyệt đối lưu ý việc BitLocker có đang bật hay không. Nếu có thì nên cài lại hệ điều hành để thiết lập lại khóa. Vì lâu lâu Windows sẽ hỏi trong lúc khởi động, nếu quên là xác định. Ngoài ra còn một số workarounds khi dùng Bitlocker.

Tạo BootUSB nên dùng các phần mềm multiboot để tiện lợi, ví dụ YUMI để boot cùng lúc Gparted, System Rescue CD, Windows/Linux, ..

Khi dùng Gparted, chú ý phân biệt giữa **delete** và **clean**, vì **clean** sẽ xóa toàn bộ volume (partition) trên ổ cứng vật lý (disk).

Khi chọn phần mềm thì ưu tiên **amd64** vì hầu hết các thiết bị bây giờ đều hỗ trợ, tuy nhiên **MBR/Legacy BIOS** thì mình vẫn thấy nhiều máy đời mới hay dùng thay vì **UEFI**.



Bài đang cập nhật..
