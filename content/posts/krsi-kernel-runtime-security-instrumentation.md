---
title: KRSI – Kernel Runtime Security Instrumentation
author: admin
type: post
date: 2022-12-08T11:06:30+00:00
url: /krsi-kernel-runtime-security-instrumentation/
categories:
  - IT
  - Linux
  - Security
tags:
  - ebpf
  - instrumentation
  - kernel
  - krsi
  - linux
  - security

---
KRSI (appeared in Kernel v5.7) stands for Kernel Runtime Security Instrumentation and the target of this patch is to allow users to implement lsm hooks by utilizing bpf compiled code. This gets interesting for a couple of reasons:

  * _Kernel function call flow mutation_: first application of ebpf where injected code is actually capable reject / blocking the execution of some kernel logic
  * _Flexibility_: ebpf can be attached / removed on the fly

**LSM**

  * Before, Linux was limited to Discretionary Access Control,
  * Now, MAC extensions in Linux are implemented as LSMs, and this includes KRSI, SELinux, etc.

## **ENABLE KRSI** {.wp-block-heading}

**BOOT PARAMETER**

Check current boot parameter `cat /proc/cmdline`

Edit the boot parameters `sudo vim /etc/default/grub`

**Example**:

<pre class="wp-block-preformatted">GRUB_CMDLINE_LINUX_DEFAULT="quiet splash foo=bar"</pre>

Check LSM config params

<pre class="wp-block-preformatted">zgrep CONFIG_LSM= /boot/config-5.12.0-051200-lowlatency
sudo update-grub</pre>

modify `/etc/default/grub`


![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/10aee96f-5dc1-474f-8e8a-d97f329925fd/image.png)


KRSI is LSMs

Figure: &nbsp;Security Enforcement by KRSI & eBPF

“Kernel Runtime Security Instrumentation,” or KRSI (Google: Singh, 2019 September).

It allowed an administrator to attach BPF programs to the various LSM hooks, and it could also inject an error to block the operation in question. This gave administrators the ability to define their own MAC policies with arbitrary code.

Scenario: pre-defined malicious operations will be monitored by Falco and enforced by KRSI module

How KRSI inter-operate with eBPF: eBPF program is attached to LSM hooks

