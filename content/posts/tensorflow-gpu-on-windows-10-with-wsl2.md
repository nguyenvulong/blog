---
title: TensorFlow-GPU on Windows 10 with WSL2
description: Draft notes on setting up TensorFlow with GPU support on WSL2 using miniconda and NVIDIA CUDA.
date: 2020-11-18T06:27:07+00:00
draft: true
private: true
url: /tensorflow-gpu-on-windows-10-with-wsl2/
categories:
  - Uncategorized
---
> **Update (2026):** These draft notes are from 2020. Today, CUDA on WSL2 is supported out of the box by recent NVIDIA Windows drivers, and TensorFlow's current GPU instructions should be followed instead.

1. Buy a graphics card.

   ![Screenshot of the GPU setup](/wp-content/uploads/2020/11/image-1.png)

2. Install [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download [Miniconda](https://docs.conda.io/en/latest/miniconda.html#linux-installers) (make sure to use the Linux installer).
4. Follow [Getting started with CUDA on Ubuntu on WSL 2](https://ubuntu.com/blog/getting-started-with-cuda-on-ubuntu-on-wsl-2) to install the NVIDIA container toolkit for WSL2.
5. If you have issues with that tutorial, read this [dockerd issue](https://github.com/MicrosoftDocs/WSL/issues/457); the tutorial is incomplete as the Docker daemon was not able to run.
