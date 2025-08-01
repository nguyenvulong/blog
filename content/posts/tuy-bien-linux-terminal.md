---
title: 'Tùy biến Terminal bằng oh-my-zsh & powerlevel10k'
author: admin
type: post
date: 2020-09-06T16:35:50+00:00
url: /tuy-bien-linux-terminal/
categories:
  - IT
  - Linux
tags:
  - bash
  - oh my zsh
  - shell
  - zsh

---
**Bước 0: ** cài đặt zsh (tương tự bash shell)

<pre class="wp-block-code"><code class="">sudo apt-get update && sudo apt install zsh</code></pre>

**Bước 1**: cài đặt <a href="https://ohmyz.sh/" target="_blank" rel="noreferrer noopener">oh-my-zsh</a>

<pre class="wp-block-code"><code class=""> sh -c "$(wget https: //raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"</code></pre>

**Bước 2**: cài đặt <a rel="noreferrer noopener" href="https://github.com/romkatv/powerlevel10k#oh-my-zsh" target="_blank">powerlevel10k</a> (lưu ý là nếu bạn không biết gì thì nên bỏ qua bước 2, và chỉ làm bước 3, 4. Lý do là vì bước 4.1 sẽ cài đặt cho bạn bước 2 luôn rồi. Còn nếu bạn không thích cài antigen (ở bước 3) thì có thể làm bước 2. Sau đõ gõ &#8220;p10k configure&#8221; và làm theo hướng dẫn là được)

<pre class="wp-block-code"><code class="">git clone --depth=1 https: //github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-sh/custom}/themes/powerlevel10k</code></pre>

**Bước 3**: cài đặt antigen

<pre class="wp-block-code"><code class="">curl -L git.io/antigen &gt; antigen.zsh
(mình lưu thẳng vào chỗ ~/.oh-my-zsh luôn cho tiện)</code></pre>


![image-1024x207.png](/wp-content/uploads/2021/06/image-1024x207.png)


**Bước 4: ** Cấu hình antigen và Cài đặt thêm plugins (optional nhé)

4.1 Tạo file ~/.antigenrc và thêm cái này vào

<pre class="wp-block-code"><code class=""># Load oh-my-zsh library.
antigen use oh-my-zsh

# Load bundles from the default repo (oh-my-zsh).
antigen bundle git 
antigen bundle command-not-found
antigen bundle docker

# Load bundles from external repos.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Select theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply
</code></pre>

4.2 Cấu hình ~/.zshrc (để kích hoạt antigen)

<pre class="wp-block-code"><code class="">source ~/.oh-my-zsh/antigen.zsh
antigen init ~/.antigenrc</code></pre>

4.3 Đổi ColorScheme cho đẹp  
MacOSX: <a rel="noreferrer noopener" href="https://github.com/lysyi3m/macos-terminal-themes" target="_blank">lysyi3m/macos-terminal-themes</a>  
Xshell: <a href="https://github.com/netsarang/Xshell-ColorScheme" target="_blank" rel="noreferrer noopener">netsarang/Xshell-ColorScheme</a>  
(bên dưới mình dùng scheme Dracula_Reborn nhé)  


**Thành quả: ** (lưu ý bạn phải thoát ra và vào lại shell nhé)


![image-1-1024x307.png](/wp-content/uploads/2021/10/image-1-1024x307.png)



![image-1024x652.png](/wp-content/uploads/2022/01/image-1024x652.png)






~~~~~~~~**một số thông tin thêm** (đọc cho biết) ~~~~~~~~~~~

  * shell: bash, zsh, etc.
  * theme: agnoster, gentoo, etc.
  * plugin manager (khỏi phải git clone tay): antigen

**Links: **

  * https: //ohmyz.sh/
  * https: //github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
  * https: //github.com/zsh-users/antigen
  * https: //levelup.gitconnected.com/zsh-antigen-oh-my-zsh-a-beautiful-powerful-robust-shell-ca5873821671

Lỗi font ở theme Agnoster: cài https://github.com/powerline/fonts 

  * À klq, khi bạn dùng conda mà không init được thì nhớ thêm tên shell vào sau đít (conda init zsh chẳng hạn)

~~~

Cái zsh cho Linux/MacOS, còn Windows thì 

**<a rel="noreferrer noopener" href="https: //github.com/JanDeDobbeleer/oh-my-posh/" target="_blank">oh-my-posh</a>** &#8211;> A prompt theming engine for Powershell

 [1]: ../wp-content/uploads/2021/06/image.png
 [2]: ../wp-content/uploads/2021/10/image-1.png
 [3]: ../wp-content/uploads/2022/01/image.png
