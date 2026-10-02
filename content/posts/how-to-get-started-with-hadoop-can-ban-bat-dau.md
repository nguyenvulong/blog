---
title: How to get started with Hadoop – Hadoop căn bản
description: Gợi ý dùng HDP (Hortonworks Data Platform) để bắt đầu với Hadoop thay vì cài từng gói thủ công.
date: 2015-04-29T14:00:08+00:00
url: /how-to-get-started-with-hadoop-can-ban-bat-dau/
categories:
  - Big Data
  - Hadoop
  - IT
tags:
  - cai dat
  - cloudera
  - configuration
  - Hadoop
  - hadoop can ban
  - hortonworks
  - install hadoop
  - map reduce
  - mapr
  - set up hadoop
---
> **Update (2026):** Bài viết từ năm 2015. HDP đã ngừng phát triển sau khi Hortonworks sáp nhập với Cloudera (2019) và nay được thay bằng Cloudera Data Platform; link tải cũ không còn dùng được. Ngày nay nhiều người chọn dịch vụ đám mây (EMR, Dataproc...) hoặc các công cụ như Spark/Kubernetes thay vì tự dựng Hadoop.

One of the most painful jobs of a system engineer is to build a whole system by installing multiple packages one by one. We all worry about incompatibility and dependencies.

With Hadoop, you can avoid that with big help from HDP (Hortonworks Data Platform). Great tutorials and documentation can be found on the Hortonworks site (hortonworks.com/hdp/downloads, no longer available).

The order of methods you should try to install Hadoop:

![Thứ tự các cách cài đặt Hadoop với HDP](/wp-content/uploads/2015/04/hortonworks-1024x585.png)

Mình viết bài này cho bạn nào muốn bắt đầu với Hadoop mà không biết bắt đầu từ đâu. Chỉ đơn giản là HDP; những nền tảng khác như Cloudera hay MapR có tài liệu không tốt bằng. HDP còn có thể cài trên cả Windows Server (but you should not do that, should you?).

Chỉ ngắn gọn vậy thôi. Nếu bạn đã từng cài Hadoop bằng cách tải từ Apache về thì sẽ thấy rất mệt mỏi.

Work smarter, not harder (well, actually we should be working harder, sometimes).
