---
title: Masternotdiscoveredexception elasticsearch
description: Cách xử lý lỗi MasterNotDiscoveredException khi thêm node vào cluster Elasticsearch bằng unicast discovery.
date: 2014-08-04T07:25:37+00:00
url: /masternotdiscoveredexception-elasticsearch/
categories:
  - Big Data
  - Cloud
  - Elasticsearch
  - IT
  - Logstash
tags:
  - elasticsearch
  - join node
  - master discovery

---
> **Update (2026):** bài này áp dụng cho Elasticsearch 1.x. Từ Elasticsearch 2.0 multicast discovery đã bị loại bỏ; các phiên bản hiện đại cấu hình bằng `discovery.seed_hosts` và `cluster.initial_master_nodes` trong `elasticsearch.yml`.

Đôi khi khi thêm một node vào cluster Elasticsearch, lỗi `MasterNotDiscoveredException` có thể xuất hiện (nguyên nhân có thể khác nhau, nhưng mình nghĩ multicast có một số hạn chế ở đây).

**Cách giải quyết:** bỏ comment các dòng trong `elasticsearch.yml` như ảnh dưới. Ta bảo node dùng unicast discovery thay vì multicast, và chỉ định thủ công master host cho node này.

![Cấu hình unicast discovery trong elasticsearch.yml](/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM.png)
