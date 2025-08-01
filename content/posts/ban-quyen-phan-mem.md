---
title: Bản quyền phần mềm
author: admin
type: post
date: 2021-04-02T05:58:18+00:00
url: /ban-quyen-phan-mem/
categories:
  - IT
tags:
  - ban quyen
  - software license

---
Có rất nhiều loại bản quyền (License) dành cho phần mềm (software program). Về định nghĩa thì có thể tìm thấy dễ dàng. Tuy nhiên đôi khi mọi người hay có thắc mắc về cái nào thì được thương mại hóa mà không phải cung cấp mã nguồn. Bài này mình sẽ trích ra một số lưu ý quan trọng.



GPL (General Publish License) là một trong những thứ mà mình thấy mọi người e dè nhất, các bạn nên đọc cái <a rel="noreferrer noopener" href="https: //opensource.stackexchange.com/questions/10223/should-i-publish-everything-running-on-linux-under-gpl" target="_blank">này</a>. Nói ngắn gọn là bạn không cần phải mở mã nguồn nếu bạn dùng Linux (mặc dù Linux license GPL nhé).

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    You don&#8217;t have to publish your Linux software under the GPL. You are of course welcome to do so, but you are under no legal obligation.
  </p>
  
  <p>
    You&#8217;ve taken a mental shortcut: “using a GPL library means I have to license under GPL”. But the GPL (and copyright law in general) doesn&#8217;t care about what other software you <em>use</em>, but only whether your software is a <em>derivative work</em> of the GPL-covered software. For example, a software might be derivative if it is a modification of the original software, or if it includes the original software (in whole or in part). Using a library means <em>linking</em> the library, and the act of linking includes parts of the library in your program.
  </p>
  
  <p>
    But when you write a software that runs on Linux, you are not including or modifying any part of Linux. Your software is not a derivative work of Linux. Thus, the license of the Linux kernel doesn&#8217;t affect the license of the software running on it. (In fact, there is lots of software running on Linux that&#8217;s completely incompatible with the GPLv2, such as Apache-2 licensed software or proprietary software.)
  </p>
  
  <p>
    (For technical reasons the Linux kernel actually does inject the <a href="https: //en.wikipedia.org/wiki/VDSO">vdso</a> pseudo-library into every running process as part of Linux&#8217; implementation of syscalls. But this is widely considered to be no licensing problem.)
  </p>
  
  <p>
    Also, GPL does not mean that you have to <em>publish</em> your software. <strong>If</strong> your software is derivative of GPL-covered code <strong>and</strong> if you publish the software <strong>then</strong> the software as whole can only be licensed under the GPL. The GPL&#8217;s requirements only trigger when you give a copy of your software to someone else.
  </p>
</blockquote>

Các License khác rất dễ chịu bao gồm MIT và sau đó là Apache 2.0, cho phép bạn thương mại hóa mà không cần phải cung cấp mã nguồn mở.

Bài viết đang được cập nhật.
