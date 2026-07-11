# 实验一：Web开发环境搭建与静态站点构建

| 实验名称 | Web开发环境搭建 | 实验类型 | 设计型 |
|---------|----------------|---------|--------|
| 姓名 | 刘天东 | 学号 | [25010104] |
| 组号 | [5] | 实验日期 | 2026年7月6日 |


## 1、实验目的

本次实验旨在从零开始搭建一套完整的 Web 开发环境，通过安装和配置代码编辑器、本地服务器等核心工具，最终成功构建并运行一个静态网页。通过本实验，理解 Web 开发环境的基本组成（编辑器 + 本地服务器 + 版本管理工具），掌握从“编写代码”到“浏览器预览”的完整工作流程。


## 2、实验环境

| 项目 | 详细说明 |
|------|---------|
| **操作系统** | Windows 11 专业版 23H2 |
| **代码编辑器** | Visual Studio Code 1.98.0 |
| **本地服务器** | Live Server 扩展（v5.7.9） |
| **版本管理** | Git 2.50.1 |


## 3、实验过程

### 步骤一：安装 VSCode 代码编辑器

访问 VSCode 官网（https://code.visualstudio.com/），根据操作系统版本下载对应的安装包。双击运行安装程序，按照向导提示完成安装，安装路径保持默认即可。

![VSCode 下载页面截图](./images/install%20VScode.png)
*图1：VSCode 官网下载页面*

安装完成后，打开 VSCode，点击左侧活动栏的“扩展”图标，搜索并安装 **Chinese (Simplified) Language Pack** 中文语言包，重启后界面切换为中文，便于后续操作。

![VSCode 中文语言包安装](./images/Chinese%20install.png)
*图2：VSCode 中文语言包安装界面*

### 步骤二：安装 Live Server 扩展

在 VSCode 扩展商店中搜索 **Live Server**，找到作者为 **Ritwick Dey** 的扩展，点击“安装”。安装完成后，VSCode 右下角状态栏会出现蓝色的 **“Go Live”** 按钮，表示扩展已成功启用。

![Live Server 扩展安装界面](./images/install%20live%20server.png)
*图3：VSCode 扩展商店中的 Live Server 插件*

> **知识点**：Live Server 是一个轻量级的本地开发服务器，它会在本地启动一个 HTTP 服务，监听文件变化并自动刷新浏览器，实现“保存即预览”的高效开发体验。
### 步骤三：创建项目文件夹并编写网页

#### 3.1 创建项目文件夹

在桌面新建一个文件夹，命名为 `网站`。打开 VSCode，点击“文件” → “打开文件夹”，选择该文件夹，将其作为项目工作区。

#### 3.2 新建 HTML 文件

在 VSCode 左侧资源管理器中，右键点击空白区域 → 选择“新建文件”，命名为 `index.html`（注意后缀必须是 `.html`）。

![新建 HTML 文件](./images/establish.png)
*图3：在 VSCode 中新建 HTML 文件*

## 4、实验结果
最终实验结果展示。

![实验结果展示](./images/show.png)
*图4：网站界面展示*

## 5、第一个实验知识点总结

本次实验涉及的核心知识点可分为三大类：**开发环境组成**、**HTML基础语法**、**工具链协同工作**。

### 5.1 核心工具与概念

| 工具/概念 | 类型 | 核心作用 | 本次实验中的关键操作 |
|-----------|------|----------|----------------------|
| **VSCode** | 代码编辑器（IDE） | 提供代码编写、语法高亮、文件管理、扩展插件等核心编辑功能 | 打开项目文件夹、安装 Live Server 扩展、编写 HTML 代码 |
| **Live Server** | VSCode 扩展插件 | 在本地启动一个轻量级 HTTP 服务器，监听文件变化并自动刷新浏览器 | 右键 `index.html` → Open with Live Server |
| **HTML (超文本标记语言)** | 标记语言（非编程语言） | 定义网页的**结构**和**内容**，是网页的骨架 | 使用标签编写 `index.html`，定义标题、段落、图片等元素 |
| **静态站点** | 网站架构类型 | 内容固定，无需数据库和后端服务支持，直接由浏览器解析 HTML/CSS/JS | 通过 Live Server 直接预览，无后端交互需求 |
| **本地服务器** | 网络服务概念 | 在本地计算机上模拟远程服务器环境，方便开发和调试 | Live Server 在 `127.0.0.1:5500` 提供 HTTP 服务 |


### 5.2 核心语法规则

| 规则 | 说明 | 正确示例 | 错误示例 |
|------|------|----------|----------|
| **标签成对出现** | 大多数标签有开始和结束，用 `/` 表示结束 | `<p>文字</p>` | `<p>文字`（缺少闭合） |
| **标签可嵌套** | 标签之间可以层层包裹，类似套娃 | `<div><p>文字</p></div>` | `<p><div>文字</p></div>`（交叉嵌套） |
| **属性写在开始标签内** | 用 `属性名="属性值"` 的形式添加额外信息 | `<img src="photo.png">` | `<img src=photo.png>`（缺少引号） |


# 实验二：代码编辑与管理

## 1、实验目的

本次实验旨在掌握代码编辑器的基本配置与使用，学习Markdown轻量级标记语言的语法规范，并通过Git版本管理工具实现对项目代码的版本控制。通过本实验，理解从“编写代码”到“文档化”再到“版本管理”的完整工作流，为后续团队协作开发奠定基础。


