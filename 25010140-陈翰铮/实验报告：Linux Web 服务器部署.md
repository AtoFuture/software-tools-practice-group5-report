# 实验报告：Linux Web 服务器部署

**实验人**：陈翰铮 \&emsp; **学号**：25010140 \&emsp; **日期**：2026年7月10日

## 1、实验目的

- 掌握 VirtualBox 虚拟机的网络配置，能够在宿主机与虚拟机之间实现网络互通。

- 掌握 Ubuntu Linux 的常用命令行操作（`cd`、`ls`、`mkdir`、`chmod`、`chown` 等），能够独立完成文件与目录的管理。

- 理解 Linux 用户与权限管理机制，能够为 Web 目录和 SSH 安全目录配置正确的权限。

- 掌握 Linux 环境变量配置方法（`~/.bashrc`、`export`），能够自定义系统变量。

- 掌握 Apache Web 服务器的安装、启动与验证，能够通过物理机浏览器访问虚拟机中部署的网站。

- 掌握 OpenSSH-Server 的安装与配置（含端口修改、防火墙放行），能够使用 SFTP 客户端完成远程文件传输。

## 2、实验环境

|项目|详情|
|---|---|
|宿主机操作系统|你的宿主机系统，如 Windows 11 |
|虚拟机软件|Oracle VM VirtualBox |
|虚拟机配置|内存 2GB / 硬盘 20GB / CPU 2核|
|虚拟机操作系统|Ubuntu 22.04.5 LTS (Jammy)|
|虚拟机用户名|vboxuser|
|虚拟机 IP 地址|10.150.224.226|
|网络模式|桥接网卡（Bridge Adapter）|
|Web 服务器|Apache/2.4.52|
|远程管理|OpenSSH-Server 8.9p1（端口：2222）|
|SFTP 客户端|FileZilla |
|宿主机浏览器|Edge|

## 3、实验过程

### 步骤一：虚拟机创建与网络配置

在 VirtualBox 中创建 Ubuntu 22.04 LTS 虚拟机，分配 2GB 内存和 20GB 硬盘。安装完成后，将虚拟机的网络适配器从默认的“网络地址转换（NAT）”修改为“桥接网卡”，并选择宿主机当前使用的物理网卡。

修改完成后，在虚拟机中执行 `ip a` 命令查看 IP 地址。

![VirtualBox 网络设置](./image/wangluo.png)

*图1：VirtualBox 桥接网络设置界面*

![ip a 命令输出](./image/checkid.png)

*图2：虚拟机 IP 地址查询结果*

**结果**：虚拟机成功获得 IP 地址，宿主机可正常 ping 通该地址。

### 步骤二：更换软件源与系统更新

首次执行 `sudo apt update` 时出现 `NOSPLIT` 和 `File has unexpected size` 报错，判断为软件源镜像缓存异常及网络中存在损坏的透明缓存代理导致。解决方案：更换为清华大学镜像源，并强制刷新缓存。

```bash
# 更换为清华源
sudo sed -i 's/cn.archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# 降级为 HTTP（绕过本地代理缓存干扰）
sudo sed -i 's/https:\/\//http:\/\//g' /etc/apt/sources.list
# 清空损坏缓存并更新
sudo rm -rf /var/lib/apt/lists/*
sudo apt clean
sudo apt update
```

**结果**：sudo apt update 正常完成，无红色报错。

### 步骤三：安装 Apache Web 服务器

使用 apt 包管理器安装 Apache2，并检查服务状态。

```bash
sudo apt install apache2 -y
sudo systemctl status apache2
```

![ubuntu终端页面](./image/apache.png)

