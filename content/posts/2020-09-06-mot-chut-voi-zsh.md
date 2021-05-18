---
title: Một chút với zsh
author: admin
type: post
date: 2020-09-06T16:35:50+00:00
url: /mot-chut-voi-zsh/
categories:
  - Uncategorized
tags:
  - bash
  - oh my zsh
  - shell
  - zsh

---
cái bạn cần:

  * shell: bash, zsh, etc.
  * theme: agnoster, gentoo, etc.
  * plugin manager (khỏi phải clone tay): antigen, vundle/vimplug (cho vim) , etc.

links:

  * https://ohmyz.sh/
  * https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
  * https://levelup.gitconnected.com/zsh-antigen-oh-my-zsh-a-beautiful-powerful-robust-shell-ca5873821671

hình minh họa:

<figure class="wp-block-image size-large">

<img loading="lazy" width="1024" height="625" src="https://nguyenvulong.com/wp-content/uploads/2020/09/image-1024x625.png" alt="" class="wp-image-1714" srcset="https://nguyenvulong.com/wp-content/uploads/2020/09/image-1024x625.png 1024w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-300x183.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-768x469.png 768w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-1536x938.png 1536w, https://nguyenvulong.com/wp-content/uploads/2020/09/image.png 1864w" sizes="(max-width: 1024px) 100vw, 1024px" /> <figcaption>gentoo theme, đang cài antigen nè</figcaption></figure> <figure class="wp-block-image size-large is-style-default"><img loading="lazy" width="1024" height="249" src="https://nguyenvulong.com/wp-content/uploads/2020/09/image-1-1024x249.png" alt="" class="wp-image-1715" srcset="https://nguyenvulong.com/wp-content/uploads/2020/09/image-1-1024x249.png 1024w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-1-300x73.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-1-768x186.png 768w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-1.png 1376w" sizes="(max-width: 1024px) 100vw, 1024px" /><figcaption>thiết lập plugins trong ~/.zshrc nà</figcaption></figure> 

<div class="wp-block-image is-style-rounded">
  <figure class="aligncenter size-large is-resized"><img loading="lazy" src="https://nguyenvulong.com/wp-content/uploads/2020/09/image-2.png" alt="" class="wp-image-1716" width="580" height="202" srcset="https://nguyenvulong.com/wp-content/uploads/2020/09/image-2.png 950w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-2-300x105.png 300w, https://nguyenvulong.com/wp-content/uploads/2020/09/image-2-768x268.png 768w" sizes="(max-width: 580px) 100vw, 580px" /><figcaption>gợi ý (chữ màu nâu đó)</figcaption></figure>
</div>

thứ tự cài đặt:

  * zsh (thường là có sẵn)
  * oh my zsh, cài vô
  * antigen.zsh tải về và bỏ vào đâu đó (mình hay bỏ vào .oh-my-zsh/ luôn cho gọn); đồng thời tạo file ~/.antigenrc theo link <a rel="noreferrer noopener" href="https://github.com/zsh-users/antigen" target="_blank">này</a>
  * sửa file ~/.zshrc và bỏ vào cuối file một vài lệnh như sau (để nó gọi thằng antigen):
      * _source /usr/local/share/antigen/antigen.zsh_
      * _antigen init ~/.antigenrc_

Lỗi font ở theme Agnoster: cài https://github.com/powerline/fonts 

  * À klq, khi bạn dùng conda mà không init được thì nhớ thêm tên shell vào sau đít (conda init zsh chẳng hạn)

~~~

Cái zsh cho Linux/MacOS, còn Windows thì 

**<a rel="noreferrer noopener" href="https://github.com/JanDeDobbeleer/oh-my-posh/" target="_blank">oh-my-posh</a>** &#8211;> A prompt theming engine for Powershell