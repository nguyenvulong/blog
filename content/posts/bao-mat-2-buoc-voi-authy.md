---
title: Bảo mật 2 bước với Authy
description: Trải nghiệm dùng Authy cho xác thực hai bước và một lỗi nhận diện thiết bị mình phát hiện khi thử nghiệm.
date: 2015-03-13T18:10:00+00:00
url: /bao-mat-2-buoc-voi-authy/
categories:
  - IT
  - Security
tags:
  - 2 buoc
  - 2 factor authentication
  - 2fa
  - authy
  - bao mat
  - duo security
  - google authenticator

---
> **Cập nhật (2026):** Bài viết từ năm 2015; lỗi mô tả bên dưới có thể đã được khắc phục, và tính năng của Authy cũng như các ứng dụng 2FA khác (Google Authenticator hiện có đồng bộ sang tài khoản Google, v.v.) đã thay đổi nhiều. Hãy kiểm tra lại tính năng hiện tại trước khi chọn ứng dụng. Chỉ nên bật xác thực hai bước bằng ứng dụng (hoặc khóa bảo mật) thay vì SMS nếu có thể.

Nhân vụ có anh chàng bị hack mất mấy ngàn đô, xem [tại đây](https://www.theverge.com/a/anatomy-of-a-hack) hoặc [bản tiếng Việt tại đây](https://www.tinhte.vn/threads/mot-nguoi-my-mat-so-bitcoin-tri-gia-3600-va-day-la-cach-anh-ay-bi-hack.2434381/), mình cài thử Authy thì thấy nó khá tốt. Authy tốt hơn Google Authenticator hay Duo Security ở chỗ nó bảo vệ cả ứng dụng trên điện thoại (đòi mã PIN chẳng hạn, hoặc giới hạn đăng nhập trên một thiết bị duy nhất).

P/S: dù sao thì Authy cũng rất triển vọng ^^

## Thử nghiệm tìm lỗi của Authy

Hôm nay mình "chơi dại" một chút để test lỗi của Authy, chủ yếu vì tò mò. Mình đã đăng nội dung này trên VietLUG nên chép lại vào đây:

> 1. Em cài Authy vào, thao tác sử dụng thì không vấn đề.
> 2. Em xóa Authy đi, cũng không có gì để nói.
> 3. Em cài lại Authy, thấy có một mục là "connected device" và một mục khác là "device". Trong connected device có một thiết bị nên em ngứa tay xóa thử. Cũng không có gì xảy ra.
> 4. Em đặt chế độ "chỉ cho đăng nhập trên một thiết bị" (cái này khá hay, nếu anh chàng bị hack hôm bữa mà bật cái này lên thì hacker cũng bó tay).
> 5. Em xóa Authy.
> 6. Em cài lại Authy một lần nữa, lần này thì không thể xác minh số điện thoại được nữa, nó đòi em phải đăng nhập vào thiết bị khác và tắt chức năng "chỉ cho đăng nhập trên một thiết bị". Tất nhiên em bó tay vì từ đầu đến cuối em chỉ dùng cùng một thiết bị chứ có cái nào khác đâu. Nên giờ ngồi hóng nó giúp mình. Đã report bug cho nó.
>
> Bug ở đây là gì thì bác nào dùng thử Authy sẽ hiểu rõ hơn; nói chung Authy chưa phân biệt được thiết bị cũ và mới.
