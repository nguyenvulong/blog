---
title: 'Tùy biến Terminal bằng oh-my-zsh & powerlevel10k'
description: Hướng dẫn cài zsh, oh-my-zsh, antigen và theme powerlevel10k để có một terminal đẹp và tiện dụng.
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
> **Update (2026):** Bài viết từ năm 2020. Antigen không còn được phát triển tích cực, và powerlevel10k hiện chỉ được bảo trì ở mức tối thiểu. Hướng dẫn vẫn dùng được, nhưng bạn có thể cân nhắc các plugin manager còn hoạt động như [antidote](https://github.com/mattmc3/antidote) hoặc [zinit](https://github.com/zdharma-continuum/zinit), hoặc prompt khác như [starship](https://starship.rs/).

## Bước 0: cài đặt zsh

zsh tương tự bash shell.

```bash
sudo apt-get update && sudo apt install zsh
```

## Bước 1: cài đặt [oh-my-zsh](https://ohmyz.sh/)

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Bước 2: cài đặt [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)

Nếu bạn không rành, nên bỏ qua bước 2 và chỉ làm bước 3, 4, vì bước 4.1 sẽ cài luôn powerlevel10k. Nếu bạn không muốn cài antigen (bước 3) thì làm bước 2, sau đó gõ `p10k configure` và làm theo hướng dẫn.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Bước 3: cài đặt antigen

Mình lưu thẳng vào `~/.oh-my-zsh` cho tiện:

```bash
curl -L git.io/antigen > antigen.zsh
```

![Cài đặt antigen](/wp-content/uploads/2021/06/image-1024x207.png)

## Bước 4: cấu hình antigen và cài thêm plugin (optional)

### 4.1 Tạo file `~/.antigenrc` với nội dung sau

```zsh
# Load oh-my-zsh library.
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
```

### 4.2 Cấu hình `~/.zshrc` để kích hoạt antigen

```zsh
source ~/.oh-my-zsh/antigen.zsh
antigen init ~/.antigenrc
```

### 4.3 Đổi color scheme cho đẹp

- macOS: [lysyi3m/macos-terminal-themes](https://github.com/lysyi3m/macos-terminal-themes)
- Xshell: [netsarang/Xshell-ColorScheme](https://github.com/netsarang/Xshell-ColorScheme)

Bên dưới mình dùng scheme Dracula_Reborn.

## Thành quả

Lưu ý: bạn phải thoát ra và vào lại shell.

![Terminal sau khi cấu hình xong, prompt powerlevel10k](/wp-content/uploads/2021/10/image-1-1024x307.png)

![Terminal với color scheme Dracula_Reborn](/wp-content/uploads/2022/01/image-1024x652.png)

## Thông tin thêm

- shell: bash, zsh, ...
- theme: agnoster, gentoo, ...
- plugin manager (khỏi phải git clone tay): antigen

Links:

- <https://ohmyz.sh/>
- <https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md>
- <https://github.com/zsh-users/antigen>
- <https://levelup.gitconnected.com/zsh-antigen-oh-my-zsh-a-beautiful-powerful-robust-shell-ca5873821671>

Lỗi font ở theme Agnoster: cài [powerline/fonts](https://github.com/powerline/fonts).

À không liên quan: khi dùng conda mà không init được thì nhớ thêm tên shell vào cuối (ví dụ `conda init zsh`).

zsh dùng cho Linux/macOS; trên Windows thì có [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh/), một prompt theming engine cho PowerShell.
