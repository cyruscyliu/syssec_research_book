# 做研究 - 第八部分：研究与开发中的陷阱、调整与技巧

少浪费时间 = 获得更多时间！


## 避免重复做同样的事情两次

- 通过保存配置避免构建 Buildroot 两次
- 避免开发脚本两次
- 使用 WSL 时不要使用所有 CPU
- 不要随意删除文件

## 确保服务器一直在运行而不是你

## 代理设置列表

- 为 google、GitHub、Docker、apt 源设置代理
- WSL 的代理设置：1）允许 LAN，2）在 WSL 中访问主机，
https://learn.microsoft.com/en-us/windows/wsl/networking，3）启用系统代理

## 用于远程工作的云存储

- Google Driver/坚果云/GitHub/服务器
- 回家前提交并推送

## 其他陷阱

- 搜狗拼音在 Ubuntu 上不工作
- `ssh -X` 将 X11 转发回你的桌面（qemu `gtk initialization failed`）
- 不要使用 `git submodules`
- 在运行任何 bash/sh 脚本之前运行 [shellchecker](https://github.com/koalaman/shellcheck)
- 服务器重启是由于内存不足
- 服务器无响应是由于死循环
- 不要玩 Python 的内置函数和字段
