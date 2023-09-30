#!/bin/bash

# 安装所需的软件包
apt update
apt install wget curl screen git -y

#关闭防火墙
ufw disable

# 下载并执行 bbr.sh 脚本
wget https://raw.githubusercontent.com/1kst/bbr/main/bbr.sh && bash bbr.sh

# 安装 XrayR
wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh

# 检查安装是否成功
if [ $? -eq 0 ]; then
  echo "XrayR 安装成功！"
else
  echo "XrayR 安装失败。请检查网络连接和安装脚本URL。"
  exit 1
fi

# Clone the private GitHub repository to the root directory
git clone --depth 1 --branch main https://github.com/1kst/xrayconfig.git /root/xrayconfig

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "GitHub仓库克隆成功！"
else
  echo "GitHub仓库克隆失败。请检查网络连接和仓库URL。"
  exit 1
fi

# 复制节点配置并覆盖Xrayr目录
cp -r /root/xrayconfig/DE/* /etc/XrayR/

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "文件已成功复制到/etc/XrayR/目录。"
else
  echo "文件复制失败。请检查目录和文件权限。"
  exit 1
fi

# Clean up: Remove the cloned repository in the root directory
rm -rf /root/xrayconfig

echo "操作完成。"
