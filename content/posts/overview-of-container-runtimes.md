---
title: Overview of Container Runtimes
author: admin
type: post
date: 2021-04-05T13:44:35+00:00
url: /overview-of-container-runtimes/
categories:
  - Cloud
  - IT
tags:
  - container
  - k8s
  - kubernetes
  - microservice
  - virtualization

---
### **Foundation** {.wp-block-heading}

OCI: Open Container Initiativefounded by Docker, CoreOS, and othersimage-specruntime-specCRI: Container Runtime Interface enables kubelet to use different runtimesCNI: Container Network Interface

### **Container Runtimes** {.wp-block-heading}

**high-level runtimes** often incorporate **low-level runtimes** that are otherwise standalone projects.

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    &nbsp;If tomorrow you get the urge to add your own container project to the ever-growing jungle, you should make it OCI-, CRI- and CNI-compliant
  </p>

![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/ae6744f8-648a-48ac-bc38-b3304d5fe120/image.png)



![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/87264a3f-bf61-4060-9abf-c4c6442973e8/image.png)



![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/ef578bd5-1808-44e3-a65e-63a79d194386/image.png)


**<a href="https: //github.com/opencontainers/runc" target="_blank" rel="noreferrer noopener">runc </a>**= libcontainer + ..runc runs OCI open container image directly(high level) rkt (obsolete) did not rely on daemon**lxc**: virtual env that does not emulate the hardware. he focus of Linux Containers are base images (e. g. Ubuntu) rather than application-tailored images.**singularity** focuses on High Performance Computing. Uses Singularity Image Format (SIF), but also supports OCI/CRI

### **VM-like Container Runtimes** {.wp-block-heading}


![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/b74b1bbc-d8c0-4f9d-8c80-a9ec88fc9061/image.png)



![image.png](https: //t3735202.p.clickup-attachments.com/t3735202/af5f3a44-0065-4c90-9141-4bb3caa6db00/image.png)


**<a href="https: //github.com/firecracker-microvm/firecracker" rel="noreferrer noopener" target="_blank">Firecracker</a>**Amazon project, FaaS, VMM that uses KVM to create microVM.Efforts:

  * Firecracker instead of QEMU as VMM for Kata Containers
  * firecracker-containerd mapper allows containerd to run containers as microVMs

**<a rel="noreferrer noopener" href="https: //github.com/google/gvisor" target="_blank">gVisor</a>**Google, runsc, OCI compilant, Sentry, GoferSentry is the central user-space OS kernel that the untrusted application uses.Not every system call, /proc or /sys file is implemented.



**Source: **

<a rel="noreferrer noopener" href="https: //www.inovex.de/blog/containers-docker-containerd-nabla-kata-firecracker" target="_blank">innovex blog</a> , <a href="https://www.ianlewis.org/en/container-runtimes-part-1-introduction-container-r" target="_blank" rel="noreferrer noopener">ianlewis blog</a> 

and other opensource sites.
