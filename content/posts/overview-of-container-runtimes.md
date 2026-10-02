---
title: Overview of Container Runtimes
description: Ghi chú ngắn về các chuẩn OCI/CRI/CNI và các loại container runtime, từ runc đến Firecracker và gVisor.
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
> **Update (2026):** Đây là ghi chú năm 2021. Một số chi tiết đã thay đổi: Kubernetes đã gỡ dockershim (từ v1.24) và dùng trực tiếp containerd hoặc CRI-O qua CRI; rkt đã ngừng phát triển. Các sơ đồ minh họa gốc (lưu trên dịch vụ bên ngoài) không còn khả dụng nên đã được lược bỏ.

## Foundation

- **OCI** (Open Container Initiative): do Docker, CoreOS và các bên khác thành lập, gồm image-spec và runtime-spec.
- **CRI** (Container Runtime Interface): cho phép kubelet dùng các runtime khác nhau.
- **CNI** (Container Network Interface): chuẩn cấu hình mạng cho container.

## Container Runtimes

Các **high-level runtime** thường tích hợp các **low-level runtime**, vốn là những dự án độc lập.

> If tomorrow you get the urge to add your own container project to the ever-growing jungle, you should make it OCI-, CRI- and CNI-compliant.

- **[runc](https://github.com/opencontainers/runc)**: = libcontainer + ...; chạy trực tiếp image theo chuẩn OCI (low-level).
- **rkt** (đã ngừng phát triển): không dựa vào daemon.
- **lxc**: môi trường ảo không giả lập phần cứng. Linux Containers tập trung vào base image (ví dụ Ubuntu) thay vì image dành riêng cho từng ứng dụng.
- **singularity**: tập trung vào High Performance Computing. Dùng định dạng Singularity Image Format (SIF), nhưng cũng hỗ trợ OCI/CRI.

## VM-like Container Runtimes

- **[Firecracker](https://github.com/firecracker-microvm/firecracker)**: dự án của Amazon cho FaaS, là VMM dùng KVM để tạo microVM.
  - Dùng Firecracker thay QEMU làm VMM cho Kata Containers.
  - firecracker-containerd cho phép containerd chạy container dưới dạng microVM.
- **[gVisor](https://github.com/google/gvisor)**: của Google, runtime `runsc`, tuân thủ OCI, gồm Sentry và Gofer. Sentry là kernel không gian người dùng trung tâm mà ứng dụng không tin cậy sử dụng. Không phải system call, file `/proc` hay `/sys` nào cũng được hiện thực.

## Nguồn

[inovex blog](https://www.inovex.de/blog/containers-docker-containerd-nabla-kata-firecracker), [Ian Lewis blog](https://www.ianlewis.org/en/container-runtimes-part-1-introduction-container-r) và các trang mã nguồn mở khác.
