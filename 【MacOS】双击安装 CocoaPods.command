#!/bin/zsh

# 定义全局变量
# Apple Silicon (M1/M2) 的默认 Homebrew 安装路径是 /opt/homebrew，
# Intel 芯片的默认路径是 /usr/local。

# Homebrew for M Series
typeset -g HOMEBREW_PATH_M_SERIES="/opt/homebrew"
# Homebrew for x86
typeset -g HOMEBREW_PATH_X86="/usr/local"
# RVM Ruby Path
typeset -g RVM_RUBY_PATH="$HOME/.rvm/bin"
# Homebrew Ruby Path
typeset -g RUBY_PATH="$HOMEBREW_PATH_M_SERIES/opt/ruby/bin"
# Rbenv Path
typeset -g RBENV_PATH="$HOME/.rbenv/bin"
# Gems Path
typeset -g RUBY_GEMS_PATH="$HOMEBREW_PATH_M_SERIES/lib/ruby/gems/3.3.0/bin"
# Homebrew 环境变量（M系列芯片）
typeset -g HOMEBREW_PATH_1='export PATH="$HOMEBREW_PATH_M_SERIES/bin:$PATH"'
typeset -g HOMEBREW_PATH_2='export PATH="$HOMEBREW_PATH_M_SERIES/sbin:$PATH"'
# Homebrew 环境变量（x86架构芯片）
typeset -g HOMEBREW_PATH_3='export PATH="$HOMEBREW_PATH_X86/bin:$PATH"'
typeset -g HOMEBREW_PATH_4='export PATH="$HOMEBREW_PATH_X86/sbin:$PATH"'
# RVM 环境变量
typeset -g RVM_PATH='export PATH="$RVM_RUBY_PATH:$PATH"'
# Ruby 环境变量
typeset -g RUBY_PATH_ENV='export PATH="$RUBY_PATH:$PATH"'
# Rbenv 环境变量
typeset -g RBENV_PATH_ENV='export PATH="$RBENV_PATH:$PATH"'
typeset -g RBENV_INIT='eval "$(rbenv init -)"'
# Gems 环境变量
typeset -g RUBY_GEMS_ENV='export PATH="$RUBY_GEMS_PATH:$PATH"'
# 定义全局配置文件数组
typeset -g -A config_files=(
    ".bash_profile" ''
    # ".bashrc" ''
    ".zshrc" ''
    # ".zprofile" ''
)
# 获取所有 ruby 的安装路径
ruby_paths=$(which -a ruby)
ruby_now=$(ruby -v)
# 通用打印方法
_JobsPrint() {
    local COLOR="$1"
    local text="$2"
    local RESET="\033[0m"
    echo "${COLOR}${text}${RESET}"
}
# 定义红色加粗输出方法
_JobsPrint_Red() {
    _JobsPrint "\033[1;31m" "$1"
}
# 定义绿色加粗输出方法
_JobsPrint_Green() {
    _JobsPrint "\033[1;32m" "$1"
}
# 定义黄色加粗输出方法
_JobsPrint_Yellow() {
    _JobsPrint "\033[1;33m" "$1"
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
    _JobsPrint_Green "【MacOS】双击安装 CocoaPods"
    _JobsPrint_Red "按回车键继续..."
    read
}
# 分架构执行
_framework_do() {
    local arm_command="$1"
    local x86_command="$2"
    # M2 芯片
    if [ "$(uname -m)" = "arm64" ]; then
        eval "$arm_command" # x64
    else
        if sysctl sysctl.proc_translated 2>/dev/null | grep -q 'sysctl.proc_translated: 1'; then
            eval "$arm_command" # x64 模拟的 x86
        else
            eval "$x86_command" # x86
        fi
    fi
}
#【指定用 xcode 打开】回车确认打开文件，任意字符跳过
open_file_by_xcode_if_enter_base() {
    local file="$1"
    _JobsPrint_Green "按回车键用 Xcode 打开 $file，输入任意字符并回车跳过..."
    read user_input
    if [[ -z "$user_input" ]]; then
        open -a "Xcode" "$file"
    else
        _JobsPrint_Red "跳过打开 $file。"
    fi
}
#【系统默认方式打开】回车确认打开文件，任意字符跳过
open_file_if_enter_base() {
    local file="$1"
    _JobsPrint_Green "按回车键打开 $file，输入任意字符并回车跳过..."
    read user_input
    if [[ -z "$user_input" ]]; then
        open "$file"
    else
        _JobsPrint_Red "跳过打开 $file。"
    fi
}
# 打开系统配置文件
open_files_if_enter() {
    _JobsPrint_Green "按回车键打开所有配置文件，输入任意字符并回车跳过..."
    open_file_by_xcode_if_enter_base "$HOME/.bash_profile"
    open_file_if_enter_base "$HOME/.bashrc"
    open_file_if_enter_base "$HOME/.zshrc"
}
# 检查并添加行到指定的配置文件
add_line_if_not_exists() {
    local file=$1
    local line=$2
    local filepath="$HOME/$file"
    # 检查文件是否存在，如果不存在或为空，则不添加空行
    if [ ! -s "$filepath" ]; then
        echo "$line" >> "$filepath"
        _JobsPrint_Green "添加到$file：$line"
    elif ! grep -qF "$line" "$filepath"; then
        # 文件不为空，并且行不存在，先添加空行然后添加目标行
        echo '' >> "$filepath"
        echo "$line" >> "$filepath"
        _JobsPrint_Green "添加到$file：$line"
    else
        _JobsPrint_Red "$file中已存在 $line"
    fi
}
# 检查行并注释字符串到指定的配置文件
comment_line_if_exists() {
    local file=$1
    local line=$2
    local filepath="$HOME/$file"

    if [ ! -s "$filepath" ]; then
        _JobsPrint_Red "$file 不存在或为空"
        return
    fi
    # 检查文件中是否存在包含指定字符串的行，且该行未被注释
    if grep -qF "$line" "$filepath"; then
        if grep -qF "^$line" "$filepath"; then
            # 使用sed注释掉包含指定字符串的行
            sed -i '' "s|^$line|#&|" "$filepath"
            _JobsPrint_Green "已注释掉$file中的行：$line"
        else
            _JobsPrint_Red "$file中包含的行已经被注释：$line"
        fi
    else
        _JobsPrint_Red "$file中不存在包含的行：$line"
    fi
}
# 更新 Oh.My.Zsh
update_OhMyZsh() {
    _JobsPrint_Green "检查是否有新版本..."
    cd ~/.oh-my-zsh || exit
    git fetch origin master
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if git rev-list --count HEAD..origin/master | grep -q '^0$' > /dev/null; then
        _JobsPrint_Green "已经是最新版本，无需更新。"
    else
        _JobsPrint_Green "发现新版本，正在升级 Oh.My.Zsh..."
        git pull origin master
    fi
}
# 检查并安装 Oh.My.Zsh
check_OhMyZsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        _JobsPrint_Green "当前系统中未安装 Oh.My.Zsh，正在进行安装..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # 执行到这里，会结束
        check_OhMyZsh
    else
        _JobsPrint_Green "当前系统中已安装 Oh.My.Zsh，进行检查更新升级。"
        update_OhMyZsh
    fi
}
# 本机环境自检
check_env(){
    # 检查是否在 Rosetta 2 环境中运行
    if sysctl sysctl.proc_translated 2>/dev/null | grep -q 'sysctl.proc_translated: 1'; then
        _JobsPrint_Green "通过 Rosetta 2 运行一个 x86_64 模拟环境"
    else
        _JobsPrint_Green "在本机真实架构上运行环境"
    fi

    _JobsPrint_Green \
    "#不同的芯片拥有不同的指令集，会影响编译效果\n\
    shellenv#Intel 芯片架构：x86_64\n\
    #Apple M1 芯片架构：x86_64\n\
    #Apple M2 芯片架构：arm64"
    
    _JobsPrint_Green "当在 Apple M1 芯片上运行 uname -m 并获得 x86_64 时，这表明你在通过 Rosetta 2 运行一个 x86_64 模拟环境。\n"
    _framework_do "_JobsPrint_Green 当前CPU芯片架构为：ARM64" "_JobsPrint_Green 当前CPU芯片架构为：X86"
}
# 准备前置环境
prepare_environment() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    check_env # 本机环境自检
    _JobsPrint_Green "\n先做一些准备工作..."
    # 显示Mac OS X上的隐藏文件和文件夹
    defaults write com.apple.Finder AppleShowAllFiles YES
    # 允许从任何来源打开应用（需要管理员权限）
    sudo spctl --master-disable
    # 检查并安装 Oh.My.Zsh
    check_OhMyZsh
    # 在 Apple Silicon 上安装和运行某些工具时，可能需要使用 Rosetta 2 来确保兼容性
    # 安装 Rosetta 2:
    _x64_softwareupdate(){
        softwareupdate --install-rosetta --agree-to-license
    }
    _x86_softwareupdate(){}
    _framework_do "_x64_softwareupdate" "_x86_softwareupdate"
    # 增加 Git 的缓冲区大小：可以尝试增加 Git 的 HTTP 缓冲区大小，以防止在传输大对象时出现问题
    git config --global http.postBuffer 524288000  # 设置缓冲区为500MB
    git config --global http.maxRequestBuffer 1048576000  # 设置缓冲区为1GB
    
    open_file_by_xcode_if_enter_base "$HOME/.bash_profile" # 打开系统配置文件
}
# 检查 Xcode 和 Xcode Command Line Tools
check_xcode_and_tools() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v xcodebuild &> /dev/null; then
        _JobsPrint_Red "Xcode 未安装，请安装后再运行此脚本。"
        open -a "App Store" "macappstore://apps.apple.com/app/xcode/id497799835"
        exit 1
    fi
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! xcode-select -p &> /dev/null; then
        _JobsPrint_Red "Xcode Command Line Tools 未安装，请安装后再运行此脚本。"
        xcode-select --install # 安装 Xcode Command Line Tools
        _JobsPrint_Green "请按照提示进行安装，安装完成后再次运行此脚本。"
        exit 1
    fi
    _JobsPrint_Green "🍺🍺🍺 Xcode 和 Xcode Command Line Tools 均已安装。"
}
# 非用Homebrew管理的方式安装fzf
install_fzf() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    if [ -d "$HOME/.fzf" ]; then
        echo "fzf 已经安装，正在升级..."
        cd ~/.fzf && git pull && ./install --all
    else
        echo "fzf 未安装，正在安装..."
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
    fi
}
# 通过 Homebrew 检查并安装/更新 libyaml
check_and_update_libyaml() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 命令检查 libyaml 是否已安装。输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if brew list libyaml &> /dev/null; then
        _JobsPrint_Green "libyaml 已经安装"
    else
        _JobsPrint_Green "libyaml 还没有安装。现在安装..."
        check_homebrew # 检查安装 Homebrew
        _framework_do "arch -arm64 brew install libyaml" "brew install libyaml" # 尝试安装 libyaml
        if [ $? -eq 0 ]; then
            _JobsPrint_Green "libyaml 已经被成功安装"
        else
            _JobsPrint_Red "libyaml 安装失败"
        fi
    fi
    pkg-config --cflags --libs yaml-0.1
}
# 检查并安装/更新 fzf
check_and_update_fzf() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 检查 fzf 命令是否存在。输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v fzf &> /dev/null; then
        _JobsPrint_Red "fzf没有安装，正在安装到最新版本"
        _JobsPrint_Green "选择安装方式："
        _JobsPrint_Green "1) 通过 Homebrew 安装"
        _JobsPrint_Green "2) 通过 Git 克隆安装"
        
        # 提示输入选项
        echo -n "请输入选项 (1 或 2): "
        read choice

        case $choice in
            1)
                check_homebrew # 检查安装 Homebrew
                _framework_do "arch -arm64 brew install fzf" "brew install fzf"
                ;;
            2)
                install_fzf
                ;;
            *)
                _JobsPrint_Red "无效输入，操作取消"
                ;;
        esac
    else
        _JobsPrint_Green "fzf 已被安装，正在检查更新..."
        # 检查 fzf 是否通过 brew 安装。输出被重定向到 /dev/null，因此不会在终端显示任何内容
        if brew list fzf &> /dev/null; then
            _JobsPrint_Green "fzf 是通过 Homebrew 安装的。"
            # 检查是否有更新
            outdated_packages=$(brew outdated fzf)
            if [ -n "$outdated_packages" ]; then
                _JobsPrint_Green "升级 fzf..."
                brew upgrade fzf
            else
                _JobsPrint_Green "fzf 已经是最新版本"
            fi
        fi
        # 检查 fzf 是否通过 install_fzf 的方式进行安装的
        if [ -d "$HOME/.fzf" ] && [ -x "$HOME/.fzf/bin/fzf" ]; then
            cd "$HOME/.fzf" # 进入 fzf 安装目录
            git pull # 拉取最新的代码
            ./install # 重新运行安装脚本
        fi
    fi
}
# 文件夹授权
update_permissions_for_dir() {
    local dir=$1
    if [ -d "$dir" ]; then
        _JobsPrint_Green "目录存在：$dir，正在更新权限和所有权..."
        sudo chmod -R 777 "$dir"
        sudo chown -R $(whoami) "$dir"
    else
        _JobsPrint_Yellow "目录不存在：$dir，跳过权限和所有权更新。"
    fi
}
# 更新每个目录的权限和所有权
folder_authorization(){
    update_permissions_for_dir "/usr/local/etc"
    update_permissions_for_dir "/usr/local"
    update_permissions_for_dir "/usr/local/Cellar"
    update_permissions_for_dir "$(brew --prefix)/*"
}
# 删除 Homebrew 的残留目录
homebrew_residual_directory_deletion() {
    # 检查 SIP 状态
    local sip_status=$(csrutil status)
    _JobsPrint_Green "正在删除残留的目录..."
    # 如果 SIP 启用，则输出警告信息
    if [[ "$sip_status" == *"enabled"* ]]; then
        _JobsPrint_Red "SIP（系统完整性保护）可能会导致某些目录删除失败"
        _JobsPrint_Red "运行 csrutil disable 并重启 Mac，关闭 SIP（系统完整性保护）"
    fi
    # 删除残留目录
    sudo rm -rf /usr/local/Caskroom
    sudo rm -rf /usr/local/Cellar
    sudo rm -rf /usr/local/Homebrew/
    sudo rm -rf /usr/local/bin/
    sudo rm -rf /usr/local/etc/
    sudo rm -rf /usr/local/lib/
    sudo rm -rf /usr/local/microsoft/
    sudo rm -rf /usr/local/share/
    sudo rm -rf /usr/local/texlive/
    sudo rm -rf /usr/local/var/
    sudo rm -rf /opt/homebrew
}
# 卸载 Homebrew
uninstall_homebrew() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "检测 Homebrew 安装方式..."
    # 检查 Homebrew 是否安装
    if ! command -v brew >/dev/null 2>&1; then
        _JobsPrint_Red "Homebrew 未安装。"
        return
    fi
    # 检查 Homebrew 安装路径
    brew_path=$(brew --prefix)
    if [[ "$brew_path" == "/usr/local/Homebrew" ]]; then
        _JobsPrint_Green "检测到 Homebrew 是通过官方脚本安装的..."
        _JobsPrint_Green "正在卸载 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    elif [[ "$brew_path" == "/home/linuxbrew/.linuxbrew" || "$brew_path" == "/opt/homebrew" ]]; then
        _JobsPrint_Green "检测到 Homebrew 是通过自定义脚本安装的..."
        _JobsPrint_Green "正在卸载 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/uninstall.sh)"
    else
        _JobsPrint_Red "无法确定 Homebrew 的安装方式。"
        return
    fi
    # 询问用户是否删除残留目录
    read -p "是否要删除 Homebrew 的残留目录？(y/n): " user_input
    if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
        folder_authorization # 更新每个目录的权限和所有权
        homebrew_residual_directory_deletion # 删除 Homebrew 的残留目录
        _JobsPrint_Green "残留目录删除完成。"
    else
        _JobsPrint_Red "跳过 Homebrew 残留目录的删除。"
    fi
    check_homebrew # 检查安装 Homebrew
}
# 用fzf的方式安装 Homebrew。
install_homebrew_byFzf() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    local choice
    choice=$(printf "1. 自定义脚本安装 Homebrew （可能不受官方支持）\n2. 官方脚本安装 Homebrew（推荐）" | fzf --prompt "请选择安装方式：")
    case $choice in
    "1. 自定义脚本安装（可能不受官方支持）")
        _JobsPrint_Green "正在使用自定义脚本安装 Homebrew..."
        open https://gitee.com/ineo6/homebrew-install/
        install_Homebrew_gitee
        ;;
    "2. 官方脚本安装（推荐）")
        _JobsPrint_Green "正在使用官方脚本安装 Homebrew..."
        open https://brew.sh/
        install_Homebrew_githubusercontent
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新选择。"
        install_homebrew_byFzf
        ;;
    esac
}
# 只是通过官方推荐方式安装 Homebrew（没有配置相关的环境变量）
install_Homebrew_githubusercontent(){
    _x86_homebrew_install(){
        _JobsPrint_Green "检测到 Intel 芯片, 正在安装 Homebrew 的 x86_64 版本"
        arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }
    
    _x64_homebrew_install(){
        _JobsPrint_Green "检测到 Apple 芯片，正在安装 Homebrew 的 ARM64 版本"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" /opt/homebrew
    }
    _framework_do "_x64_homebrew_install" "_x86_homebrew_install"
}
# 只是通过第三方脚本方式安装 Homebrew（没有配置相关的环境变量）
install_Homebrew_gitee(){
    _x86_homebrew_install(){
        _JobsPrint_Green "检测到 Intel 芯片, 正在安装 Homebrew 的 x86_64 版本"
#        arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        arch -x86_64 /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
    }
    
    _x64_homebrew_install(){
        _JobsPrint_Green "检测到 Apple 芯片，正在安装 Homebrew 的 ARM64 版本"
#        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" /opt/homebrew
        /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)" /opt/homebrew
    }
    _framework_do "_x64_homebrew_install" "_x86_homebrew_install"
}
# 配置 Home.Ruby 环境变量
_config_brew_ruby(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # M系列芯片的环境设置
    _home_ruby_env_x64(){
        for config_file in "${config_files[@]}"; do
            add_line_if_not_exists "$config_file" "$HOMEBREW_PATH_1" # 添加 HOMEBREW_PATH_1
            add_line_if_not_exists "$config_file" "$HOMEBREW_PATH_2" # 添加 HOMEBREW_PATH_2
            add_line_if_not_exists "$config_file" "eval \"\$(/opt/homebrew/bin/brew shellenv)\"" # 添加 brew shellenv
        done
    }
    # x86架构芯片的环境设置
    _home_ruby_env_x86(){
        for config_file in "${config_files[@]}"; do
            add_line_if_not_exists "$config_file" "$HOMEBREW_PATH_3" # 添加 HOMEBREW_PATH_3
            add_line_if_not_exists "$config_file" "$HOMEBREW_PATH_4" # 添加 HOMEBREW_PATH_4
            add_line_if_not_exists "$config_file" "eval \"\$(/usr/local/bin/brew shellenv)\"" # 添加 brew shellenv
        done
    }
    _framework_do "_home_ruby_env_x64" "_home_ruby_env_x86"
    # 重新加载配置文件
    for config_file in "${config_files[@]}"; do
        source ~/"$config_file"
    done
}
# 配置 Rbenv.Ruby 环境变量
_rbenRuby(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 使用全局变量更新 RBenv：$RBENV_PATH
    for config_file in "${config_files[@]}"; do
        add_line_if_not_exists "$config_file" "$RBENV_PATH" # 添加 RBENV_PATH
        add_line_if_not_exists "$config_file" "$RBENV_INIT" # 添加 RBENV_INIT
    done
    # 重新加载配置文件
    for config_file in "${config_files[@]}"; do
        source ~/"$config_file"
    done
}
# 配置 Ruby.Gems 环境变量
_rubyGems(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 使用全局变量更新 Gems
    for config_file in "${config_files[@]}"; do
        add_line_if_not_exists "$config_file" "$RUBY_GEMS_PATH" # 添加 RUBY_GEMS_PATH
    done
    # 重新加载配置文件
    for config_file in "${config_files[@]}"; do
        source ~/"$config_file"
    done
}
# 键盘输入的方式安装 Homebrew if ! command -v brew &> /dev/null; then
install_homebrew_normal() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    
    # 检查并安装 Homebrew
    _JobsPrint_Green "Apple Silicon (M1/M2) 的默认 Homebrew 安装路径是 /opt/homebrew"
    _JobsPrint_Green "Intel 芯片的默认安装路径是 /usr/local。"
    
    _JobsPrint_Green "请选择 Homebrew 安装方式："
    _JobsPrint_Green "1. 自定义脚本安装 Homebrew（可能不受官方支持）"
    _JobsPrint_Green "2. 官方脚本安装 Homebrew（推荐）"
    _JobsPrint_Green "请输入选项（1或2，按回车默认选择2）: "
    read choice

    # 如果没有输入任何内容，则默认设置为2
    if [ -z "$choice" ]; then
        choice=2
    fi

    case $choice in
    1)
        _JobsPrint_Green "正在使用自定义脚本安装 Homebrew..."
        open https://gitee.com/ineo6/homebrew-install/
        install_Homebrew_gitee
        _config_brew_ruby # 写环境变量
        _JobsPrint_Green "自定义脚本安装 Homebrew 完毕。验证安装..."
        check_homebrew # 检查安装 Homebrew
        ;;
    2)
        _JobsPrint_Green "正在使用官方脚本安装 Homebrew..."
        open https://brew.sh/
        install_Homebrew_githubusercontent
        _config_brew_ruby # 写环境变量
        _JobsPrint_Green "官方脚本安装 Homebrew 完毕。验证安装..."
        check_homebrew # 检查安装 Homebrew
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新选择。"
        install_homebrew_normal # 检查并安装 Homebrew
        ;;
    esac
    # 恢复已安装的 Homebrew 包：
    _framework_do "arch -arm64 xargs brew install < ~/brew-packages.txt" "xargs brew install < ~/brew-packages.txt"
}
# 安装/更新 Homebrew 必要的依赖项
install_and_update_homebrew_dependencies() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    dependencies=("ruby-build" "openssl@3" "readline" "zlib")
    missing_dependencies=()
    installed_dependencies=()
    # 检查每个依赖项是否已安装
    for dep in "${dependencies[@]}"; do
        if brew list --formula | grep -q "^$dep\$"; then
            installed_dependencies+=("$dep")
        else
            missing_dependencies+=("$dep")
        fi
    done
    _install_missing_dependencies() {
        if [ ${#missing_dependencies[@]} -gt 0 ]; then
            _JobsPrint_Green "以下依赖项未安装，将进行安装: ${missing_dependencies[*]}"
            brew install "${missing_dependencies[@]}"
        fi
    }
    _reinstall_installed_dependencies() {
        if [ ${#installed_dependencies[@]} -gt 0 ]; then
            _JobsPrint_Green "以下依赖项已安装，将进行重新安装: ${installed_dependencies[*]}"
            brew reinstall "${installed_dependencies[@]}"
        fi
    }
    _homebrew_update_arm64() {
        arch -arm64 brew update # 更新 Homebrew 自身及其公式的本地数据库
        arch -arm64 brew upgrade # 升级已安装的软件包到最新版本
        # 安装缺失的依赖项
        _install_missing_dependencies
        # 重新安装已安装的依赖项
        _reinstall_installed_dependencies
    }
    _homebrew_update_x86() {
        brew update # 更新 Homebrew 自身及其公式的本地数据库
        brew upgrade # 升级已安装的软件包到最新版本
        # 安装缺失的依赖项
        _install_missing_dependencies
        # 重新安装已安装的依赖项
        _reinstall_installed_dependencies
    }
    # 根据架构选择相应的更新函数
    _framework_do "_homebrew_update_arm64" "_homebrew_update_x86"
}
# 检查安装 Homebrew
check_homebrew() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    install_and_update_homebrew_dependencies # 安装/更新 Homebrew 必要的依赖项
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v brew &> /dev/null; then
        _JobsPrint_Red "brew 未安装，开始安装..."
        install_homebrew_normal # 检查并安装 Homebrew
    else
        _JobsPrint_Green "Homebrew 已经安装，跳过安装步骤。"
        _JobsPrint_Green "检查更新 Homebrew..."
        _framework_do "_homebrew_update_arm64" "_homebrew_update_x86"
        _JobsPrint_Green "升级 Homebrew 和由 Homebrew 管理的程序包..."
        _JobsPrint_Green "正在执行 Homebrew 清理工作..."
        folder_authorization # 更新每个目录的权限和所有权
        brew cleanup
        _JobsPrint_Green "🍺🍺🍺完成更新和清理 Homebrew"
        brew doctor
        brew -v
    fi
}
# 检查并安装 zsh
check_and_install_zsh() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if command -v zsh >/dev/null 2>&1; then
        _JobsPrint_Green "zsh 已经安装，不需要执行任何操作。"
    else
        _JobsPrint_Red "zsh 未安装，正在通过 Homebrew 安装 zsh..."
        check_homebrew # 检查安装 Homebrew
        _framework_do "arch -arm64 brew install zsh" "brew install zsh"
    fi
}
# 卸载安装 RVM
# 安装/升级 ruby-build 插件
install_ruby_build() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    local ruby_build_dir="$(\n root)/plugins/ruby-build"
    # 检查 ruby-build 是否已安装
    if ! command -v ruby-build &> /dev/null; then
        _JobsPrint_Green "选择安装 ruby-build 插件的方式："
        local options=("通过 Homebrew 安装" "通过 Git 克隆安装")
        local choice=$(printf "%s\n" "${options[@]}" | fzf --prompt="选择安装方式: " --height=10 --border --reverse)
        
        if [ "$choice" == "通过 Homebrew 安装" ]; then
            _JobsPrint_Green "正在通过 Homebrew 安装 ruby-build 插件..."
            if brew install ruby-build; then
                _JobsPrint_Green "ruby-build 插件已通过 Homebrew 安装成功。"
                return 0
            else
                _JobsPrint_Red "Homebrew 安装 ruby-build 插件失败。"
                return 1
            fi
        elif [ "$choice" == "通过 Git 克隆安装" ]; then
            _JobsPrint_Green "正在通过 Git 克隆安装 ruby-build 插件..."
            if git clone https://github.com/rbenv/ruby-build.git "$ruby_build_dir"; then
                _JobsPrint_Green "ruby-build 插件已通过 Git 克隆安装成功。"
                return 0
            else
                _JobsPrint_Red "Git 克隆安装 ruby-build 插件失败。"
                return 1
            fi
        else
            _JobsPrint_Red "无效选择，安装取消。"
            return 1
        fi
    else
        _JobsPrint_Green "ruby-build 插件已安装。"
    fi
    # 检查是否需要升级
    if command -v ruby-build &> /dev/null; then
        if [ -d "$ruby_build_dir" ]; then
            _JobsPrint_Green "检测到已安装 ruby-build 插件，正在检查是否需要升级..."
            if cd "$ruby_build_dir" && git pull; then
                _JobsPrint_Green "ruby-build 插件已更新到最新版本。"
                return 0
            else
                _JobsPrint_Red "更新 ruby-build 插件失败。"
                return 1
            fi
        elif brew list ruby-build &> /dev/null; then
            _JobsPrint_Green "检测到 ruby-build 是通过 Homebrew 安装的，正在检查是否需要升级..."
            if brew upgrade ruby-build; then
                _JobsPrint_Green "ruby-build 插件已通过 Homebrew 更新到最新版本。"
                return 0
            else
                _JobsPrint_Red "Homebrew 更新 ruby-build 插件失败。"
                return 1
            fi
        else
            _JobsPrint_Red "未知的 ruby-build 安装方式。"
            return 1
        fi
    else
        _JobsPrint_Red "ruby-build 插件未安装。"
        return 1
    fi
}
# 检查并安装 git.Rbenv.Ruby
check_Rbenv() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if command -v rbenv &> /dev/null; then
        _JobsPrint_Green "检测到已安装 Rbenv，准备升级到最新版本..."
        _JobsPrint_Green "正在升级 Rbenv..."
        cd ~/.rbenv && git pull
    else
        _JobsPrint_Green "正在安装 Rbenv..."
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        _rbenRuby # 配置 Rbenv.Ruby 环境变量
    fi
    install_ruby_build # 安装/升级 ruby-build 插件
}
# 利用 Homebrew 安装 Ruby 环境
install_ruby_byBrew(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "利用 Homebrew 安装 Ruby环境（RVM）..."
    _framework_do "arch -arm64 brew install ruby" "brew install ruby"
    brew cleanup ruby
}
# 检测当前通过 Rbenv 安装的 Ruby 环境
check_rbenv_version(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green '列出当前系统上安装的所有 Ruby 版本'
    rbenv versions
    _JobsPrint_Green '显示当前全局生效的 Ruby 版本'
    rbenv version
}
# 通过 Rbenv 的形式，安装 ruby 环境
install_ruby_byRbenv(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "打印可用的 Ruby 版本列表："
    # 用于列出所有可用的 Ruby 版本，同时过滤掉所有空白行
    rbenv install --list | grep -v -e "^[[:space:]]*$"
    read "version?请输入要安装的 Ruby 版本号，或者按回车键安装当前最新版本（未输入版本号，则安装当前最新版本）: "
    if [ -z "$version" ]; then
        _JobsPrint_Green "正在安装最新版本的 Ruby..."
        # 用于找到并存储可用的最新稳定版本的 Ruby，忽略任何预发布版本或带有特殊标记的版本
        latest_version=$(
            rbenv install --list | \
            grep -v -e "^[[:space:]]*$" | \
            grep -v -e "-" | \
            tail -1
        )
        rbenv install $latest_version
        rbenv local $latest_version
    else
        if rbenv install --list | grep -q "$version"; then
            _JobsPrint_Green "正在安装 Ruby $version..."
            rbenv install $version
            rbenv local $version
        else
            _JobsPrint_Red "版本号 $version 不存在，请重新输入。"
            exit 1
        fi
    fi
    _rbenRuby # 配置 Rbenv.Ruby 环境变量
    rbenv_other_config # 其他的一些 Rbenv 设置
    check_rbenv_version # 检测当前通过 Rbenv 安装的 Ruby 环境
}
# 一键安装 Ruby 版本管理器 RVM（Ruby Version Manager）和最新稳定版的 Ruby
install_ruby_byRVM(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    open https://get.rvm.io
    # 下载安装
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    # 检查指定的文件或目录是否存在
    if [[ -e "$HOME/.rvm/scripts/rvm" ]]; then
        _JobsPrint_Green "正在使用 rvm get stable --auto-dotfiles 修复 PATH 设置..."
        rvm get stable --auto-dotfiles
    fi
    # 检查当前的 PATH 环境变量中是否已经包含了 $HOME/.rvm/bin
    if [[ ":$PATH:" != *":$HOME/.rvm/bin:"* ]]; then
        # 写 RVM.Ruby 的环境变量
        add_line_if_not_exists ".bash_profile" "$RVM_RUBY_PATH" # 检查并添加行到 ./bash_profile
        _JobsPrint_Green "修复 RVM.Ruby 路径设置。"
    fi
}
# 如果当前 Ruby 环境是通过 HomeBrew 安装的，那么升级 HomeBrew.Ruby 到最新版，并清除下载
check_ruby_install_ByHomeBrew(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    if brew list --formula | grep -q ruby; then
        _JobsPrint_Green "当前 Ruby 环境是通过 HomeBrew 安装的"
        _JobsPrint_Green "升级 HomeBrew.Ruby 到最新版..."
        brew upgrade ruby
        add_line_if_not_exists ".bash_profile" "$RUBY_PATH" # 检查并添加行到 ./bash_profile
#        add_line_if_not_exists ".bashrc" "$RUBY_PATH" # 检查并添加行到 ./bashrc
#        add_line_if_not_exists ".zshrc" "$RUBY_PATH" # 检查并添加行到 ./zshrc
        brew cleanup ruby
    fi
}
# 检查当前 Ruby 环境是否是通过 Rbenv 安装的
check_rbenv_installed_ruby() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    local version
    local rbenv_version
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    version=$(ruby -v 2>/dev/null | awk '{print $2}' || true)
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    rbenv_version=$(rbenv version 2>/dev/null | awk '{print $1}' || true)

    if [ -n "$version" ] && [ -n "$rbenv_version" ]; then
        if [ "$version" = "$rbenv_version" ]; then
            _JobsPrint_Green "当前 Ruby 环境是通过 Rbenv 安装的"
            upgrade_current_rbenv_ruby # 升级当前 Rbenv.Ruby 环境
        else
            _JobsPrint_Red "当前 Ruby 环境不是通过 Rbenv 安装的"
        fi
    else
        _JobsPrint_Red "无法获取 Ruby 版本信息"
    fi
}
# 检测当前 Ruby 环境是否是 MacOS 自带的
check_ruby_install_ByMacOS(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()" "${FUNC_NAME}"
    if echo "$ruby_now" | grep -q "/usr/bin/ruby"; then
        _JobsPrint_Red "当前Ruby环境为MacOS自带的Ruby环境（阉割版）"
    fi
}
# 检测当前通过 HomeBrew 安装的 Ruby 环境
check_homebrew_version(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    brew info ruby
}
# 检测当前 Ruby 环境是否通过 RVM 官方推荐的方式安装的
check_ruby_install_ByRVM(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 在 Unix/Linux 系统中，命令的返回码（exit status）遵循这样的惯例：
    # 0 表示成功（true）
    #  0 表示失败（false）
    if [[ -e "$HOME/.rvm/scripts/rvm" ]]; then
        _JobsPrint_Green "当前 Ruby 环境是通过RVM官方推荐的方式安装的"
        return 0
    else
        return 1
    fi
}
# 检查并删除非系统 Ruby 环境
check_and_remove_non_system_ruby() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    if ! echo "$ruby_paths" | grep -q "/usr/bin/ruby"; then
        read "confirm_delete?是否删除这些非系统 Ruby 环境？(按 Enter 键继续，输入任意字符删除并重新安装): "
        if [[ -n "$confirm_delete" ]]; then
            _JobsPrint_Red "正在删除非系统 Ruby 环境..."
            uninstall_Ruby # 卸载所有已安装的 Ruby 环境
        fi
    fi
}
# 检查当前的Ruby环境
check_ruby_environment() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "查看本机的 Ruby 环境安装目录："
    ruby_paths
    _JobsPrint_Green "当前使用的 Ruby 版本："
    ruby -v

    check_ruby_install_ByMacOS # 检测当前 Ruby 环境是否是 MacOS 自带的
    check_rbenv_version # 检测当前 Ruby 环境是否通过 Rbenv 安装的
    check_homebrew_version # 检测当前 Ruby 环境是否通过 HomeBrew 安装的
    check_ruby_install_ByRVM # 检测当前 Ruby 环境是否通过 RVM 官方推荐的方式安装的
    
    _JobsPrint_Green "打印已安装的 Ruby 版本："
    rvm list

    _JobsPrint_Green "清理 RVM 环境..."
    rvm cleanup all
    _JobsPrint_Green "RVM 环境清理完成。"
}
# 其他的一些 Rbenv 设置
rbenv_other_config(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 解决pod 命令只在特定的 Ruby 版本下可用
    # 设置 Ruby 版本为当前正在使用的版本
    rbenv global $(rbenv version-name)
    # 设置编译选项并安装 Ruby
    RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl) \
                 --with-readline-dir=$(brew --prefix readline) \
                 --with-zlib-dir=$(brew --prefix zlib)" \
    rbenv install $(rbenv version-name)
    # 在安装或卸载 Ruby 版本、安装新的 gem（具有可执行文件）后重新生成 shims
    # shims 是 rbenv 用来拦截 Ruby 命令（如 ruby, irb, gem, rails 等）并将它们重定向到正确安装的 Ruby 版本的一种机制
    # 当你在使用 rbenv 管理多个 Ruby 版本时，rbenv 不会改变全局的 PATH 环境变量中的 Ruby 命令路径。
    # 相反，它在 PATH 中添加一个指向 ~/.rbenv/shims 目录的路径，这个目录包含了伪装（shim）过的 Ruby 命令。
    # 每次运行例如 ruby 或 gem 这样的命令时，实际上运行的是一个位于 shims 目录的代理脚本。这个脚本负责调用 rbenv 来确定应该使用哪个 Ruby 版本，然后重定向到这个版本的对应命令。
    rbenv rehash # rbenv rehash 是维护 rbenv 环境正确性的重要步骤，确保所有安装的 Ruby 版本和 Ruby 工具都可以被正确调用。
}
# 安装 Ruby 环境（3种方式安装：Homebrew/Rbenv/RVM官方）
setup_ruby_environment(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    check_and_update_fzf
    # 在配置文件中同时配置 rbenv 和 rvm 的路径确实会产生冲突。
    # rbenv 和 rvm 都是用于管理 Ruby 版本的工具，但它们的工作方式不同，并且在系统路径和环境变量的配置上会互相干扰。
    choice=$(printf "1. 使用 Homebrew 安装 Ruby 环境\n2. 使用 Rbenv 安装 Ruby 环境\n3. 使用 RVM 官方推荐的方式进行安装 Ruby 环境" | fzf --prompt "请选择 Ruby 的安装方式：")
    case $choice in
    "1. 使用 Homebrew 安装 Ruby 环境")
        install_ruby_byBrew # 利用 Homebrew 安装 Ruby 环境
        _JobsPrint_Green "🍺🍺🍺 Homebrew.Ruby安装成功"
        check_ruby_install_ByHomeBrew # 如果当前 Ruby 环境是通过 HomeBrew 安装的，那么升级 HomeBrew.Ruby 到最新版，并清除下载
        ;;
    "2. 使用 Rbenv 安装 Ruby 环境")
        check_Rbenv # 检查并安装 git.Rbenv.Ruby
        install_ruby_byRbenv # 通过 Rbenv 的形式，安装 ruby 环境
        _JobsPrint_Green "🍺🍺🍺 Rbenv.Ruby安装成功"
        check_rbenv_version # 检测当前通过 Rbenv 安装的 Ruby 环境
        ;;
    "3. 使用 RVM 官方推荐的方式进行安装 Ruby 环境")
        # 一键安装 Ruby 版本管理器 RVM（Ruby Version Manager）和最新稳定版的 Ruby
        install_ruby_byRVM
        _JobsPrint_Green "🍺🍺🍺 RVM.Ruby安装成功"
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新输入。"
        setup_ruby_environment # 安装 Ruby 环境（3种方式安装：Homebrew/Rbenv/RVM官方）
        ;;
    esac
}
# 删除指定版本的 Ruby 环境
remove_ruby_environment() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    local version=$1
    _JobsPrint_Red "开始删除 Ruby 环境：$version"
    # 如果当前 Ruby 环境是通过 HomeBrew 安装的，那么升级 HomeBrew.Ruby 到最新版，并清除下载
    if check_ruby_install_ByHomeBrew; then
        # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
        brew uninstall --force ruby 2>/dev/null || true
        sudo sed -i '' '/rvm/d' ~/.bash_profile ~/.bashrc ~/.zshrc 2>/dev/null || true
    fi
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v rbenv &> /dev/null; then
        sudo rbenv uninstall -f $version 2>/dev/null || true
    fi

    if check_ruby_install_ByRVM; then
        _JobsPrint_Red "Uninstalling RVM..."
        # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
        rvm implode 2>/dev/null || true
        _JobsPrint_Red "Removing any remaining RVM-related directories..."
        # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
        rm -rf ~/.rvm 2>/dev/null || true
        _JobsPrint_Green "Uninstallation complete."
    fi

    _JobsPrint_Green "Ruby 环境 $version 删除完成"
}
# 遍历所有版本的 Ruby 环境，并进行卸载删除
remove_all_ruby_environments() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Red "开始删除所有已安装的 Ruby 环境"
    for version in $(rbenv versions --bare); do
        remove_ruby_environment $version # 删除指定版本的 Ruby 环境
    done
    _JobsPrint_Green "所有 Ruby 环境已删除"
}
# 卸载所有已安装的 Ruby 环境
uninstall_Ruby(){
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    read "choice?是否卸载删除所有已安装的 Ruby 环境？(y/n): "
    case $choice in
        [Yy]* )
            remove_all_ruby_environments
            ;;
        [Nn]* )
            _JobsPrint_Red "取消卸载删除 Ruby 环境"
            ;;
        * )
            _JobsPrint_Red "无效的选项，取消卸载删除 Ruby 环境"
            ;;
    esac
}
# 升级当前 Rbenv.Ruby 环境
upgrade_current_rbenv_ruby() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "开始升级当前 Ruby 环境"
    rbenv install --list \
  | grep -v -e "^[[:space:]]*$" \
  | grep -v -e "-" \
  | tail -1 \
  | xargs rbenv install -s
    _JobsPrint_Green "升级完成"
}
# 检查并安装 Gem
check_and_setup_gem() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 升级 Gem 以及 Gem 管理的相关软件包
    update_gem_and_packages() {
        _JobsPrint_Green "升级 Gem 到最新版本..."
        sudo gem update --system
        _JobsPrint_Green "Gem 已升级到最新版本."
        _JobsPrint_Green "更新 Gem 管理的所有包..."
        sudo gem update
        _JobsPrint_Green "🍺🍺🍺所有包已更新."
    }
    # 安装和升级 Gem 以及 Gem 管理的相关软件包
    install_or_update_gem() {
        _framework_do "arch -arm64 brew install ruby" "brew install ruby"
        _JobsPrint_Green "Gem 安装成功."
        update_gem_and_packages
    }

    if command -v gem &> /dev/null; then
        _JobsPrint_Green "Gem 已安装."
        read "reinstall_gem?是否卸载并重新安装 Gem? (按 Enter 键继续，输入任意字符则卸载并重新安装): "
        if [[ -n "$reinstall_gem" ]]; then
            _JobsPrint_Green "正在卸载 Gem..."
            sudo gem uninstall --all --executables gem
            _JobsPrint_Green "Gem 已成功卸载."
            install_or_update_gem
        else
            _JobsPrint_Green "不卸载 Gem，跳过安装步骤."
            update_gem_and_packages
        fi
    else
        _JobsPrint_Red "Gem 未安装."
        _JobsPrint_Green "正在安装 Gem..."
        install_or_update_gem
    fi

    _JobsPrint_Green "重建所有 Gem 扩展..."
    gem pristine --all
    _JobsPrint_Green "所有 Gem 扩展已重建."

    _JobsPrint_Green "创建和使用全局 gemset..."
    rvm gemset use global

    _JobsPrint_Green "安装 bundler..."
    sudo chown -R $(whoami) ~/.rbenv
    sudo gem install bundler
    _JobsPrint_Green "运行 bundle install..."
    bundle init
    bundle install
    bundle update
    bundler -v

    _JobsPrint_Green "执行 Gem 清理工作..."
    sudo gem clean
    _JobsPrint_Green "Gem 清理工作已完成."
}
# 卸载 CocoaPods
remove_cocoapods() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "查看本地安装过的 CocoaPods 相关内容："
    gem list --local | grep cocoapods

    _JobsPrint_Red "确认删除 CocoaPods？确认请输入 'y'，取消请回车"
    read -n 1 sure
    if [[ $sure == "y" ]]; then
        _JobsPrint_Green "开始卸载 CocoaPods"
        for element in $(gem list --local | grep cocoapods | cut -d" " -f1)
        do
            _JobsPrint_Green "正在卸载 CocoaPods 子模块：$element ......"
            sudo gem uninstall $element
        done
    else
        _JobsPrint_Green "取消卸载 CocoaPods"
    fi
}
# 更新 CocoaPods 本地库
update_cocoapods() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    _JobsPrint_Green "更新 CocoaPods 本地库..."
    pod repo update
    _JobsPrint_Green "CocoaPods 本地库已更新."
}
# 安装 CocoaPods
install_cocoapods() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    choice=$(printf "1. 安装稳定版 CocoaPods\n2. 安装预览版 CocoaPods" | fzf --prompt "请选择安装方式：")
    case $choice in
    "1. 安装稳定版 CocoaPods")
        _JobsPrint_Green "正在安装稳定版 CocoaPods..."
        sudo gem install cocoapods
        ;;
    "2. 安装预览版 CocoaPods")
        _JobsPrint_Green "正在安装预览版 CocoaPods..."
        sudo gem install cocoapods --pre
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新选择。"
        install_cocoapods # 递归安装 CocoaPods
        ;;
    esac
    # 安装其他相关的 CocoaPods 插件
