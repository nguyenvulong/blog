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
### **Foundation**

OCI: Open Container Initiativefounded by Docker, CoreOS, and othersimage-specruntime-specCRI: Container Runtime Interface enables kubelet to use different runtimesCNI: Container Network Interface

### **Container Runtimes**

**high-level runtimes** often incorporate **low-level runtimes** that are otherwise standalone projects.

<blockquote class="wp-block-quote">
  <p>
    &nbsp;If tomorrow you get the urge to add your own container project to the ever-growing jungle, you should make it OCI-, CRI- and CNI-compliant
  </p>
</blockquote><figure class="wp-block-image">

![][1] </figure> 

**Figure 1:** Docker vs. containerd in a Kubernetes context. The dockershim and cri-containerd implementations make the respective APIs CRI-compliant by translating calls back and forth.<figure class="wp-block-image">

![][2] </figure> 

**Figure 2:** containerd allows for the usage of multiple low-level container runtimes, which can be used in Kubernetes interchangeably based on the requirements for a specific application. In this case, Kata is used to run untrusted containers.**<a href="https://cri-o.io/" rel="noreferrer noopener" target="_blank">cri-o</a>**<figure class="wp-block-image">

![][3] </figure> 

**<a href="https://github.com/opencontainers/runc" target="_blank" rel="noreferrer noopener">runc </a>**= libcontainer + ..runc runs OCI open container image directly(high level) rkt (obsolete) did not rely on daemon**lxc**: virtual env that does not emulate the hardware. he focus of Linux Containers are base images (e. g. Ubuntu) rather than application-tailored images.**singularity** focuses on High Performance Computing. Uses Singularity Image Format (SIF), but also supports OCI/CRI

### **VM-like Container Runtimes**

**<a href="http://unikernel.org/" rel="noreferrer noopener" target="_blank">Unikernels </a>**only contain the parts of the OS they need and get deployed on top of a hypervisor/VMM. Monitoring and debugging capabilities are very limited. No toolchains officially available.**<a href="https://nabla-containers.github.io/" rel="noreferrer noopener" target="_blank">Nabla Container</a>** 7 syscalls used, not OCI compliant, CRI compliant (runnc)<figure class="wp-block-image">

![][4] </figure> 

**<a href="https://katacontainers.io/" rel="noreferrer noopener" target="_blank">Kata Containers</a>**OpenStack project, OCI compilant, CRI compliant, CNI compliant As every container is started inside a new VM (managed by QEMU), Kata provides an optimized base VM image to speed up boot times for them<figure class="wp-block-image">

![][5] </figure> 

**<a href="https://github.com/firecracker-microvm/firecracker" rel="noreferrer noopener" target="_blank">Firecracker</a>**Amazon project, FaaS, VMM that uses KVM to create microVM.Efforts:

  * Firecracker instead of QEMU as VMM for Kata Containers
  * firecracker-containerd mapper allows containerd to run containers as microVMs

**<a rel="noreferrer noopener" href="https://github.com/google/gvisor" target="_blank">gVisor</a>**Google, runsc, OCI compilant, Sentry, GoferSentry is the central user-space OS kernel that the untrusted application uses.Not every system call, /proc or /sys file is implemented.



**Source:**

<a rel="noreferrer noopener" href="https://www.inovex.de/blog/containers-docker-containerd-nabla-kata-firecracker" target="_blank">innovex blog</a> , <a href="https://www.ianlewis.org/en/container-runtimes-part-1-introduction-container-r" target="_blank" rel="noreferrer noopener">ianlewis blog</a> 

and other opensource sites.

 [1]: https://t3735202.p.clickup-attachments.com/t3735202/ae6744f8-648a-48ac-bc38-b3304d5fe120/image.png
 [2]: https://t3735202.p.clickup-attachments.com/t3735202/87264a3f-bf61-4060-9abf-c4c6442973e8/image.png
 [3]: https://t3735202.p.clickup-attachments.com/t3735202/ef578bd5-1808-44e3-a65e-63a79d194386/image.png
 [4]: https://t3735202.p.clickup-attachments.com/t3735202/b74b1bbc-d8c0-4f9d-8c80-a9ec88fc9061/image.png
 [5]: https://t3735202.p.clickup-attachments.com/t3735202/af5f3a44-0065-4c90-9141-4bb3caa6db00/image.png