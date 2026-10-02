---
title: Một số lưu ý khi cứu hộ Windows
description: Vài lưu ý khi mua máy cũ và cứu hộ Windows: BitLocker, USB boot đa năng, GParted và chuẩn UEFI/MBR.
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
- **BitLocker:** khi mua máy cũ, tuyệt đối lưu ý BitLocker có đang bật hay không. Nếu có thì nên cài lại hệ điều hành để thiết lập lại khóa, vì thỉnh thoảng Windows sẽ hỏi khóa khi khởi động, quên là xác định. Ngoài ra còn một số workaround khi dùng BitLocker.
- **USB boot:** nên dùng phần mềm multiboot cho tiện, ví dụ YUMI để boot cùng lúc GParted, System Rescue, Windows/Linux…
- **GParted:** phân biệt **delete** và **clean**, vì **clean** sẽ xóa toàn bộ phân vùng (partition) trên ổ cứng vật lý (disk).
- **Kiến trúc và chuẩn boot:** ưu tiên bản **amd64** vì hầu hết thiết bị bây giờ đều hỗ trợ. Tuy nhiên mình vẫn thấy nhiều máy đời mới dùng **MBR/Legacy BIOS** thay vì **UEFI**.

_Bài đang cập nhật…_
