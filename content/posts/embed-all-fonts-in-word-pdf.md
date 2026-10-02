---
title: 'Embed all fonts in Word & PDF'
description: Cách nhúng đầy đủ font chữ vào file Word và PDF để nộp bài lên các hệ thống hội nghị như EDAS, EasyChair.
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
> **Update (2026):** Bài viết từ năm 2016 và dựa trên Foxit Reader cùng Word thời đó. Ngày nay có thể kiểm tra font đã nhúng bằng Properties > Fonts trong bất kỳ trình đọc PDF nào, và nhiều bản Word mới có sẵn tùy chọn PDF/A khi xuất PDF. Cách "in lại ra PDF" bên dưới vẫn có thể dùng làm phương án dự phòng.

Bài viết này giúp bạn khắc phục tình trạng:

- Thiếu font chữ trong văn bản: một số hệ thống học thuật online yêu cầu nhúng đầy đủ font khi nộp bài.
- Người nhận đọc được văn bản mà không phải cài thêm font nào (đổi lại kích thước file sẽ tăng).

If you are a researcher you might have seen such an error (or something similar) before:

> The final PDF file cannot be accepted: Publishers require that PDF fonts are embedded so that documents can be printed everywhere; one or more of your document fonts are not embedded

(EDAS, EasyChair, etc. are web-based conference management systems that warn us if a submitted PDF does not embed all the fonts it uses.)

Adobe Acrobat works perfectly but it's expensive (you may use the trial version though).

## Nhúng font trong file Word

Nhúng font vào văn bản Word (doc, docx): File > Options > Save > Embed fonts in the file.

![Tùy chọn nhúng font trong Word](/wp-content/uploads/2016/09/embedded_fonts1.jpg)

Tuy nhiên, khi chuyển sang PDF (Save as PDF) thì font lại bị "mất".

Có một cách là dùng định dạng **ISO 19005-1 compliant PDF/A**, nhưng kết quả không như mong đợi: "figure" (hình ảnh) trong bài có thể bị bôi đen. Khi convert docx sang PDF, bạn có thể gặp lại vấn đề mất font; PDF/A đôi khi không hoạt động đúng (nhưng thử cũng không mất gì).

Đây là một file PDF bị thiếu font: font ArialMT không được nhúng.

![PDF báo ArialMT chưa được nhúng](/wp-content/uploads/2016/09/embedded_fonts3.jpg)

Trong phiên bản mới của Foxit, thông tin font hiển thị như sau:

![Danh sách font trong Foxit Reader](/wp-content/uploads/2016/09/foxit_pdf-1024x510.jpg)

## Cách hiệu quả nhất mình tìm được

Dùng Foxit Reader: chọn máy in là [Foxit PDF Reader (miễn phí)](https://www.foxitsoftware.com/products/pdf-reader/) rồi in file PDF ra PDF một lần nữa là xong.

I have found this to be the most effective solution (and IEEE, EDAS, EasyChair and the like should really find newer methods than ones invented decades ago).

![PDF sau khi in lại, tất cả font đã được nhúng](/wp-content/uploads/2016/09/embedded_fonts4.jpg)

As you can see, all fonts are now embedded in the PDF above. For whatever reason, unused fonts are dropped and only the used ones are kept. Cheers.
