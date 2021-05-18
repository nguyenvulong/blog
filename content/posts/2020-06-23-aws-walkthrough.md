---
title: AWS walkthrough
author: admin
type: post
date: 2020-06-23T10:44:08+00:00
url: /aws-walkthrough/
categories:
  - Uncategorized
tags:
  - aws
  - tutorial
  - walkthrough

---
Projects galore >.<, you need to log in to the **[management console][1]** to try em out

<figure class="wp-block-image size-large">

<img loading="lazy" width="1024" height="844" src="https://nguyenvulong.com/wp-content/uploads/2020/06/image-1024x844.png" alt="" class="wp-image-1694" srcset="https://nguyenvulong.com/wp-content/uploads/2020/06/image-1024x844.png 1024w, https://nguyenvulong.com/wp-content/uploads/2020/06/image-300x247.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/06/image-768x633.png 768w, https://nguyenvulong.com/wp-content/uploads/2020/06/image.png 1082w" sizes="(max-width: 1024px) 100vw, 1024px" /> <figcaption>aws all services</figcaption></figure> 

Tons of hands-on tutorials can be found **[here][2]**

Free instance (& attached IP address) can be created at ease using [**lightsail**][3] 

<figure class="wp-block-image size-large">

<img loading="lazy" width="995" height="402" src="https://nguyenvulong.com/wp-content/uploads/2020/06/image-1.png" alt="" class="wp-image-1695" srcset="https://nguyenvulong.com/wp-content/uploads/2020/06/image-1.png 995w, https://nguyenvulong.com/wp-content/uploads/2020/06/image-1-300x121.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/06/image-1-768x310.png 768w" sizes="(max-width: 995px) 100vw, 995px" /> </figure> 

switch region for available services<figure class="wp-block-image size-large">

<img loading="lazy" width="491" height="241" src="https://nguyenvulong.com/wp-content/uploads/2020/06/image-2.png" alt="" class="wp-image-1697" srcset="https://nguyenvulong.com/wp-content/uploads/2020/06/image-2.png 491w, https://nguyenvulong.com/wp-content/uploads/2020/06/image-2-300x147.png 300w" sizes="(max-width: 491px) 100vw, 491px" /> </figure> 





A bit confusion can cost you money. They charge you for the notebook instance **inside** Amazon SageMaker Studio BUT the Notebook instances tab won&#8217;t show any running notebook. Make sure to delete an app & user inside Amazon SageMaker Studio to avoid unexpected charge caused by notebook instance running inside it. Check the two photos below: notebook instance charge occurred but there is no notebook instance visible in the second photo.

<figure class="wp-block-image size-large">

<img loading="lazy" width="1024" height="546" src="https://nguyenvulong.com/wp-content/uploads/2020/07/image-1024x546.png" alt="" class="wp-image-1701" srcset="https://nguyenvulong.com/wp-content/uploads/2020/07/image-1024x546.png 1024w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-300x160.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-768x410.png 768w, https://nguyenvulong.com/wp-content/uploads/2020/07/image.png 1108w" sizes="(max-width: 1024px) 100vw, 1024px" /> </figure> <figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="306" src="https://nguyenvulong.com/wp-content/uploads/2020/07/image-1-1024x306.png" alt="" class="wp-image-1702" srcset="https://nguyenvulong.com/wp-content/uploads/2020/07/image-1-1024x306.png 1024w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-1-300x90.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-1-768x229.png 768w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-1-1536x459.png 1536w, https://nguyenvulong.com/wp-content/uploads/2020/07/image-1.png 1879w" sizes="(max-width: 1024px) 100vw, 1024px" /></figure>

 [1]: https://aws.amazon.com/console
 [2]: https://aws.amazon.com/getting-started/hands-on/
 [3]: https://lightsail.aws.amazon.com/ls/webapp/home/instances