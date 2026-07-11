---
title: 实验八 软件部署
date: 2026-07-08 18:57:00
categories: 实验报告
tags:
  - GitHub Actions
  - GitHub Pages
  - Nginx
  - 部署
---

## 实验目的

综合前面实验内容，将静态网站从本地开发环境部署到 GitHub Pages 或 Linux + Nginx 环境。

## 实验环境

- 本地项目：Hexo
- 代码托管：GitHub
- 自动部署：GitHub Actions
- 服务器部署：Nginx

## 实验过程

生成静态网页：

```bash
npm run build
```

GitHub Pages 部署准备：

```bash
git add .
git commit -m "完成实验报告网站初始版本"
git branch -M main
git remote add origin https://github.com/Steven070502/software-tools-practice.git
git push -u origin main
```

Nginx 部署准备：

```bash
sudo apt update
sudo apt install nginx -y
sudo mkdir -p /var/www/blog
sudo chown -R $USER:$USER /var/www/blog
```

同步静态文件：

```bash
rsync -avz --delete public/ dev@192.168.56.101:/var/www/blog/
```

## 实验结果

待补充 GitHub Pages 访问截图、Actions 成功截图或 Nginx 页面访问截图。

## 知识总结

- 静态网站部署的核心是将 HTML、CSS、JS 等文件发布到 Web 服务器。
- GitHub Pages 适合快速公开展示。
- Nginx 更接近真实服务器部署场景。
- GitHub Actions 可以实现 push 后自动构建和发布。

## 出现问题与解决方案

待补充。

## 心得体会

待补充。
