#!/bin/zsh

# 全局变量声明
typeset -g CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录
typeset -g default_personal_email="295060456@qq.com"
typeset -g default_work_email="olive@vgtech.org"
typeset -g personal_ssh_dir="$HOME/.ssh"
typeset -g personal_ssh_key="$personal_ssh_dir/id_rsa_personal"
typeset -g work_ssh_dir="$HOME/.ssh"
typeset -g work_ssh_key="$work_ssh_dir/id_rsa_work"
typeset -g default_key_type="ed25519" # 默认密钥类型
echo -e "\033[1;31m$(basename "$(realpath "$0")")\033[0m" # 打印当前脚本的文件名
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

    _JobsPrint_Red "按回车键继续..."
    read
}
# 确认输入
confirm_action() {
    local prompt="$1"
    local data="$2"
    local response
    
    echo "$prompt (直接回车同意，输入任意字符不同意): $2"
    
    read -r response
    if [[ -n "$response" ]]; then
        _JobsPrint_Red "操作已取消。"
        exit 1
    fi
}
# 选择密钥类型
choose_key_type() {
    echo "请选择 SSH 密钥类型 (默认: ED25519):"
    echo "1) ED25519"
    echo "2) RSA 4096"
    read -p "请输入选择 (直接回车选择默认): " choice

    case "$choice" in
        1|"" )
            key_type="ed25519"
            ;;
        2 )
            key_type="rsa -b 4096"
            ;;
        * )
            _JobsPrint_Red "无效选择，使用默认的 ED25519。"
            key_type="ed25519"
            ;;
    esac
    _JobsPrint_Green "选择的密钥类型是: $key_type"
}
# 生成 SSH 密钥并添加到 ssh-agent
generate_ssh_key() {
    local email="$1" # 这里接收邮箱
    local key_path="$2" # 这里接收 SSH 密钥路径
    _JobsPrint_Green "为 $email 生成 SSH 密钥"
    confirm_action "确认生成 SSH 密钥?" "(直接回车同意，输入任意字符不同意):"
    # 使用选择的密钥类型
    if [[ "$key_type" == "ed25519" ]]; then
        ssh-keygen -t ed25519 -C "$email" -f "$key_path" -N "" || {
            _JobsPrint_Red "密钥生成失败，请检查错误信息。"
            exit 1
        }
    else
        ssh-keygen -t rsa -b 4096 -C "$email" -f "$key_path" -N "" || {
            _JobsPrint_Red "密钥生成失败，请检查错误信息。"
            exit 1
        }
    fi
    # 输出公钥内容
    public_key=$(cat "$key_path.pub")
    echo "公钥是: $public_key"
    
    eval "$(ssh-agent -s)" || {
        _JobsPrint_Red "SSH agent 启动失败，请检查错误信息。"
        exit 1
    }

    ssh-add --apple-use-keychain "$key_path" || {
        _JobsPrint_Red "添加 SSH 密钥失败，请检查错误信息。"
        exit 1
    }
    
    _JobsPrint_Green "验证密钥是否加载..."
    ssh-add -l || {
        _JobsPrint_Red "加载 SSH 密钥失败。"
        exit 1
    }

    open https://github.com/settings/keys
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
    echo "$email" # 返回用户输入的邮箱，不带格式
}
# 确保配置文件存在并添加配置
setup_ssh_config() {
    local config_file="$personal_ssh_dir/config"
    if [[ ! -f "$config_file" ]]; then
        touch "$config_file"
        _JobsPrint_Green "创建 $config_file 文件"
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
        _JobsPrint_Green "已将 GitHub 配置添加到 $config_file"
    else
        _JobsPrint_Green "GitHub 配置已存在于 $config_file"
    fi
}
# 确保 SSH agent 每次启动时自动运行
setup_ssh_agent() {
    local zshrc_file="$HOME/.zshrc"
    local bash_profile_file="$HOME/.bash_profile"
    local ssh_agent_cmd='eval "$(ssh-agent -s)"'

    for file in "$zshrc_file" "$bash_profile_file"; do
        if [[ -f "$file" ]] && ! grep -q "$ssh_agent_cmd" "$file"; then
            echo "$ssh_agent_cmd" >> "$file"
            _JobsPrint_Green "已将 SSH agent 启动命令添加到 $file"
        fi
    done
}
# 测试与 GitHub 和 GitLab 的 SSH 连接
test_ssh_connection() {
    _JobsPrint_Green "只有在网页上粘贴了账户公钥，下面的测试连接 ssh -T git@github.com 才会正常..."
    read -p "按回车键继续，并测试与 GitHub 的 SSH 连接..."
    ssh -T git@github.com
    _JobsPrint_Green " SSH 设置完成！"
}
# 主函数
main() {
    jobs_logo # 打印 "Jobs" logo
    self_intro # 自述信息
    open /Users/$(whoami)/.ssh
    choose_key_type # 选择密钥类型
    personal_email=$(get_email "个人邮箱" "$default_personal_email") # 获取无格式邮箱
    _JobsPrint_Green "个人邮箱是: $personal_email" # 打印无格式邮箱
    echo "SSH文件地址为: $personal_ssh_key"
    generate_ssh_key "$personal_email" "$personal_ssh_key" # 使用无格式邮箱
    
    setup_ssh_config # 设置 SSH 配置
    setup_ssh_agent # 设置 SSH agent 启动命令

    confirm_action "确认检查?" "(直接回车检查，输入任意字符不检查):"
    test_ssh_connection
    
    open https://github.com/settings/tokens
}
# 执行主函数
main
