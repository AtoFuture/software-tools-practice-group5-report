---
title: Ubuntu Server 与 Nginx 部署记录
date: 2026-07-07
tags:
  - Ubuntu
  - VirtualBox
  - SSH
  - Nginx
  - Web部署
---

## 场景说明

本阶段目标是在 Windows 主机上使用 VirtualBox 创建 Ubuntu Server 虚拟机，并在虚拟机中安装和配置 Nginx Web 服务，最终将 Hexo 生成的静态网站部署到 Ubuntu Server 中。

该过程模拟了从本地开发环境到服务器部署环境的完整流程。

## 技术栈说明

| 类型 | 工具 |
|---|---|
| 宿主机系统 | Windows |
| 虚拟化工具 | Oracle VM VirtualBox |
| 虚拟机系统 | Ubuntu Server 22.04 LTS |
| 远程管理 | OpenSSH Server |
| Web 服务 | Nginx |
| 站点生成工具 | Hexo |
| 部署内容 | 静态实验报告网站 |

## 核心操作记录

1. 在 VirtualBox 中创建名为 `node1` 的 Ubuntu Server 虚拟机。
2. 安装 Ubuntu Server 22.04 LTS，并在安装过程中启用 OpenSSH Server。
3. 使用 `sudo apt update` 更新软件源。
4. 安装 `vim`、`git`、`curl`、`openssh-server`、`nginx` 等工具。
5. 在 VirtualBox 中配置 NAT 端口转发，将主机 `127.0.0.1:8080` 映射到虚拟机的 80 端口。
6. 在 Windows 主机中使用 `scp` 将 Hexo 生成的 `public` 目录上传到 Ubuntu Server。
7. 将静态网页复制到 `/var/www/html/`，并重启 Nginx 服务。
8. 在 Windows 浏览器访问 `http://127.0.0.1:8080`，验证部署结果。

## 结果验证

浏览器成功访问 `http://127.0.0.1:8080`，并显示 Hexo 静态实验报告网站，说明 Ubuntu Server 和 Nginx 部署成功。

## 问题记录

### 问题一：安装完成后无法直接移除 ISO 镜像

安装 Ubuntu Server 后重启时，系统提示需要移除安装介质，但 VirtualBox 菜单中的“移除虚拟盘片”按钮为灰色。

解决方法：强制关闭虚拟机，然后进入 VirtualBox 的“存储”设置，手动移除 Ubuntu ISO 镜像，再重新启动虚拟机。

### 问题二：初次部署后网页样式丢失

第一次访问 `127.0.0.1:8080` 时，页面内容能够显示，但 CSS 样式没有正常加载。

解决方法：重新执行 `hexo clean` 和 `hexo generate`，完整上传 `public` 目录中的 HTML、CSS、JS 和图片资源，再重新复制到 `/var/www/html/` 并重启 Nginx。

## 小结

本阶段完成了从 Windows 本地开发到 Ubuntu Server Web 服务部署的完整流程，验证了虚拟机、Linux、SSH、Nginx 和静态网站部署之间的协作关系。