#    sudo gem install \
#        # 这是一个 CocoaPods 插件，用于从一个项目中移除所有 CocoaPods 的痕迹。它可以清理所有由 CocoaPods 添加的配置和文件，使项目回到未使用 CocoaPods 管理依赖之前的状态。
#        cocoapods-deintegrate \
#        # 这个 Gem 为 CocoaPods 提供下载功能，支持多种类型的源（如 git, http, svn 等）。它是 CocoaPods 内部使用的组件，也可以单独用于下载特定的库或框架。
#        cocoapods-downloader \
#        # 这是一个用于与 CocoaPods 的 Trunk 服务交互的命令行工具。CocoaPods Trunk 是一个允许开发者提交他们的库到一个中央索引的服务，使得这些库可以被全球的开发者搜索和使用。
#        cocoapods-trunk \
#        # 这个插件允许开发者直接尝试使用一个 CocoaPod，而无需手动在项目中集成。它可以快速地克隆一个库的示例项目，安装依赖，并打开这个项目，使得评估和试用第三方库变得更加简单。
#        cocoapods-try
      
    update_cocoapods
    pod cache clean --all
}
# 检查和设置 Gem/CocoaPods 镜像
check_and_set_gem_cocoaPods_mirror() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    # 获取当前公网 IP 和地理位置信息
    local IP_INFO=$(curl -s https://ipinfo.io)
    local COUNTRY=$(echo $IP_INFO | jq -r '.country')
    _JobsPrint_Green "您的 IP 地址位于: $COUNTRY"
    # 判断当前是否在中国大陆
    if [ "$COUNTRY" = "CN" ]; then
        _JobsPrint_Red "检测到您当前在中国大陆。"
        _JobsPrint_Red "请输入 '1' 切换到清华大学镜像，或直接回车使用默认镜像："
        read user_choice
        if [ "$user_choice" = "1" ]; then
            _JobsPrint_Green "将使用清华大学镜像..."
            add_line_if_not_exists ".bash_profile" "source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'"
        else
            _JobsPrint_Green "将使用默认镜像..."
        fi
    else
        _JobsPrint_Green "您不在中国大陆，将使用默认镜像。"
    fi
}
# 检查并安装 CocoaPods
check_and_setup_cocoapods() {
    _JobsPrint_Yellow "正在执行: ${funcstack[1]}()"
    local_ip=$(curl -s https://api.ipify.org)
    china_ip=$(curl -s https://ip.ruby-china.com/ip)
    if [[ "$local_ip" == "$china_ip" ]]; then
        _JobsPrint_Green "本地当前的 IP 在中国大陆境内."
        _JobsPrint_Green "更换 Gem 源为 https://gems.ruby-china.com/ ..."
        gem sources --remove https://rubygems.org/
        gem sources --add https://gems.ruby-china.com/
        _JobsPrint_Green "选用清华大学的 CocoaPods 镜像..."
        pod repo remove master
        pod repo add master https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git
    else
        _JobsPrint_Green "本地当前的 IP 不在中国大陆境内，不需要更换 CocoaPods 镜像."
        _JobsPrint_Green "本地当前的 IP 不在中国大陆境内，将移除 Gem 源 https://gems.ruby-china.com/ ..."
        gem sources --remove https://gems.ruby-china.com/
        _JobsPrint_Green "还原默认 Gem 源..."
        gem sources --add https://rubygems.org/
    fi
    
    _JobsPrint_Green "更新 Gem 源列表缓存..."
    gem sources --update
    _JobsPrint_Green "Gem 源列表缓存已更新."
    
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if command -v pod &> /dev/null; then
        remove_cocoapods
    else
        _JobsPrint_Red "CocoaPods 未安装."
    fi
    _JobsPrint_Green "开始安装 CocoaPods..."
    install_cocoapods
    _JobsPrint_Green "检查 CocoaPods 的安装是否成功..."
    gem which cocoapods
    
    pod --version # 检查 pod 命令是否可用
    pod repo update # 更新本地的 CocoaPods 规范仓库（spec-repo）
    pod cache clean --all # CocoaPods 会在本地缓存下载的 Pod 以加快安装速度，但是有时这些缓存可能会导致问题或需要清理以释放空间
    pod search Masonry
}
# 主流程
jobs_logo # 打印 "Jobs" logo
self_intro # 自述信息
prepare_environment # 准备前置环境
check_xcode_and_tools # 检查 Xcode 和 Xcode Command Line Tools
uninstall_homebrew # 先卸载安装 Homebrew，保持环境OK
check_homebrew # 检查安装 Homebrew
check_and_update_fzf # 检查并安装/更新 fzf（2种方式安装:Homebrew/Git）
check_and_update_libyaml # 检查并安装/更新 Homebrew.libyaml
check_and_install_zsh # 检查并安装 Homebrew.zsh
echo $PATH | tr ':' '\n'
check_ruby_environment # 检查当前的 Ruby 环境
echo $PATH | tr ':' '\n'
check_and_remove_non_system_ruby # 检查并删除非系统 Ruby 环境
setup_ruby_environment # 安装 Ruby 环境（3种方式安装：Homebrew/Rbenv/RVM官方）
check_ruby_environment # 检查当前的 Ruby 环境
echo $PATH | tr ':' '\n'
check_and_set_gem_cocoaPods_mirror # 检查和设置 Gem/CocoaPods 镜像
check_and_setup_gem # 检查并安装 Homebrew.Gem
check_and_setup_cocoapods # 检查并安装 CocoaPods

open_files_if_enter # 打开系统配置文件