## 2、实验环境

| 项目 | 详细说明 |
|------|---------|
| **操作系统** | Windows 11 专业版 23H2 |
| **代码编辑器** | Visual Studio Code 1.98.0 |
| **版本管理工具** | Git 2.50.1 |
| **远程仓库** | GitHub（仓库名：my-first-website） |
| **项目路径** | `D:/软件开发实践（短学期1-01）/网站/` |
| **文档格式** | Markdown（.md） |


## 3、实验过程

### 步骤一：VSCode 编辑器基本配置

打开VSCode，点击左下角齿轮图标（⚙️）进入“设置”，了解各种个性化配置：更换颜色主题、调整编辑器字号、自动保存功能等等。

### 步骤二：Markdown 语法学习与文档编写

Markdown 是一种轻量级标记语言，用纯文本格式编写，转换为结构化的HTML文档。本次实验使用 Markdown 撰写实验报告。

#### 2.1 创建 README.md 文件

在VSCode左侧资源管理器中，右键 → “新建文件”，命名为 `README.md`（后缀必须为 `.md`）。

![新建md文件](./images/establish%20md%20file.png)
*图1：新建md文件*

#### 2.2 使用 Markdown 语法撰写报告

以下是本次实验报告中使用的核心 Markdown 语法：

| 语法 | 效果 | 示例 |
|------|------|------|
| `# 标题` | 一级标题 | # 实验报告 |
| `## 标题` | 二级标题 | ## 实验环境 |
| `- 列表项` | 无序列表 | - 项目1 |
| `**加粗**` | 文字加粗 | **重要** |
| `![描述](路径)` | 插入图片 | ![截图](./images/photo.png) |
| `` `代码` `` | 行内代码 | `git init` |
| ``` ```代码块``` ``` | 代码块 | 多行代码 |

![Markdown 编辑与预览](./images/markdown%20file%20show.png)
*图2：VSCode 中 Markdown 文件展示*

### 步骤三：Git 版本管理实践

Git 是一个分布式版本控制系统，用于跟踪文件的变化，支持多人协作开发。

本次实验采用 **“先在 GitHub 创建远程仓库，再通过本地终端上传代码”** 的工作流程。

#### 3.1 在 GitHub 上创建远程仓库

1. 登录 GitHub 网站（https://github.com）。
2. 点击右上角的 **“+”** 号，选择 **“New repository”**（新建仓库）。
3. 填写仓库名称：`my-first-website`。
4. 选择仓库可见性为 **Public**（公开），**不勾选**“Add a README”（保持仓库为空）。
5. 点击 **“Create repository”** 按钮完成创建。

![GitHub 创建仓库页面](./images/create%20a%20new%20repository.png)
*图3：在 GitHub 上创建 my-first-website 仓库*

创建成功后，GitHub 会显示仓库地址：`https://github.com/6TDooo/my-first-website.git`

#### 3.2 在本地初始化 Git 仓库

打开 VSCode 终端，确保当前路径在项目文件夹（`网站/`）下，执行以下命令（如图所示）：

![终端输入命令](./images/order.png)
*图4：终端命令

#### 3.3 验证推送结果

推送成功后，打开浏览器访问以下地址：

> `https://github.com/6TDooo/my-first-website`

刷新页面后，可以看到远程仓库中包含以下文件：

- `index.html` — 实验一的静态网页文件
- `README.md` — 本次实验的说明文档
- `images/` — 存放所有实验截图的文件夹

这些文件成功出现在 GitHub 仓库中，说明本地代码已完整推送到远程仓库，版本管理流程全部打通。

![GitHub 仓库页面展示](./images/repository%20show.png)
*图5：GitHub 远程仓库内容展示**

## 4、实验结果

本次实验成功完成了 VSCode 配置、Markdown 文档编写和 Git 版本管理的全流程。以下是关键验证项的汇总：

| 验证项 | 预期结果 | 实际结果 | 状态 |
|--------|----------|----------|------|
| Markdown 预览 | 右侧显示渲染后的内容 | `Ctrl+Shift+V` 正常预览 | ✅ 通过 |
| Git 初始化 | 生成 `.git` 文件夹 | `git init` 执行成功 | ✅ 通过 |
| Git 本地提交 | `git log` 显示提交记录 | 显示 commit ID 和备注 | ✅ 通过 |
| Git 关联远程 | `git remote -v` 显示地址 | 正确关联 `my-first-website` | ✅ 通过 |
| Git 推送 | GitHub 页面显示文件 | 仓库中出现所有文件 | ✅ 通过 |

![GitHub 实验结果展示](./images/context%20show.png)
*图6：GitHub 远程仓库中成功显示所有上传的文件*

## 5、第二个实验知识点总结

### 5.1 本次实验用到的 Git 命令

| 命令 | 作用 | 本次实验中的实际应用 |
|------|------|----------------------|
| `git init` | 在当前文件夹初始化 Git 仓库 | 在 `网站/` 文件夹中启用版本管理 |
| `git add .` | 将所有修改添加到暂存区 | 将网页、报告、图片全部加入待提交列表 |
| `git commit -m "备注"` | 提交暂存区到本地仓库 | 保存一个名为“第一次提交”的历史版本 |
| `git remote add origin 地址` | 关联本地仓库与远程仓库 | 连接 GitHub 上的 `my-first-website` |
| `git push -u origin main` | 首次推送到远程仓库 | 将代码上传至 GitHub |
| `git remote -v` | 查看远程仓库地址 | 验证关联是否成功 |

