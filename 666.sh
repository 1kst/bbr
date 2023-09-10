#!/bin/bash

echo "==================================="
echo "一键安装脚本合集"
echo "==================================="

# 定义菜单
menu=("1. 安装香港节点"
      "2. 安装日本节点"
      "3. 安装台湾节点"
      "4. 安装韩国节点"
      "5. 安装美国节点"
      "6. 安装英国节点"
      "7. 安装澳洲节点"
      "0. 退出")

# 脚本命令数组
commands=("wget https://raw.githubusercontent.com/1kst/bbr/main/node/hk.sh && bash hk.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/jp.sh && bash jp.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/tw.sh && bash tw.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/kr.sh && bash kr.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/us.sh && bash us.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/uk.sh && bash uk.sh"
          "wget https://raw.githubusercontent.com/1kst/bbr/main/node/au.sh && bash au.sh")

# 显示菜单
while true; do
  echo "请选择一个选项:"
  for item in "${menu[@]}"; do
    echo "$item"
  done
  read -p "输入选项数字: " choice

  # 检查用户输入是否有效
  if [[ "$choice" -ge 0 && "$choice" -lt "${#menu[@]}" ]]; then
    if [ "$choice" -eq 0 ]; then
      echo "退出菜单."
      exit 0
    else
      echo "执行命令: ${commands[$choice-1]}"
      eval "${commands[$choice-1]}"
    fi
  else
    echo "无效的选项，请重新输入."
  fi
done
