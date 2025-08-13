#!/bin/zsh

# ✅ 日志与输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
warm_echo()      { log "\033[1;33m$1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
err_echo()       { log "\033[1;31m$1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }
underline_echo() { log "\033[4m$1\033[0m"; }

# ✅ 自述信息
show_intro() {
  echo ""
  success_echo "📜 脚本用途说明"
  gray_echo "--------------------------------------------"
  info_echo  "1️⃣ 自动检测并安装 brew 与 fzf 工具（如未安装）"
  info_echo  "2️⃣ 通过 fzf 选择要打开的配置文件，支持多选"
  info_echo  "3️⃣ 默认回车代表“全部文件”，可按需选择"
  info_echo  "4️⃣ 自动打开文件，并自动执行 source 加载"
  gray_echo "--------------------------------------------"
  echo ""
  read "?👉 按回车开始，输入任意字符退出： " go
  if [[ -n "$go" ]]; then
    error_echo "❌ 用户取消执行，已退出。"
    exit 0
  fi
}

# ✅ 工具检测模块 🧰
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

check_and_install_brew() {
  arch=$(get_cpu_arch)
  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
    fi
    _color_echo green "✅ Homebrew 安装成功"
  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup
    _color_echo green "✅ Homebrew 已更新"
  fi
}

check_and_install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) err "❌ 取消安装 fzf";;
    esac
  else
    _color_echo blue "🔄 fzf 已安装，升级中..."
    brew upgrade fzf
    _color_echo green "✅ fzf 已是最新版"
  fi
}

# ✅ 配置文件加载模块 📂
source_if_exists() {
  local file="$1"
  [[ -s "$file" ]] && source "$file"
}

select_config_files() {
  CONFIG_FILES=()
  [[ -f "$HOME/.bash_profile" ]] && CONFIG_FILES+=("$HOME/.bash_profile")
  [[ -f "$HOME/.bashrc"       ]] && CONFIG_FILES+=("$HOME/.bashrc")
  [[ -f "$HOME/.zshrc"        ]] && CONFIG_FILES+=("$HOME/.zshrc")
  [[ -f "$ZSH/oh-my-zsh.sh"   ]] && CONFIG_FILES+=("$ZSH/oh-my-zsh.sh")

  if (( ${#CONFIG_FILES[@]} == 0 )); then
    error_echo "❌ 未检测到任何 shell 配置文件，终止执行"
    exit 1
  fi

  note_echo "👇 请选择你要打开的配置文件（支持多选，默认回车 = 全部）"
  SELECTED_FILES=("${(@f)$(printf '%s\n' "${CONFIG_FILES[@]}" | fzf --multi --prompt "配置文件 > ")}")
  [[ -z "$SELECTED_FILES" ]] && SELECTED_FILES=("${CONFIG_FILES[@]}")
}

open_and_source_files() {
  for file in "${SELECTED_FILES[@]}"; do
    highlight_echo "🚀 正在打开并加载：$file"
    open "$file"
    source_if_exists "$file"
  done
}

# ✅ 主函数入口 🚀
main() {
  show_intro                             # ✅ 自述信息
  check_and_install_brew                 # ✅ 自动检测并安装 Homebrew
  check_and_install_fzf                  # ✅ 自动检测并安装 Homebrew.fzf
  select_config_files                    # ✅ 使用 Homebrew.fzf 选择要打开的配置文件
  open_and_source_files                  # ✅ 打开并执行 source 加载
}

main "$@"

# ~/.bash_profile
# ~/.bashrc
# ~/.zshrc 是不同的 shell 配置文件，每个文件的优先级和作用取决于你使用的 shell 类型以及你在启动 shell 时的方式
# 以下是对它们的优先级和作用的详细说明：

# Bash Shell
# ~/.bash_profile
# 这是一个用户级的启动文件，当以登录方式启动 Bash shell 时（例如通过终端登录或者 SSH 登录时），Bash 会读取并执行 ~/.bash_profile 中的内容。
# 如果 ~/.bash_profile 不存在，Bash 会尝试读取 ~/.bash_login 或者 ~/.profile。

# ~/.bashrc
# 这是一个用户级的非登录 shell 启动文件，当启动一个非登录的 Bash shell 时（例如打开一个终端窗口或者执行一个新的 shell 命令时），Bash 会读取并执行 ~/.bashrc 中的内容。
# 通常在 ~/.bash_profile 中会有一行代码来手动加载 ~/.bashrc，以便确保登录 shell 和非登录 shell 都会执行 ~/.bashrc 中的配置。

# bash
# 复制下列代码
# if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
# fi

# Zsh Shell
# ~/.zshrc
# 这是 Zsh 的配置文件，不论是登录 shell 还是非登录 shell，Zsh 启动时都会读取并执行 ~/.zshrc 中的内容。
# 对于 Zsh 而言，~/.zshrc 是主要的配置文件。

# 优先级总结
# 对于 Bash：
# 登录 shell：先执行 ~/.bash_profile，如果在 ~/.bash_profile 中有 source ~/.bashrc，则会接着执行 ~/.bashrc。
# 非登录 shell：只执行 ~/.bashrc。

# 对于 Zsh：
# 无论是登录 shell 还是非登录 shell，都只执行 ~/.zshrc。
# 根据你使用的 shell 类型和启动方式，这些文件的优先级和作用会有所不同。
# 对于大多数桌面用户来说，通常会配置 ~/.bashrc 或者 ~/.zshrc 来设置常用的环境变量和别名，而 ~/.bash_profile 则用来进行一些需要在登录时执行的初始化操作。
