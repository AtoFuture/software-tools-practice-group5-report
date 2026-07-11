---
title: 实验七 远程登录管理
date: 2026-07-08 18:56:00
categories: 实验报告
tags:
  - SSH
  - SCP
  - rsync
  - 远程管理
---

## 实验目的

配置 SSH 远程登录，掌握免密登录、远程文件传输和多机管理的基本方法。

## 实验环境

- 虚拟机：node1、node2
- 网络：Host-Only，示例网段 `192.168.56.0/24`
- 服务：OpenSSH Server

## 实验过程

安装并启动 SSH：

```bash
sudo apt update
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl status ssh
```

生成 SSH 密钥：

```bash
ssh-keygen
```

远程登录：

```bash
ssh dev@192.168.56.101
```

文件传输：

```bash
scp test.txt dev@192.168.56.101:/home/dev/
rsync -avz ./public/ dev@192.168.56.101:/var/www/blog/
```

## 实验结果

待补充 SSH 登录截图、免密登录截图和文件传输截图。

## 知识总结

- SSH 用于安全远程登录。
- 公钥认证比密码登录更适合自动化部署。
- scp 适合简单复制，rsync 适合同步目录。

## 出现问题与解决方案

待补充。

## 心得体会

待补充。