### 5.2 本次实验的工作流程

text
┌─────────────────────────────────────────────────────────────────────┐
│             本次实验的实际操作流程（GitHub → 本地 → GitHub）        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   1. 在 GitHub 上创建远程仓库（my-first-website，保持为空）         │
│                              ↓                                      │
│   2. 在本地项目文件夹执行 `git init`（初始化本地仓库）              │
│                              ↓                                      │
│   3. `git add .`（将所有文件加入暂存区）                           │
│                              ↓                                      │
│   4. `git commit -m "第一次提交"`（提交到本地仓库）                │
│                              ↓                                      │
│   5. `git remote add origin 仓库地址`（关联远程仓库）              │
│                              ↓                                      │
│   6. `git push -u origin main`（将本地代码推送到 GitHub）          │
│                              ↓                                      │
│   7. 刷新 GitHub 页面，确认文件已成功上传 ✅                       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘

### 5.3 版本管理的价值

| 功能 | 说明 | 对应操作 |
|------|------|----------|
| **历史回溯** | 可以随时回到任意历史版本 | `git log` 查看历史，`git reset` 回退 |
| **云端备份** | 代码保存在 GitHub，电脑坏了也不丢 | `git push` 上传到云端 |
| **进度存档** | 每完成一个功能就提交一次，记录开发轨迹 | `git commit -m "完成XXX功能"` |
| **团队协作** | 多人可同时开发，Git 自动合并代码 | `git pull` 获取队友更新 |


# 实验三：虚拟机安装与配置

## 1、实验目的

本次实验旨在掌握虚拟机软件的安装与基本配置，学习在虚拟机中安装 Linux 系统（Ubuntu）的完整流程，了解虚拟机的硬件资源配置方法，并重点理解和实践虚拟机的三种网络模式（NAT、桥接、仅主机）。通过本实验，为后续 Linux 命令操作和 Web 部署实验搭建基础实验环境。


## 2、实验环境

| 项目 | 详细说明 |
|------|---------|
| **宿主机操作系统** | Windows 11 专业版 23H2 |
| **虚拟机软件** | Oracle VirtualBox 7.2.12 |
| **虚拟机名称** | MyLinux |
| **客户机操作系统** | Ubuntu 26.04 LTS |
| **虚拟机内存** | 2048 MB（2GB） |
| **虚拟硬盘** | 25GB（动态分配） |
| **虚拟硬盘格式** | VDI（VirtualBox Disk Image） |
| **网络模式** | NAT（当前） |


## 3、实验过程

### 步骤一：下载并安装 VirtualBox 虚拟机软件

访问 VirtualBox 官网（https://www.virtualbox.org/），下载与宿主机操作系统对应的安装包。

> **知识点**：VirtualBox 是一款开源免费的虚拟机软件，支持在单一物理机上运行多个客户操作系统，常用于开发测试、系统学习和环境隔离。

### 步骤二：下载 Ubuntu 系统 ISO 镜像

访问 Ubuntu 官网（https://ubuntu.com/download/desktop）或国内镜像站（如清华大学镜像站），下载 Ubuntu 26.04 LTS 桌面版 ISO 镜像文件（约 6.1GB）。

![Ubuntu ISO 下载页面](./images/Ubuntu%20install.png)
*图1：Ubuntu 官网下载页面*

> **知识点**：LTS（Long-Term Support）版本提供长期安全更新和维护支持，适合作为学习和开发环境使用。

### 步骤三：创建虚拟机

打开 VirtualBox，点击“新建”按钮，进入虚拟机创建向导。按照以下配置填写：

| 设置项 | 填写内容 |
|--------|----------|
| 虚拟机名称 | MyLinux |
| 虚拟机文件夹 | E:\VirtualBox |
| ISO 映像文件 | ubuntu-26.04-desktop-amd64.iso |
| 操作系统类型 | Linux |
| 操作系统发行版 | Ubuntu |

![虚拟机创建界面](./images/VirtualBox%20setting.png)
*图3：VirtualBox 创建虚拟机向导*

点击“下一步”，分配内存大小（2048 MB）和虚拟硬盘（25GB，动态分配），完成虚拟机创建。

### 步骤四：配置虚拟机硬件参数

虚拟机创建完成后，点击“设置”进入详细配置界面：

#### 4.1 系统配置

| 配置项 | 当前值 | 说明 |
|--------|--------|------|
| 基础内存 | 2048 MB | 可根据宿主机内存大小调整 |
| 启动顺序 | 光驱 → 硬盘 | 先光驱引导安装，安装后自动切换硬盘 |
| 芯片组 | PIIX3 | 默认即可 |
| 指针设备 | USB触控板 | 支持鼠标无缝切换 |


#### 4.2 显示配置

| 配置项 | 当前值 | 建议值 |
|--------|--------|--------|
| 显存大小 | 16 MB | 可调至 64-128 MB 提升桌面流畅度 |
| 显卡控制器 | VMSVGA | 默认即可 |
| 3D加速 | 开启 | 提升图形性能 |


