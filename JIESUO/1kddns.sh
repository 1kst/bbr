#!/bin/bash

# 定义仓库地址和本地目录
repo_url="https://github.com/1kst/jiaoben.git"
local_dir="/root/jiaoben"

# 定义要执行的命令
command_to_execute="/bin/bash $local_dir/sgjiesuo/sgddns.sh"

# 克隆仓库到本地
git clone "$repo_url" "$local_dir"

# 赋予sgddns.sh执行权限
chmod +x "$local_dir/sgjiesuo/sgddns.sh"

# 添加定时任务
(crontab -l 2>/dev/null ; echo "* * * * * $command_to_execute") | crontab -
