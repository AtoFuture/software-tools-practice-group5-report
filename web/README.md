# 实验一：Web开发环境搭建

## 1、实验目的

本次实验旨在安装并配置 Web 开发环境，掌握 VSCode 编辑器的基本使用，并通过 Live Server 插件成功运行第一个静态网页，理解 Web 开发环境的基本组成和工作原理。

## 2、实验环境

- **操作系统**：Windows 11 专业版
- **代码编辑器**：Visual Studio Code（VSCode）1.98.0
- **运行环境**：Node.js 18.17.0（LTS） + Live Server 扩展
- **版本管理**：Git 2.50.1
- **项目路径**：D:/web实验1/

## 3、实验过程（图文并茂）

### 步骤一：安装 VSCode 代码编辑器

访问 VSCode 官网（https://code.visualstudio.com/），下载 Windows 版本安装包。双击运行安装程序，按照向导提示完成安装。

![VSCode安装界面](./image/install%20VScode.png)
*图1：VSCode 安装程序启动界面*

### 步骤二：安装 Live Server 插件

打开 VSCode，点击左侧活动栏的“扩展”图标（四个小方块），在搜索框中输入“Live Server”，找到作者为 Ritwick Dey 的插件，点击“安装”。

安装完成后，VSCode 右下角会出现蓝色的“Go Live”按钮，表示插件已生效。

![Live Server插件页面](./images/2安装插件live server.png)
*图2：VSCode 扩展商店中的 Live Server 插件*

### 步骤三：创建项目文件夹并编写网页

在桌面新建文件夹 `web实验1`，在 VSCode 中通过“文件”->“打开文件夹”打开该目录。新建 `index.html` 文件，输入以下 HTML 代码：

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的第一个网页</title>
</head>
<body>
    <h1>欢迎来到刘天东的网站</h1>
    <p>我是刘天东</p>
</body>
</html>