#### 4.3 存储配置

| 配置项 | 内容 | 说明 |
|--------|------|------|
| 控制器 IDE | ubuntu-26.04-desktop-amd64.iso | 光驱挂载安装镜像 |
| 控制器 SATA | MyLinux.vdi（25GB） | 虚拟硬盘 |


### 步骤五：安装 Ubuntu 系统

点击“启动”按钮，虚拟机从 ISO 镜像引导启动，进入 Ubuntu 安装界面：

选择“Try or Install Ubuntu”，按回车进入安装程序。首先选择“交互式安装”，跟随向导逐步完成安装。然后选择“擦除磁盘并安装 Ubuntu”，将 Ubuntu 安装在虚拟硬盘上（此操作仅在虚拟机内部进行，不影响宿主机文件）。

### 步骤六：网络模式配置与理解

在 VirtualBox 设置中点击“网络”，可配置虚拟机的网络连接方式。本次实验重点实践三种网络模式：

#### 6.1 网络地址转换（NAT）—— 当前模式

虚拟机通过宿主机共享 IP 上网
虚拟机可以访问外网（如 ping 百度）
外部网络无法主动访问虚拟机
适用场景：日常使用、下载软件、系统更新

#### 6.2 桥接网卡（Bridge）—— 部署模式

虚拟机直接接入宿主机所在局域网
路由器为其分配独立局域网 IP
同网段设备可通过 IP 直接访问虚拟机
适用场景：小组互访、Web 服务部署（实验八）

#### 6.3 仅主机（Host-Only）网络

虚拟机仅与宿主机通信
无法访问外网
外部设备无法访问虚拟机
适用场景：隔离测试环境、虚拟机间通信


> **知识点**：网络配置是虚拟化技术的核心能力之一。理解三种模式的差异，对于后续搭建服务器、团队协作部署至关重要。


## 4、实验结果

本次实验成功完成了 VirtualBox 虚拟机软件的安装、Ubuntu 26.04 LTS 系统的安装，以及虚拟机硬件配置和网络配置的实践。以下是关键验证项的汇总：

| 验证项 | 预期结果 | 实际结果 | 状态 |
|--------|----------|----------|------|
| VirtualBox 安装 | 成功安装并打开管理器 | 正常打开 | ✅ 通过 |
| 虚拟机创建 | 成功创建 MyLinux 虚拟机 | 创建成功 | ✅ 通过 |
| Ubuntu ISO 挂载 | 光驱识别 ISO 镜像 | 识别成功 | ✅ 通过 |
| Ubuntu 系统安装 | 安装完成并进入桌面 | 进入 Ubuntu 桌面 | ✅ 通过 |
| 用户登录验证 | 输入密码成功登录 | 登录成功 | ✅ 通过 |
| NAT 网络模式 | 虚拟机可上网 | 可正常联网 | ✅ 通过 |
| 网络模式理解 | 区分三种模式区别 | 已完成对比学习 | ✅ 通过 |


## 5、第三个实验知识点总结

### 5.1 虚拟机核心配置参数

| 配置项 | 本次实验设置 | 作用 |
|--------|-------------|------|
| 内存（RAM） | 2048 MB | 决定虚拟机运行速度，影响多任务处理能力 |
| 虚拟硬盘 | 25 GB（动态分配） | 存储操作系统和文件，动态分配只占用实际使用的空间 |
| 显存 | 16 MB | 影响图形界面显示效果 |
| 启动顺序 | 光驱 → 硬盘 | 优先从 ISO 引导安装，安装后从硬盘启动 |
| 显卡控制器 | VMSVGA | VirtualBox 推荐的虚拟显卡 |

### 5.2 三种网络模式对比（核心知识点）

| 对比项 | NAT | 桥接 | 仅主机 |
|--------|-----|------|--------|
| **虚拟机访问外网** | 能 | 能 | 不能 |
| **宿主机访问虚拟机** | 需端口转发 | 通过 IP | 通过虚拟网卡 |
| **同局域网设备访问虚拟机** | 不能 | 通过 IP | 不能 |
| **虚拟机 IP 来源** | 由 VirtualBox 内部分配 | 由路由器 DHCP 分配 | 由 VirtualBox 虚拟 DHCP 分配 |
| **适用场景** | 日常上网、下载更新 | 部署网站、团队互访 | 隔离测试环境 |

### 5.3 虚拟机安装流程图

┌─────────────────────────────────────────────────────────────────────┐
│                    虚拟机安装与配置完整流程                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. 下载 VirtualBox 安装包                                          │
│              ↓                                                      │
│  2. 安装 VirtualBox（选择纯英文路径，避免权限问题）                   │
│              ↓                                                      │
│  3. 下载 Ubuntu ISO 镜像（LTS 版本，约 6.1GB）                      │
│              ↓                                                      │
│  4. 创建虚拟机 → 设置名称/类型/版本                                  │
│              ↓                                                      │
│  5. 配置硬件 → 内存（2GB+）/ 显存 / 虚拟硬盘（20GB+）               │
│              ↓                                                      │
│  6. 挂载 ISO 镜像 → 启动虚拟机                                      │
│              ↓                                                      │
│  7. 安装 Ubuntu → 选择“擦除磁盘安装” → 设置用户信息                  │
│              ↓                                                      │
│  8. 安装完成 → 重启 → 登录 Ubuntu 桌面                              │
│              ↓                                                      │
│  9. 配置网络模式 → NAT（当前）/ 桥接（部署时切换）                   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘

