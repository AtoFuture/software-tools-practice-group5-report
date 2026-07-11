---
title: 实验六 Linux 环境配置
date: 2026-07-08 18:55:00
categories: 实验报告
tags:
  - Linux
  - 用户权限
  - 环境变量
---

## 实验目的

掌握 Linux 命令行基础操作、用户与权限管理、系统配置文件和环境变量配置。

## 实验环境

- 系统：Ubuntu Server 22.04 LTS
- Shell：bash

## 实验过程

查看系统信息：

```bash
whoami
uname -a
lsb_release -a
hostname
pwd
```

查看用户和组配置文件：

```bash
cat /etc/passwd
cat /etc/group
```

查看环境变量：

```bash
echo $PATH
echo $HOME
echo $USER
echo $SHELL
```

## 实验结果

待补充命令执行截图和关键配置文件截图。

## 知识总结

- `/etc/passwd` 保存系统用户信息。
- `/etc/group` 保存用户组信息。
- `~/.bashrc` 常用于配置用户级 shell 环境。
- `PATH` 决定命令搜索路径。

## 出现问题与解决方案

待补充。

## 心得体会

待补充。
