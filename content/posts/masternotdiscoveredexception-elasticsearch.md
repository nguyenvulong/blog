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

**Solution: **  
Uncomment those lines in **elasticsearch.yml**

We tell this host (node) to use unicast discovery instead of multicast, and then specify the master host manually for this node.


![Screenshot-08042014-042256-PM.png](/wp-content/uploads/2014/08/Screenshot-08042014-042256-PM.png)