验证：在宿主机浏览器中输入虚拟机 IP 地址 [http://10.150.226.224/](http://10.150.226.224/)，显示 Apache2 Ubuntu 默认欢迎页。

![网页截图](./image/welcome.png)

*图3：网页截图*

### 步骤四：Linux 基本命令练习

在 /home/vboxuser 目录下执行以下基本操作命令，熟悉 Linux 文件系统。

|命令|作用|执行结果|
|---|---|---|
|`pwd`|显示当前路径|/home/vboxuser|
|`ls -la`|列出目录内容（含隐藏文件）|显示家目录所有文件|
|`mkdir test_dir`|创建测试目录|目录创建成功|
|`touch test.txt`|创建空文件|文件创建成功|
|`cp test.txt test_copy.txt`|复制文件|复制成功|
|`rm test.txt`|删除文件|删除成功|
|`rmdir test_dir`|删除空目录|目录删除成功|

### 步骤五：环境变量配置

编辑用户级配置文件 `~/.bashrc`，添加自定义环境变量 `MY_WEB`，指向网站根目录 `/var/www/html/`。

执行命令如下：

```bash
echo 'export MY_WEB="/var/www/html"' >> ~/.bashrc
source ~/.bashrc
echo $MY_WEB
```

### 步骤六：Linux 账户与权限配置

#### （1）网站目录权限配置

修改 `/var/www/html/` 目录的所有者和权限，确保当前用户可管理，Apache 可读取。

```bash
sudo chown -R [用户名]:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
ls -la /var/www/html/
```

#### （2）SSH 安全目录权限配置

配置 `~/.ssh` 目录权限为 700（仅所有者可读写执行），保证 SSH 连接安全。

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ls -la ~/ | grep .ssh
```

![截图](./image/guanxianpeizhi.png)

*图4：权限配置截图*

### 步骤七：SSH 远程管理配置

安装 OpenSSH-Server，修改默认端口（22 → 2222），配置防火墙放行新端口，并重启服务。

```bash
# 安装 SSH 服务端
sudo apt install openssh-server -y

# 修改 SSH 端口为 2222
sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config

# 重启 SSH 服务
sudo systemctl restart ssh

# 防火墙放行 2222 端口
sudo ufw allow 2222/tcp
sudo ufw status
```

![SSH服务状态](./image/confirmssd.png)

*图5：SSH 服务 active (running)*

![防火墙状态](./image/checklisten.png)

*图6：防火墙已放行 2222/tcp*

### 步骤八：SFTP 文件传输（FileZilla）

在宿主机上使用 FileZilla 客户端，通过 SFTP 协议连接虚拟机（端口 2222），将本地网页文件上传至 `/var/www/html/` 目录。

|连接参数|值|
|---|---|
|协议|SFTP (SSH File Transfer Protocol)|
|主机|10.150.224.226|
|端口|2222|
|用户名|vboxuser|
|密码|vboxuser0217|

![FileZilla连接成功](./image/filezilla.png)
*图7：FileZilla SFTP 连接成功*

![文件上传成功](./image/filezillasuccess.png)

*图8：index.html 已上传至 /var/www/html/*

### 步骤九：网站访问最终验证

在宿主机浏览器中访问 [http://10.150.226.224]

![自定义网站页面](./image/website.png)

*图9：自定义网站页面访问成功*

## 4、实验结果

|测试项|测试内容|预期结果|实际结果|
|---|---|---|---|
|Apache 服务状态|`sudo systemctl status apache2`|active (running)|✓ 通过|
|SSH 服务状态|`sudo systemctl status ssh`|active (running)|✓ 通过|
|网站页面访问|宿主机浏览器访问 http://10.150.226.224|显示自定义页面|✓ 通过|
|SFTP 连接|FileZilla 连接 sftp://10.150.226.224:2222|连接成功，显示远程目录|✓ 通过|
|环境变量|`echo $MY_WEB`|输出 /var/www/html|✓ 通过|
|网站目录权限|`ls -la /var/www/html/`|755，所有者 vboxuser|✓ 通过|
|.ssh 目录权限|`ls -la ~/ | grep .ssh`|700 (drwx------)|✓ 通过|
|防火墙配置|`sudo ufw status`|2222/tcp ALLOW|✓ 通过|

## 5、知识总结

### 5.1 常用 Linux 命令

|命令|作用|示例|
|---|---|---|
|`pwd`|显示当前工作目录|pwd → /home/user|
|`ls`|列出目录内容|ls -la 显示详细信息|
|`cd`|切换目录|cd /var/www/html/|
|`mkdir`|创建新目录|mkdir my_folder|
|`touch`|创建空文件|touch index.html|
|`cp`|复制文件/目录|cp file1 file2|
|`mv`|移动/重命名|mv old.txt new.txt|
|`rm`|删除文件/目录|rm -r folder|
|`chmod`|修改权限|chmod 755 file|
|`chown`|修改所有者|chown user:group file|

### 5.2 关键配置文件

|配置文件|作用|适用范围|
|---|---|---|
|`~/.bashrc`|用户级 Shell 配置（别名、环境变量）|当前用户|
|`/etc/apt/sources.list`|APT 软件源列表|系统全局|
|`/etc/ssh/sshd_config`|SSH 服务端配置（端口、认证方式等）|系统全局|
|`/var/www/html/`|Apache 默认网站根目录|Web 服务|

### 5.3 权限数值含义

|数字|权限组合|含义|典型应用场景|
|---|---|---|---|
|7|rwx|读 + 写 + 执行|文件所有者|
|6|rw-|读 + 写|普通文件|
|5|r-x|读 + 执行|同组用户 / 其他用户|
|4|r--|只读|配置文件|
|755|drwxr -xr -x|目录标准权限|Web 站点目录|
|700|drwx - - - - - -|仅所有者可读写执行|\~/.ssh 目录|

## 6、出现问题及解决方案

|序号|问题现象|原因分析|解决方案|
|---|---|---|---|
|1|图形界面终端闪动无法打开|VirtualBox 与 Ubuntu Wayland 显示服务器兼容性问题|改用 Ctrl+Alt+F3 进入黑屏 TTY；或在登录界面选择“Ubuntu on Xorg”|
|2|sudo apt update 报错 NOSPLIT|系统时间不准确，导致签名验证失败|使用 sudo date -s 校正时间|
|3|apt update 报错 File has unexpected size|网络中存在坏掉的透明缓存代理（192.168.112.97:80），返回了错误页面|更换为清华大学镜像源（mirrors.tuna.tsinghua.edu.cn），降级为 HTTP 协议|
|4|apt install 进度条卡住不动|HTTPS 加密流量被缓存代理拦截，无法正常转发|临时切换 VirtualBox 网络模式为 NAT（绕过代理），完成安装后再切回桥接模式|
|5|FileZilla 报错“连接被拒绝”|Ubuntu 未安装 OpenSSH-Server|sudo apt install openssh -server -y|
|6|FileZilla 报错“身份验证失败”|用户名/密码错误，或输入了 root 账户|确认用户名为 vboxuser；若密码遗忘，使用 sudo passwd vboxuser 重置|
|7|宿主机无法访问虚拟机网站（10.0.2.15 打不开）|虚拟机使用 NAT 模式，宿主机无法直接访问|在 VirtualBox 中将网络模式改为“桥接网卡”，重新获取 IP 后访问|
|8|同一局域网其他设备无法访问|Apache 监听地址正确（0.0.0.0:80），防火墙已关闭，判断为路由器开启了 AP 隔离|该问题由网络环境限制导致，不影响实验评分；宿主机访问正常即满足要求|

## 7、心得体会

### 技术层面

通过本次实验，我第一次完整地经历了一个 Web 服务器从零到上线的全过程。从 VirtualBox 虚拟机创建、Ubuntu 系统安装，到 Apache Web 服务器的部署、SSH 远程管理配置，再到 SFTP 文件传输，每一个环节都让我对 Linux 运维有了更加具象的理解。

其中印象最深刻的是权限管理机制：755 和 700 不再只是抽象的数字，而是真实决定了“谁能看、谁能改、谁能运行”的规则。当我把 /var/www/html/ 的权限配置正确并成功上传网页时，才真正理解为什么 Linux 被广泛应用于服务器领域——这种精细的权限控制是安全性的基石。

此外，环境变量 MY_WEB 的配置也让我体会到了“一次配置，处处可用”的效率提升，后续访问网站目录只需敲 cd $MY_WEB 即可，免去了反复输入长路径的麻烦。

### 思政层面

本次实验所用到的所有核心软件——Ubuntu、Apache、OpenSSH——均为开源软件，这让我深刻感受到了开源社区的共享精神。无需任何商业授权费用，就能搭建一套完整的企业级 Web 服务环境，这在商业软件时代是不可想象的。

同时，本次实验中也多次用到了国内的开源镜像站（清华大学镜像源）。这些基础设施的存在，不仅保障了国内开发者能够快速、稳定地获取软件包，也体现了我国在互联网基础设施建设上的进步。作为未来的软件工程师，我们应当在学习和工作中积极拥抱开源、参与开源，同时关注技术自主与安全可控，为国产软件生态的发展贡献自己的力量。

## 附录：关键命令速查

```bash
# 系统更新与软件安装
sudo apt update
sudo apt install apache2 -y
sudo apt install openssh-server -y

# 权限管理
sudo chown -R [用户名]:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
chmod 700 ~/.ssh

# SSH 端口修改
sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
sudo systemctl restart ssh
sudo ufw allow 2222/tcp

# 环境变量
echo 'export MY_WEB="/var/www/html"' >> ~/.bashrc
source ~/.bashrc

# 网络查看
ip a

# 服务状态
sudo systemctl status apache2
sudo systemctl status ssh
```


