#!/bin/zsh

# 全局变量声明
typeset -g CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录
typeset -g default_personal_email="295060456@qq.com"
typeset -g default_work_email="olive@vgtech.org"
typeset -g personal_ssh_dir="$HOME/.ssh"
typeset -g personal_ssh_key="$personal_ssh_dir/id_ed25519"
typeset -g work_ssh_dir="$HOME/.ssh"
typeset -g work_ssh_key="$work_ssh_dir/id_ed25519_work"
# 通用打印方法
_JobsPrint() {
    local COLOR="$1"
    local text="$2"
    local RESET="\033[0m"
    echo -e "${COLOR}${text}${RESET}"
}
# 定义红色加粗输出方法
_JobsPrint_Red() {
    _JobsPrint "\033[1;31m" "$1"
}
# 定义绿色加粗输出方法
_JobsPrint_Green() {
    _JobsPrint "\033[1;32m" "$1"
}
# 打印 "Jobs" logo
jobs_logo() {
    local border="=="
    local width=49  # 根据logo的宽度调整
    local top_bottom_border=$(printf '%0.1s' "${border}"{1..$width})
    local logo="
||${top_bottom_border}||
||  JJJJJJJJ     oooooo    bb          SSSSSSSSSS  ||
||        JJ    oo    oo   bb          SS      SS  ||
||        JJ    oo    oo   bb          SS          ||
||        JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS  ||
||  J     JJ    oo    oo   bb      bb          SS  ||
||  JJ    JJ    oo    oo   bb      bb  SS      SS  ||
||   JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS  ||
||${top_bottom_border}||
"
    _JobsPrint_Green "$logo"
}
# 自述信息
self_intro() {
    _JobsPrint_Green "【MacOS】Setup_ssh_for_Github"
    _JobsPrint_Green "为个人账户生成 SSH 密钥"
    _JobsPrint_Red "按回车键继续..."
    read
}
# 生成 SSH 密钥并添加到 ssh-agent
generate_ssh_key() {
    local email="$1"
    local key_path="$2"
    _JobsPrint_Green "为 $email 生成 SSH 密钥"
    ssh-keygen -t ed25519 -C "$email" -f "$key_path" -N ""
    
    eval "$(ssh-agent -s)"
    ssh-add --apple-use-keychain "$key_path"
    
    open https://github.com/settings/ssh/new
    _JobsPrint_Green "你的 $email 账户的公钥是："
    cat "$key_path.pub"
    _JobsPrint_Green "将公钥内容复制到剪切板..."
    cat "$key_path.pub" | pbcopy
    _JobsPrint_Green "公钥内容已复制到剪切板并打开 GitHub SSH 密钥设置页面，请手动粘贴添加。"
}
# 获取用户输入的 email
get_email() {
    local prompt="$1"
    local default_email="$2"
    local email
    read -p "请输入 $prompt (默认: $default_email): " email
    if [[ -z "$email" ]]; then
        email="$default_email"
    fi
    _JobsPrint_Green "$email"
}
# 测试与 GitHub 和 GitLab 的 SSH 连接
test_ssh_connection() {
    _JobsPrint_Green "只有在网页上粘贴了账户公钥，下面的测试连接才会正常..."
    read "按回车键继续，并测试与 GitHub 的 SSH 连接..."
    ssh -T git@github.com
    _JobsPrint_Green " SSH 设置完成！"
}
# 确保 SSH agent 每次启动时自动运行
setup_ssh_agent() {
    local zshrc_file="$HOME/.zshrc"
    local bash_profile_file="$HOME/.bash_profile"
    local ssh_agent_cmd='eval "$(ssh-agent -s)"'

    if [[ -f "$zshrc_file" ]]; then
        if ! grep -q "$ssh_agent_cmd" "$zshrc_file"; then
            echo "$ssh_agent_cmd" >> "$zshrc_file"
            _JobsPrint_Green "已将 SSH agent 启动命令添加到 ~/.zshrc"
        fi
    fi

    if [[ -f "$bash_profile_file" ]]; then
        if ! grep -q "$ssh_agent_cmd" "$bash_profile_file"; then
            echo "$ssh_agent_cmd" >> "$bash_profile_file"
            _JobsPrint_Green "已将 SSH agent 启动命令添加到 ~/.bash_profile"
        fi
    fi
}
# 确保配置文件存在并添加配置
setup_ssh_config() {
    local config_file="$HOME/.ssh/config"
    if [[ ! -f "$config_file" ]]; then
        touch "$config_file"
        _JobsPrint_Green "创建 ~/.ssh/config 文件"
    fi

    if ! grep -q "Host github.com" "$config_file"; then
        cat <<EOL >> "$config_file"
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  AddKeysToAgent yes
  UseKeychain yes
EOL
        _JobsPrint_Green "已将 GitHub 配置添加到 ~/.ssh/config"
    else
        _JobsPrint_Green "GitHub 配置已存在于 ~/.ssh/config"
    fi
}
# 主函数
main() {
    jobs_logo # 打印 "Jobs" logo
    self_intro # 自述信息
    open /Users/$(whoami)/.ssh
    
    local personal_email=$(get_email "个人邮箱" "$default_personal_email")
    generate_ssh_key "$personal_email" "$personal_ssh_key"
    
    # local work_email=$(get_email "工作邮箱" "$default_work_email")
    # generate_ssh_key "$work_email" "$work_ssh_key"
    
    open https://github.com/settings/tokens
    test_ssh_connection
    
    setup_ssh_agent # 设置 SSH agent 启动命令
    setup_ssh_config # 设置 SSH 配置
}
# 执行主函数
main
