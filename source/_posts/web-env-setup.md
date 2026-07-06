---
title: Web 开发环境搭建记录
date: 2026-07-06
tags:
  - Web开发环境
  - Hexo
  - Node.js
  - Git
---

## 场景说明

本组计划将《软件开发工具实践》的实验过程整理为一个静态展示网站，用于展示 Web 开发环境、代码编辑与管理、虚拟机安装、Linux 配置、远程管理和 Web 软件部署等内容。

本阶段目标是在 Windows 主机上完成 Web 开发环境搭建，并运行一个本地静态站点，为后续实验报告静态网页化打基础。

## 技术栈说明

| 类型 | 工具 |
|---|---|
| 操作系统 | Windows |
| 代码编辑器 | Visual Studio Code |
| 运行环境 | Node.js |
| 包管理器 | npm |
| 版本控制 | Git |
| 静态站点生成器 | Hexo |
| 本地预览服务 | hexo server |

## 核心操作记录

1. 安装 Git、Node.js 和 npm。
2. 配置 npm 国内镜像源。
3. 使用 npm 安装 Hexo CLI。
4. 使用 `hexo init web-report` 初始化静态站点项目。
5. 使用 `npm install` 安装项目依赖。
6. 使用 `hexo server` 启动本地预览服务。
7. 在浏览器访问 `http://localhost:4000`，验证站点运行成功。

## 结果验证

浏览器成功访问 `http://localhost:4000`，并显示 Hexo 默认首页，说明本地 Web 开发环境和静态站点服务已经搭建完成。

## 问题记录

问题：使用 winget 下载 Node.js 时出现网络连接失败。  
解决：改用国内镜像下载 Node.js 安装包，完成 Node.js 和 npm 安装。

## 小结

本阶段完成了 Web 开发环境的基础搭建，为后续 Markdown 文档编写、Git 版本管理和静态网站部署打下基础。