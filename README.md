# 软件开发工具实践实验报告项目

## 一、项目简介

本项目是第五组的软件开发工具实践实验报告项目。根目录作为小组最终展示版本，包含 Hexo 静态站点、Markdown 实验报告、实验截图、Packet Tracer 局域网通信材料，以及各成员个人材料目录。

## 二、实验内容

- Windows 本地开发环境搭建：Git、Node.js、npm、Hexo、VS Code。
- Hexo 静态实验报告网站创建、生成与本地预览。
- VirtualBox 中安装 Ubuntu Server，并配置 SSH 远程管理。
- 使用 SCP 上传静态网页文件到 Ubuntu。
- 使用 Nginx 部署静态网页到 `/var/www/html/`。
- 使用 Cisco Packet Tracer 搭建 PC0 — Switch — PC1 局域网拓扑并完成 ping 通信测试。
- 整理小组最终报告、关键运行截图、成员原始材料和个人网页报告入口。

## 三、目录说明

- `source/`：Hexo 源文件目录。
- `source/report/index.html`：小组最终展示网页源文件。
- `source/report/images/`：小组最终展示网页使用的关键截图。
- `source/report/members/`：各成员个人网页报告源文件目录。
- `public/`：Hexo 生成后的静态网页目录。
- `实验截图/`：小组最终展示版本使用的原始实验截图。
- `软件开发工具实践实验报告.md`：小组 Markdown 实验报告。
- `图片清单.md`：实验截图说明清单。
- `members/`：第五组各成员原始个人材料目录。
- `packettracer-simple-lan.pkt`：Packet Tracer 简单局域网实验文件。

## 四、本地运行方式

```powershell
npm install
npx.cmd hexo clean
npx.cmd hexo generate
npx.cmd hexo server
```

本地预览地址：

```text
http://localhost:4000/report/
```

## 五、部署方式

生成静态文件后，将 `public/` 目录内容上传到 Ubuntu Server，并复制到 Nginx 默认站点目录：

```bash
scp -P 2222 -r ./public/* hdu@127.0.0.1:~/web-report-public/
sudo rm -rf /var/www/html/*
sudo cp -r ~/web-report-public/* /var/www/html/
sudo chmod -R 755 /var/www/html
sudo systemctl restart nginx
```

部署后访问：

```text
http://127.0.0.1:8080/report/
```

## 六、小组成员列表

| 角色 | 学号 | 姓名 |
|---|---|---|
| 组长 | 25051224 | 王壹 |
| 组员1 | 25051201 | 胡钰皎 |
| 组员2 | 25010140 | 陈翰铮 |
| 组员3 | 25051223 | 宋杰 |
| 组员4 | 25010104 | 刘天东 |
| 组员5 | 25051208 | 夏熙宁 |
| 组员6 | 25051230 | 毛维嘉 |

## 七、members/ 原始个人材料目录说明

`members/` 用于存放第五组各成员的原始个人实验报告、截图、负责内容说明和网页报告说明。每位成员使用 “学号-姓名” 建立独立文件夹，个人截图统一放入本人目录下的 `截图/` 文件夹。

## 八、source/report/members/ 个人网页报告目录说明

`source/report/members/` 用于存放可由 Hexo 生成并部署访问的个人网页报告。每位成员拥有独立目录和 `index.html` 文件，生成后可通过 `/report/members/学号-姓名/` 访问。小组总报告中的“成员个人报告入口”表格提供了这些网页报告的访问链接。

