---
title: 'Embed all fonts in Word & PDF'
author: admin
type: post
date: 2016-09-14T06:02:42+00:00
url: /embed-all-fonts-in-word-pdf/
categories:
  - IT
tags:
  - doc
  - document
  - dox
  - easychair
  - edas
  - embed all fonts
  - fonts embedded
  - ieee
  - miscrosoft word
  - pdf

---
Bài viết này giúp các bạn khắc phục tình trạng:  
&#8211; Thiếu font chữ trong văn bản, khi nộp lên một số hệ thống học thuật online,  họ yêu cầu phải nhúng font chữ đầy đủ  
&#8211; Giúp người nhận có thể đọc được văn bản bạn gửi mà không phải cài đặt thêm bất kỳ loại font nào. Điều này làm cho kích thước văn bản tăng lên

If you are a researcher you might have seen such error (or something similar) before:

> The final PDF file cannot be accepted: Publishers require that PDF fonts are embedded so that documents can be printed everywhere;one or more of your document fonts are not embedded

(edas, easychair, etc. they are web-based conference management system, warning us if we submit the pdf file that was not embedded all fonts used)

Adobe reader works perfectly but it&#8217;s so expensive (you may use the trial version though)

Embed fonts in document files (doc, docx) can be achieved by doing so  
Nhúng font vào văn bản Word: File > Option


![embedded_fonts1.jpg](/wp-content/uploads/2016/09/embedded_fonts1.jpg)


Tuy nhiên, khi chuyển sang PDF (save as PDF) thì lại bị &#8220;mất fonts&#8221;  
Có 1 cách để nó không mất, đó là sử dụng định dạng của **ISO 19005-1 compliant PDF/A,** tuy nhiên kết quả đạt được lại không như mong đợi khi &#8220;figure&#8221; (hình ảnh) bên trong bài viết lại bị bôi đen.  
When you try to convert this document from docx into PDF, you may encounter the problem of losing the embedded fonts again **ISO 19005-1 compliant PDF/A** sometimes will not work properly (but it&#8217;s not hurt trying that though)

Đây là kết quả của 1 PDF file bị thiếu font, như các bạn thấy, Font ArialMT không được nhúng vào.  
ArialMT was not embedded in this PDF below


![embedded_fonts3.jpg](/wp-content/uploads/2016/09/embedded_fonts3.jpg)


with the new version of Foxit  
với phiên bản mới của Foxit


![foxit_pdf-1024x510.jpg](/wp-content/uploads/2016/09/foxit_pdf-1024x510.jpg)


Cho đến hiện tại, cách hiệu quả nhất mà mình tìm được là dùng FoxitReader &#8211; các bạn hãy chọn máy in là [phần mềm miễn phí Foxit PDF Reader][4] và in nó ra dưới dạng  PDF 1 lần nữa là xong  
I have found the best solution for this (screw all of you: IEEE, Edas, Easychair and others, you folks should find newer software/methods, not ones that were invented decades ago)


![embedded_fonts4.jpg](/wp-content/uploads/2016/09/embedded_fonts4.jpg)


As you may notice, all fonts were embedded in the PDF above.  
For whatever reason, they removed unnecessary fonts and keep the used ones only.  
Cheers.

 [1]: ../wp-content/uploads/2016/09/embedded_fonts1.jpg
 [2]: ../wp-content/uploads/2016/09/embedded_fonts3.jpg
 [3]: ../wp-content/uploads/2016/09/foxit_pdf.jpg
 [4]: https://www.foxitsoftware.com/products/pdf-reader/
 [5]: ../wp-content/uploads/2016/09/embedded_fonts4.jpg
 [6]: ../wp-content/uploads/2016/09/embedded_fonts5.jpg
