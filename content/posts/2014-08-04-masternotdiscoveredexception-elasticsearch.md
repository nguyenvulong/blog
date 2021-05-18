---
title: Masternotdiscoveredexception elasticsearch
author: admin
type: post
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
Sometimes, when you want to join a node to  elasticsearch cluster, this problem may occur (the reason may vary, but I think there are some limitations of using multicast here)

**Solution:**  
Uncomment those lines in **elasticsearch.yml**

We tell this host (node) to use unicast discovery instead of multicast, and then specify the master host manually for this node.

<img loading="lazy" class="aligncenter size-full wp-image-901" src="http://nguyenvulong.com/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM.png" alt="Screenshot - 08042014 - 04:22:56 PM" width="561" height="238" srcset="https://nguyenvulong.com/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM.png 561w, https://nguyenvulong.com/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM-300x127.png 300w, https://nguyenvulong.com/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM-500x212.png 500w" sizes="(max-width: 561px) 100vw, 561px" />