# 实验四：Linux 基本操作


## 1、实验目的

掌握 Linux 命令行的基本使用，包括文件导航、文件操作和软件包管理。


## 2、实验环境

| 项目 | 说明 |
|------|------|
| 操作系统 | Ubuntu 26.04 LTS |
| 终端 | GNOME Terminal |


## 3、实验过程

### Part 1：文件导航

bash
pwd
ls
cd Desktop
cd ..
cd ~

![文件导航 实验结果展示](./images/file%20navigation.png)
*图1：文件导航*

### Part 2：文件操作

`mkdir linux_test` ：创建了 `linux_test` 文件夹。
`cd linux_test` ：进入 `linux_test` 文件夹。
`touch hello.txt` ：创建空白文件 `hello.txt`。
`echo "hello,linux" > hello.txt` ：向 `hello.txt` 写入内容 `hello,linux`。
`cat hello.txt` ：查看文件内容，输出 `hello,linux`。
`cp hello.txt hello_copy.txt` ：复制 `hello.txt`，生成 `hello_copy.txt`。
`mv hello.txt hello_new.txt` ：将 `hello.txt` 重命名为 `hello_new.txt`。
`rm hello_copy.txt` ：删除 `hello_copy.txt`。
`ls` ：确认当前目录下只剩下 `hello_new.txt`。

![文件操作截图](./images/File%20Manipulation.png)
*图2：文件操作*

### Part 3：软件包管理

`sudo apt update` ：更新本地软件包列表。
`sudo apt install fastfetch -y` ：安装 `fastfetch` 工具，`-y` 自动确认。
`fastfetch` ：运行 `fastfetch`，显示系统信息。

![软件安装截图](./images/APP%20installing.png)
*图3：软件安装*

## 4、实验结果

本次实验成功完成了 Linux 基本操作的三个核心任务：文件导航、文件操作和软件包管理。所有命令均正常执行，达到预期效果。

| 任务 | 核心命令 | 预期结果 | 实际结果 | 状态 |
|------|----------|----------|----------|------|
| 文件导航 | `pwd`、`ls`、`cd` | 正确显示路径和目录内容 | 成功切换目录并确认位置 | ✅ 通过 |
| 文件操作 | `mkdir`、`touch`、`echo`、`cat`、`cp`、`mv`、`rm` | 完成文件增删改查操作 | 成功创建、复制、重命名、删除文件 | ✅ 通过 |
| 软件包管理 | `sudo apt update`、`sudo apt install fastfetch -y`、`fastfetch` | 成功安装并运行软件 | `fastfetch` 正常显示系统信息 | ✅ 通过 |

![软件安装运行结果](./images/APP%20install%20result.png)
*图4：fastfetch 运行结果*

## 5、第四个实验知识点总结

### 5.1 文件操作命令

| 命令 | 作用 |
|------|------|
| `touch 文件名` | 新建文件 |
| `cat 文件名` | 打开/查看文件内容 |
| `cp 源文件 目标文件` | 复制文件 |
| `echo "内容" > 文件名` | 向文件写入内容 |

### 5.2 软件包管理命令

| 命令 | 作用 |
|------|------|
| `sudo apt update` | 更新软件源（下载前先刷新） |
| `sudo apt install 软件名` | 安装软件 |
| `sudo apt install 软件名 -y` | 安装软件（自动确认） |
| `sudo apt remove 软件名` | 卸载软件 |

**常用示例：**

bash
touch hello.txt                 # 新建文件
cat hello.txt                   # 查看文件
echo "hello" > hello.txt        # 写入内容
cp hello.txt hello_copy.txt     # 复制文件

sudo apt update                 # 刷新软件源
sudo apt install fastfetch -y   # 安装软件

## 6、出现问题及解决方案

| 问题描述 | 原因分析 | 解决方案 |
|----------|----------|----------|
| Ubuntu 系统安装过程中多次卡住，进度条长时间停滞不前，导致安装失败，需要反复尝试 | 可能原因：1. 虚拟机分配的内存不足（初始设为 2048MB，但系统安装时资源开销较大）；2. 下载的 ISO 镜像文件部分损坏或读取不完整；3. VirtualBox 设置与当前系统环境存在兼容性问题 | 1. 在 VirtualBox 设置中将虚拟机内存从 2048MB 调整至 4096MB，确保安装过程有充足资源；2. 重新下载 Ubuntu ISO 镜像（更换为国内镜像源，如清华镜像站），确保镜像完整无误；3. 删除旧虚拟机，重新创建并严格按照安装向导逐步操作；4. 安装过程中保持网络畅通，避免中途断连 |

# 实验五：Linux 账户与权限管理


## 1、实验目的

掌握 Linux 的用户管理、组管理和文件权限管理，熟悉 `useradd`、`passwd`、`usermod`、`chmod`、`chown`、`chgrp` 等命令的使用。


## 2、实验环境

| 项目 | 说明 |
|------|------|
| 操作系统 | Ubuntu 26.04 LTS |
| 终端 | GNOME Terminal |


## 3、实验过程

