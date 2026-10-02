---
title: Apple và sản phẩm liên quan
description: Ghi chú nhanh về cổng sạc iPad, kiểm tra hàng chính hãng, phụ kiện MFi, AppleCare+ và cách xử lý lỗi cài lại macOS.
date: 2020-09-26T05:02:09+00:00
url: /apple-va-san-pham-lien-quan/
categories:
  - Uncategorized
tags:
  - apple
  - ipad
  - MFi
  - sạc apple

---
> **Cập nhật (2026):** Các thông tin về dòng iPad ở dưới là của năm 2020. Các liên kết hỗ trợ của Apple có thể đã đổi địa chỉ.

iPad Air 4 (2020) sẽ theo bước MacBook (từ 2016) để dùng cổng sạc USB-C, trong khi mẫu bình dân hơn là iPad (thế hệ 8, 2020) vẫn dùng cổng Lightning.

## Liên kết hữu ích

- Kiểm tra sản phẩm chính hãng Apple: <https://support.apple.com/en-us/HT204566>
- Tra cứu phụ kiện được chứng nhận MFi (tương thích với sản phẩm Apple): <https://mfi.apple.com/account/accessory-search>
- Mua AppleCare+: <https://mysupport.apple.com/add-coverage/producttypes>
- Hard reset (force restart) iPhone: <https://support.apple.com/guide/iphone/force-restart-iphone-iph8903c3ee6/ios>

## Lỗi khi cài lại macOS

Cài lại macOS đôi khi dính lỗi ["El Capitan" installer loop: "no packages were eligible for install"](https://apple.stackexchange.com/questions/394259/mac-stuck-in-el-capitan-installer-loop-no-packages-were-eligible-for-install).

Cách xử lý: mở Terminal và gõ `date 0615123417` để chỉnh ngày về tháng 6 năm 2017. Như thế các gói phần mềm sẽ được xác thực (valid). Khởi động lại máy và tiếp tục quá trình cài đặt.
