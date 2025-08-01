---
title: ML tips
author: admin
type: post
date: 2017-11-15T18:04:07+00:00
url: /ml-tips/
categories:
  - Uncategorized

---
Force matplotlib to not use DISPLAY & Save figure instead:  
[Download the sample file here (I won&#8217;t make it easy for you)  

![plot_learning_curve.py_.png](/wp-content/uploads/2017/11/plot_learning_curve.py_.png)


>  import matplotlib  
> matplotlib.use(&#8216;Agg&#8217;)  
> ..  
> plt.savefig(&#8220;plt.png&#8221;)  
> plt.close()

 [1]: ../wp-content/uploads/2017/11/plot_learning_curve.py_.png
