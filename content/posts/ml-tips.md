---
title: ML tips
description: Mẹo ép matplotlib không dùng DISPLAY mà lưu hình ra file, hữu ích khi chạy trên server.
date: 2017-11-15T18:04:07+00:00
url: /ml-tips/
categories:
  - Uncategorized

---
Ép matplotlib không dùng DISPLAY mà lưu hình ra file (hữu ích khi chạy trên server không có giao diện đồ họa):

```python
import matplotlib
matplotlib.use('Agg')  # phải gọi trước khi import pyplot
import matplotlib.pyplot as plt
# ...
plt.savefig("plt.png")
plt.close()
```

![Ví dụ learning curve được lưu bằng matplotlib](/wp-content/uploads/2017/11/plot_learning_curve.py_.png)