**用户管理：** 使用 `whoami` 和 `id` 查看当前用户信息，用 `sudo useradd testuser` 创建新用户，`sudo passwd testuser` 设置密码，通过 `id testuser` 和 `tail -n 3 /etc/passwd` 确认创建成功。用 `su - testuser` 切换用户验证，`exit` 返回，最后用 `sudo userdel -r testuser` 删除用户。

![用户管理](./images/account%20setup.png)
*图1：用户管理 运行结果*

**组管理：** 用 `sudo groupadd devgroup` 创建组，`tail -n 3 /etc/group` 确认添加。创建 testuser 用户后，用 `sudo usermod -aG devgroup testuser` 将用户加入组，`id testuser` 确认组已加入。最后用 `sudo groupdel devgroup` 删除组。

![组管理](./images/group%20manage.png)
*图2：组管理 运行结果*

**文件权限管理：** 用 `touch test_permission.txt` 创建文件并写入内容，`ls -l` 查看权限格式（`-rw-r--r--`），其中 `r` 读、`w` 写、`x` 执行，三组分别对应所有者、组、其他用户。用 `chmod 755`、`644`、`600` 修改权限并用 `ls -l` 观察变化（755 适用于目录，644 适用于普通文件，600 适用于私密文件）。用 `sudo chown testuser test_permission.txt` 修改所有者，`sudo chgrp devgroup test_permission.txt` 修改所属组，`ls -l` 确认变化。实验结束后执行 `rm test_permission.txt`、`sudo userdel -r testuser`、`sudo groupdel devgroup` 清理。

![文件权限管理](./images/file%20permission%20management.png)
*图3：文件权限管理 运行结果*

## 4、实验结果

成功完成用户管理（`sudo useradd`、`sudo passwd`、`id`）、组管理（`sudo groupadd`、`sudo usermod -aG`）和文件权限管理（`chmod`、`chown`、`chgrp`）三项任务，所有命令均正常执行。


## 5、第五个实验知识点总结

用户与组命令：`sudo useradd` 创建用户，`sudo passwd` 设置密码，`sudo userdel -r` 删除用户，`sudo groupadd` 创建组，`sudo usermod -aG` 将用户加入组，`id` 查看用户信息。文件权限中 `r`（4）读、`w`（2）写、`x`（1）执行，三组分别对应所有者（u）、所属组（g）、其他用户（o）。`chmod` 修改权限（如 `chmod 755`），`sudo chown` 修改所有者，`sudo chgrp` 修改所属组，`ls -l` 查看权限。数字组合中 7=rwx、6=rw-、5=r-x、4=r--，常用 755 用于目录、644 用于普通文件、600 用于私密文件。

## 6、心得体会

通过本次实验，我掌握了 Linux 用户管理、组管理和文件权限管理的基本操作。一开始我对 `sudo` 的作用不太理解，后来才明白它是临时获取管理员权限的关键，而普通用户权限受限是为了保证系统安全。在文件权限部分，我理解了 `rwx`（读、写、执行）的含义以及 `chmod` 数字法和字母法的使用逻辑，比如 `755` 和 `644` 分别适用于目录和普通文件。通过实际操作创建用户、组并修改文件所有者，我认识到 Linux 系统通过“用户-组-权限”三层结构实现了精细化的访问控制，这对系统安全和多用户协作至关重要。同时我也体会到，权限管理不仅是一项技术操作，更是一种系统设计思维的体现——通过最小权限原则降低安全风险。

# 实验六：Linux 环境配置

## 1、实验目的

掌握 Linux 环境变量、命令别名和配置文件的管理，熟悉 `export`、`alias`、`~/.bashrc` 的使用，理解临时配置与永久配置的区别。


## 2、实验环境

| 项目 | 说明 |
| 操作系统 | Ubuntu 26.04 LTS |
| 终端 | GNOME Terminal |


## 3、实验过程

首先使用 `echo $PATH` 和 `env` 查看当前系统的环境变量，了解系统查找命令的路径和当前会话的所有变量。

然后用 `export MY_NAME="Liu"` 创建一个自定义变量，用 `echo $MY_NAME` 验证创建成功。为了让配置永久生效，用 `nano ~/.bashrc` 编辑用户级配置文件，在文件末尾添加 `export MY_NAME="Liu"`，保存退出后用 `source ~/.bashrc` 使配置立即生效，之后关闭终端重新打开，输入 `echo $MY_NAME` 验证变量依然存在。

![变量永久保存](./images/environment%20variable%20permanent.png)
*图1：变量永久保存 结果展示*

接着用 `alias h='history'` 设置命令别名，输入 `h` 即可查看历史命令列表，验证别名生效。

![设置别名](./images/alias%20history%201.png)
![设置别名](./images/alias%20history%202.png)
*图2：别名运行展示*

最后用 `cat /etc/environment` 和 `cat /etc/profile` 查看系统级全局配置文件，理解用户级配置（`~/.bashrc`）仅对当前用户生效，系统级配置（`/etc/environment`、`/etc/profile`）对所有用户生效。

![查看系统级全局配置文件](./images/bashrc%20edit.png)
*图3：系统全局配置文件*

## 4、实验结果

| 任务 | 核心命令 | 状态 |
|------|----------|------|
| 查看环境变量 | `echo $PATH`、`env` | ✅ |
| 创建自定义变量 | `export MY_NAME="Liu"`、`echo $MY_NAME` | ✅ |
| 永久配置生效 | `nano ~/.bashrc`、`source ~/.bashrc` | ✅ |
| 设置命令别名 | `alias h='history'`、`h` | ✅ |


