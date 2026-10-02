---
title: Autocomplete cho Vim
description: Ghi chú cài Vundle và YouCompleteMe để có autocomplete trong Vim.
date: 2017-07-10T12:11:55+00:00
url: /autocomplete-cho-vim/
categories:
  - IT
tags:
  - autocomplete
  - vim

---
> **Cập nhật (2026):** Ghi chú này từ năm 2017. Kho YouCompleteMe đã chuyển từ `Valloric` sang `ycm-core/YouCompleteMe`, và cách cài (các tùy chọn của `install.py`) có thể đã thay đổi, hãy xem README mới nhất. Ngoài ra, Vim/Neovim hiện có nhiều lựa chọn dùng LSP như `coc.nvim` hoặc `nvim-lspconfig`.

1. Cài [Vundle](https://github.com/VundleVim/Vundle.vim).
2. Cài [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) (xem phần hướng dẫn cho Ubuntu/Linux trong README):
   - Chạy `:PluginInstall` trong Vim (Vundle).
   - Sau đó biên dịch:

   ```bash
   cd ~/.vim/bundle/YouCompleteMe
   ./install.py
   ```

![Autocomplete trong Vim](/wp-content/uploads/2017/07/vim.jpg)
