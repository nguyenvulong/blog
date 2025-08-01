---
title: Bảo mật 2 bước với Authy
author: admin
type: post
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
Nhận tiện có anh chàng bị hacked mất mấy ngàn $, xem tại <a href="www.theverge.com/a/anatomy-of-a-hack" target="_blank">đây</a> hoặc <a href="https: //www.tinhte.vn/threads/mot-nguoi-my-mat-so-bitcoin-tri-gia-3600-va-day-la-cach-anh-ay-bi-hack.2434381/" target="_blank">bản tiếng Việt tại đây</a> mình cài thử Authy thì thấy nó khá tốt, tốt hơn Google Authenticator hay Duo Security ở chỗ nó bảo vệ cả app trên điện thoại (đòi mã pin chẳng hạn, hay có chức năng limit log-in cho 1 device mà thôi)

P/S dù sao thì Authy cũng rất triển vọng ^^

Nên hôm nay mình có chơi ngu 1 chút để test bug của Authy, thực ra vì tò mò là chính, cái này mình post trên VietLuG rồi nên copy lại bỏ vào đây:

&nbsp;

> 1. Em cài Authy vào, thao tác sử dụng thì không vấn đề  
> 2. Em xóa Authy đi, cũng không có gì để nói  
> 3. Em cài lại Authy, thì thấy có 1 mục là &#8220;connected device&#8221; và 1 mục khác là &#8220;device&#8221;, trong connected device có 1 device nên em ngứa tay xóa thử. Cũng không có gì xảy ra
> 
> &nbsp;

<div class="text_exposed_show">
  <blockquote>
    <p>
      4. Em set chế độ &#8220;chỉ cho log-in 1 device&#8221; (cái này khá hay, nếu anh chàng bị hacked hôm bữa mà enable cái của nợ này lên thì thằng hacker cũng bó tay  )<br /> 5. Em xóa Authy<br /> 6. Em cài lại Authy 1 lần nữa, lần này thì không thể verify phone number được nữa, nó đòi em phải log-in vào other device và disable chức năng &#8220;chỉ cho log-in trên 1 device&#8221; đi.<br /> Tất nhiên là em bó tay vì từ đầu chí cuối em chỉ cùng 1 device chứ có cái nào khác đâu. Nên giờ ngồi hóng nó giúp mình. Đã report bug cho nó.
    </p>
    
    <p>
      &nbsp;
    </p>
    
    <p>
      Bug ở đây là gì thì bác nào dùng thử Authy sẽ hiểu rõ hơn, nói chung Authy chưa phân biệt được device cũ và mới.
    </p>
  </blockquote>
</div>