## 5、知识总结

环境变量用 `export` 创建，用 `echo $变量名` 查看，临时变量仅在当前终端有效，需写入 `~/.bashrc` 并执行 `source` 才能永久生效。命令别名用 `alias` 设置，同样写入 `~/.bashrc` 可永久生效。`~/.bashrc` 是用户级配置文件，仅对当前用户生效；`/etc/environment` 和 `/etc/profile` 是系统级配置文件，对所有用户生效。


## 6、出现问题及解决方案

| 问题 | 解决方案 |
|------|----------|
| 终端提示符变成 `>` | 按 `Ctrl+C` 退出，输入 `clear` 清屏后重新输入命令 |
| 环境变量关掉终端后消失 | 将 `export` 写入 `~/.bashrc` 后执行 `source ~/.bashrc` |

## 7、心得体会

通过本次实验，我掌握了 Linux 环境变量和命令别名的配置方法。一开始我不太理解为什么要改 `~/.bashrc` 文件，觉得直接用 `export` 和 `alias` 就够了，但关掉终端重新打开后发现之前设置的变量全部失效，这才明白**临时配置和永久配置的区别**——临时变量只对当前会话生效，只有写入配置文件才能持久化保存。我也理解了用户级配置文件（`~/.bashrc`）和系统级配置文件（`/etc/environment`、`/etc/profile`）的区别：前者只影响当前用户，后者影响所有用户。环境变量和别名看似不起眼，但在日常开发中能极大提升效率，比如把冗长的命令简化为几个字母。本次实验让我意识到，一个好的开发环境不是“装好就能用”的，而是需要根据个人习惯不断优化和配置，这种“让工具适应人”的思路对后续学习和工作都很有帮助。

# 实验七：远程管理

## 1、实验目的

掌握 SSH 远程登录、SCP 文件传输和 Git 服务的基本配置与使用，理解远程管理工具在 Linux 系统管理中的作用。


## 2、实验环境

| 项目 | 说明 |
|------|------|
| 宿主机操作系统 | Windows 11 |
| 虚拟机操作系统 | Ubuntu 26.04 LTS |
| SSH 服务 | OpenSSH Server |
| 连接方式 | SSH 端口转发（NAT 模式） |


## 3、实验过程

在 Ubuntu 终端中执行 `sudo apt update` 更新软件源，然后执行 `sudo apt install openssh-server -y` 安装 SSH 服务，安装完成后执行 `sudo systemctl status ssh` 确认服务处于 `active (running)` 状态，说明 SSH 服务已正常运行。

![ssh服务正常运行](./images/active%20running.png)
*图1：ssh服务 结果展示*

接着执行 `hostname -I` 查看虚拟机的 IP 地址为 `10.0.2.15`。由于虚拟机使用 NAT 网络模式，宿主机无法直接访问该 IP，因此在 VirtualBox 中设置端口转发：将主机的 `2222` 端口映射到虚拟机的 `22` 端口。设置完成后在 Windows 命令提示符中执行 `ssh -p 2222 ubuntu@127.0.0.1` 连接 Ubuntu，输入密码后登录成功。文件传输使用 `scp` 命令，先在 Windows 本地创建 `test.txt` 文件，然后执行 `scp -P 2222 test.txt ubuntu@127.0.0.1:/home/ubuntu/` 将文件传到 Ubuntu 的家目录中，登录 Ubuntu 后执行 `ls` 确认 `test.txt` 已成功传输。

![文件传输1](./images/transport.png)
![文件传输2](./images/file%20transport.png)
*图2：文件传输 结果展示*

Git 服务架设方面，在 Ubuntu 终端执行 `sudo apt install git -y` 安装 Git，安装完成后执行 `git --version` 确认版本号为 `git version 2.53.0`，表明 Git 服务已架设成功。

![git服务架设](./images/git%20service%20setting.png)
*图3：git服务架设*


## 4、实验结果

| 任务 | 核心命令 | 状态 |
|------|----------|------|
| SSH 服务安装与启动 | `sudo apt install openssh-server`、`sudo systemctl status ssh` | ✅ |
| 端口转发配置 | VirtualBox 网络设置 → 端口转发 | ✅ |
| SSH 远程登录 | `ssh -p 2222 ubuntu@127.0.0.1` | ✅ |
| SCP 文件传输 | `scp -P 2222 test.txt ubuntu@127.0.0.1:/home/ubuntu/` | ✅ |
| Git 安装与验证 | `sudo apt install git -y`、`git --version` | ✅ |


## 5、第六个实验知识点总结

SSH（Secure Shell）是一种加密网络协议，用于在不安全网络中实现安全的远程登录和命令执行。SCP（Secure Copy）基于 SSH 协议实现加密文件传输。NAT 模式下宿主机无法直接访问虚拟机，需通过端口转发将虚拟机服务端口映射到宿主机端口。Git 是分布式版本控制系统，安装后可通过 SSH 协议进行远程仓库操作。常用命令：`ssh -p 端口 用户@地址` 远程登录，`scp -P 端口 本地文件 用户@地址:远程路径` 上传文件，`git --version` 验证 Git 安装。


