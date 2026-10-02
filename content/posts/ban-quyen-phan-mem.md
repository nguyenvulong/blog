---
title: Bản quyền phần mềm
description: Những lưu ý quan trọng về giấy phép phần mềm, đặc biệt là hiểu lầm phổ biến về GPL khi chạy phần mềm trên Linux.
date: 2021-04-02T05:58:18+00:00
url: /ban-quyen-phan-mem/
categories:
  - IT
tags:
  - ban quyen
  - software license

---
Có rất nhiều loại bản quyền (license) dành cho phần mềm. Định nghĩa của chúng thì dễ tìm, nhưng mọi người hay thắc mắc loại nào được thương mại hóa mà không phải cung cấp mã nguồn. Bài này trích ra một số lưu ý quan trọng.

## GPL

GPL (GNU General Public License) là loại license mà nhiều người e dè nhất, nên bạn hãy đọc [câu trả lời này](https://opensource.stackexchange.com/questions/10223/should-i-publish-everything-running-on-linux-under-gpl). Nói ngắn gọn: bạn không cần mở mã nguồn phần mềm của mình chỉ vì nó chạy trên Linux (mặc dù kernel Linux dùng license GPL).

> You don't have to publish your Linux software under the GPL. You are of course welcome to do so, but you are under no legal obligation.
>
> You've taken a mental shortcut: "using a GPL library means I have to license under GPL". But the GPL (and copyright law in general) doesn't care about what other software you *use*, but only whether your software is a *derivative work* of the GPL-covered software. For example, a software might be derivative if it is a modification of the original software, or if it includes the original software (in whole or in part). Using a library means *linking* the library, and the act of linking includes parts of the library in your program.
>
> But when you write a software that runs on Linux, you are not including or modifying any part of Linux. Your software is not a derivative work of Linux. Thus, the license of the Linux kernel doesn't affect the license of the software running on it. (In fact, there is lots of software running on Linux that's completely incompatible with the GPLv2, such as Apache-2 licensed software or proprietary software.)
>
> (For technical reasons the Linux kernel actually does inject the [vdso](https://en.wikipedia.org/wiki/VDSO) pseudo-library into every running process as part of Linux' implementation of syscalls. But this is widely considered to be no licensing problem.)
>
> Also, GPL does not mean that you have to *publish* your software. **If** your software is derivative of GPL-covered code **and** if you publish the software **then** the software as whole can only be licensed under the GPL. The GPL's requirements only trigger when you give a copy of your software to someone else.

## Các license dễ chịu hơn

MIT và Apache 2.0 là những license rất dễ chịu: cho phép bạn thương mại hóa mà không phải cung cấp mã nguồn.

*Bài viết đang được cập nhật.*