## 6、出现问题及解决方案

| 问题 | 解决方案 |
|------|----------|
| SSH 连接失败或 ping 不通 | 设置端口转发，将主机 2222 端口映射到虚拟机 22 端口 |
| 第一次连接提示密钥验证 | 输入 `yes` 确认，系统自动保存到 `known_hosts` |
| SCP 命令报错 `No such file or directory` | 确认本地文件存在且路径正确，或使用绝对路径 |


## 7、心得体会

通过本次实验，我掌握了 SSH 远程登录、SCP 文件传输和 Git 服务架设的基本方法，理解了端口转发在 NAT 网络模式下的作用。SSH 作为 Linux 远程管理的核心工具，在服务器运维和团队协作中具有重要价值。本次实验为后续的 Web 部署和团队协作奠定了基础。

# 实验八：Web 软件部署


## 1、实验目的

综合运用本学期所学工具，完成 Web 静态站点从开发到部署的全过程。


## 2、实验环境

| 项目 | 说明 |
|------|------|
| 开发环境 | Windows 11 + VSCode |
| 服务器环境 | Ubuntu 26.04 LTS（虚拟机） |
| Web 服务器 | Nginx |
| 远程管理 | SSH + SCP |


## 3、实验过程

首先在 Windows 命令提示符中通过 SSH 连接到 Ubuntu：`ssh -p 2222 ubuntu@127.0.0.1`，输入密码后登录成功。然后在 Ubuntu 终端中执行 `sudo apt update` 更新软件源，再执行 `sudo apt install nginx -y` 安装 Nginx Web 服务器。
接着在 Windows 命令提示符中使用 SCP 命令将网页文件传输到 Ubuntu 的家目录：`scp -P 2222 "D:\软件开发实践（短学期1-01）\网站\刘天东的网站.html" ubuntu@127.0.0.1:/home/ubuntu/`，输入密码后传输成功。回到 SSH 连接的 Ubuntu 终端，将网页文件复制到 Nginx 的默认网页目录并重命名为 `index.html`：`sudo cp /home/ubuntu/刘天东的网站.html /var/www/html/index.html`，然后执行 `sudo chown www-data:www-data /var/www/html/index.html` 和 `sudo chmod 644 /var/www/html/index.html` 修改文件权限，让 Nginx 可以正常读取。

![安装NGINX](./images/NGINX%20install.png)
*图1：安装NGINX*

接着启动 Nginx 服务：`sudo systemctl start nginx`、`sudo systemctl enable nginx`，用 `sudo systemctl status nginx` 确认服务处于 `active (running)` 状态。最后在 Ubuntu 终端中执行 `curl http://127.0.0.1`，返回了网页内容，说明网页已成功部署到服务器。

![Ubuntu返回网页内容](./images/HTML%20content.png)
*图2：Ubuntu能查询到网页内容*

在 Windows 命令提示符中用 `scp` 将网页文件传输到 Ubuntu（`scp "D:\路径\刘天东的网站.html" ubuntu@10.150.13.192:/home/ubuntu/`），然后通过 `ssh ubuntu@10.150.13.192` 远程连接 Ubuntu，将网页文件复制到 Nginx 目录并重命名为 `index.html`，修改权限后启动 Nginx 服务。用 `curl http://127.0.0.1` 验证部署成功。最后输入 `hostname -I` 查询 IP 地址为 `10.150.103.10`，将 `http://10.150.103.10` 发给组员，组员在浏览器中成功访问，显示网页内容。

![访问成功](./images/visit%20website.jpg)
*图3：访问成功*

## 4、实验结果

| 验证项 | 验证方式 | 状态 |
|--------|----------|------|
| SSH 连接 Ubuntu | `ssh -p 2222 ubuntu@127.0.0.1` | ✅ |
| Nginx 安装 | `sudo apt install nginx -y` | ✅ |
| SCP 文件传输 | `scp` 命令传输成功 | ✅ |
| Nginx 服务运行 | `sudo systemctl status nginx` 显示 active (running) | ✅ |
| Ubuntu 本地访问 | `curl http://127.0.0.1` 返回网页内容 | ✅ |


## 5、第八个实验知识点总结

| 命令 | 作用 |
|------|------|
| `ssh -p 端口 用户@地址` | SSH 远程连接 |
| `scp -P 端口 本地文件 用户@地址:远程路径` | 上传文件到服务器 |
| `sudo apt install nginx -y` | 安装 Nginx |
| `sudo systemctl start nginx` | 启动 Nginx |
| `sudo systemctl status nginx` | 查看 Nginx 服务状态 |
| `sudo cp 源文件 目标路径` | 复制文件 |
| `sudo chown 用户:组 文件` | 修改文件所有者 |
| `sudo chmod 644 文件` | 设置文件权限 |
| `curl http://127.0.0.1` | 本地测试 Web 服务 |

## 6、心得体会

通过本次实验，我完整经历了 Web 静态站点从开发到部署的全过程。从在 VSCode 中写 HTML，到在 Ubuntu 服务器上通过 Nginx 部署并访问，我真正理解了“开发”和“部署”的区别。Web 部署不仅涉及文件传输，还需要考虑服务器环境、目录权限、网络配置等多个方面，这些知识让我对软件开发的完整链路有了更清晰的认识。


*报告完成日期：2026年7月11日*