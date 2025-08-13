#!/bin/zsh

# ✅ 全局变量定义
PROFILE_FILE="$HOME/.bash_profile"
BACKUP_FILE="$PROFILE_FILE.bak"
ALL_IDS=(1 2 3 4 5 6 7 8 9 10 11) # 🔥 如果要增删条目，需要改这里

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_description() {
  echo ""
  bold_echo "🛠️ 环境变量快速写入脚本"
  gray_echo "---------------------------------------------"
  note_echo "1️⃣ 选择配置文件（.zshrc / .bash_profile / etc）"
  note_echo "2️⃣ 支持多种常用开发工具配置写入"
  note_echo "3️⃣ 自动避免重复写入，结构清晰"
  note_echo "4️⃣ 全程交互，写入前预览确认"
  gray_echo "---------------------------------------------"
}

# ✅ 等待用户确认
wait_for_user_to_start() {
  echo ""
  read "?👉 按下回车开始执行，或 Ctrl+C 取消..."
  echo ""
}

# ✅ 单行写文件（避免重复写入）
inject_shellenv_block() {
    local id="$1"           # 参数1：环境变量块 ID，如 "homebrew_env"
    local shellenv="$2"     # 参数2：实际要写入的 shellenv 内容，如 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    local header="# >>> ${id} 环境变量 >>>"  # 自动生成注释头

    # 参数校验
    if [[ -z "$id" || -z "$shellenv" ]]; then
    error_echo "❌ 缺少参数：inject_shellenv_block <id> <shellenv>"
    return 1
    fi

    # 若用户未选择该 ID，则跳过写入
    if [[ ! " ${selected_envs[*]} " =~ " $id " ]]; then
    warn_echo "⏭️ 用户未选择写入环境：$id，跳过"
    return 0
    fi

    # 避免重复写入
    if grep -Fq "$header" "$PROFILE_FILE"; then
      info_echo "📌 已存在 header：$header"
    elif grep -Fq "$shellenv" "$PROFILE_FILE"; then
      info_echo "📌 已存在 shellenv：$shellenv"
    else
      echo "" >> "$PROFILE_FILE"
      echo "$header" >> "$PROFILE_FILE"
      echo "$shellenv" >> "$PROFILE_FILE"
      success_echo "✅ 已写入：$header"
    fi

    # 当前 shell 生效
    eval "$shellenv"
    success_echo "🟢 shellenv 已在当前终端生效"
}

# ✅ 写入配置块到顶部 + 判重
insert_block_to_profile_top() {
  local marker="$1"
  shift
  local block=("${@}")

  for line in "${block[@]}"; do
    if grep -Fq "$line" "$PROFILE_FILE"; then
      info_echo "已存在配置：$line"
      return
    fi
  done

  local original_content="$(< "$PROFILE_FILE")"
  local block_text="${(j:\n:)block}"
  echo -e "${block_text}\n\n${original_content}" > "$PROFILE_FILE"
  success_echo "✅ 写入成功：$marker"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 Homebrew
install_homebrew() {
  local arch="$(get_cpu_arch)"                   # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}

# ✅ 自检安装 Homebrew.fzf
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    note_echo "📦 未检测到 fzf，正在通过 Homebrew 安装..."
    brew install fzf || { error_echo "❌ fzf 安装失败"; exit 1; }
    success_echo "✅ fzf 安装成功"
  else
    info_echo "🔄 fzf 已安装，升级中..."
    brew upgrade fzf && brew cleanup
    success_echo "✅ fzf 已是最新版"
  fi
}

# ✅ fzf 多选菜单 🔥 如果要增删条目，需要改这里
choose_config_items() {
  local choice=$(cat <<EOF | fzf --multi --prompt="🎯 请选择要写入的开发环境变量配置（可多选）：" --height=20 --border --reverse --ansi | cut -d ':' -f1
1:  配置 Rbenv / Ruby
2:  配置 Curl
3:  配置 VSCode 命令行
4:  配置 Flutter 环境变量
5:  配置 Android SDK
6:  配置 FVM
7:  配置 JDK / SDKMAN
8:  配置 Gradle
9:  配置 pipx
10: 配置 sdkman
11: 配置 Jenv
all: ✅ 全选写入
EOF
)
  echo "$choice"
}

# ✅ 每项配置逻辑 🔥 如果要增删条目，需要改这里
write_block_to_profile() {
  local id="$1"
  local block=()
  local marker=""

  case "$id" in
    1)
      block=(
        "# 🔥配置 Rbenv / Ruby"
        'export PATH="$HOME/.rbenv/bin:$PATH"'
        'eval "$(rbenv init -)"'
      ) ;;
    2)
      block=(
        "# 🔥配置 Curl 环境变量"
        'export PATH="/usr/local/opt/curl/bin:$PATH"'
      ) ;;
    3)
      block=(
        "# 🔥配置 VSCode 命令行"
        'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"'
      ) ;;
    4)
      block=(
        "# 🔥配置 Flutter 环境变量"
        'export PATH="$HOME/flutter/bin:$PATH"'
        'export PUB_HOSTED_URL=https://pub.dev'
        'export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com'
      ) ;;
    5)
      block=(
        "# 🔥配置 Android SDK"
        'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"'
        'export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"'
      ) ;;
    6)
      block=(
        "# 🔥配置 FVM"
        'export PATH="$HOME/.pub-cache/bin:$PATH"'
        'flutter() { fvm flutter "$@"; }'
      ) ;;
    7)
      block=(
        "# 🔥配置 JDK"
        'export JAVA_HOME=$(/usr/libexec/java_home)'
        'export PATH="$JAVA_HOME/bin:$PATH"'
      ) ;;
    8)
      block=(
        "# 🔥配置 Gradle"
        'export PATH="$HOME/Documents/Gradle/gradle-8.7/bin:$PATH"'
      ) ;;
    9)
      block=(
        "# 🔥配置 pipx"
        'export PATH="$PATH:$HOME/.local/bin"'
      ) ;;
    10)
      block=(
        "# 🔥配置 sdkman"
        '## // TODO'
      ) ;;
    11)
      block=(
        "# 🔥配置 Jenv"
        'export PATH="$HOME/.jenv/bin:$PATH"'
        'eval "$(jenv init -)"'
      ) ;;
    *)
      warn_echo "⚠️ 未知编号：$id，已跳过"
      return ;;
  esac

  marker="${block[1]}"
  insert_block_to_profile_top "$marker" "${block[@]}"
}

# ✅ 强制写入 cd ~/Desktop
write_cd_desktop_block() {
  local block=(
    "# 📁 每次启动默认进入桌面目录"
    'cd ~/Desktop'
  )
  insert_block_to_profile_top "${block[1]}" "${block[@]}"
}

# ✅ 打开文件前先关闭 TextEdit 中的 .bash_profile
open_profile_file() {
  info_echo "🛑 正在关闭 TextEdit 中的 .bash_profile（如果已打开）..."
  osascript -e '
    tell application "TextEdit"
      set theDocs to every document whose name is ".bash_profile"
      repeat with d in theDocs
        close d saving no
      end repeat
    end tell
  '

  info_echo "📝 正在重新打开 $PROFILE_FILE"
  open -e "$PROFILE_FILE"
}

# ✅ 执行一次写入流程
run_write_flow() {
  local selections
  selections=$(choose_config_items)

  if [[ -z "$selections" ]]; then
    warn_echo "⏹️ 未选择任何项，已取消操作"
    return 1
  fi

  local -a targets=()
  local is_all_selected=false

  for id in ${(f)selections}; do
    if [[ "$id" == "all" ]]; then
      targets+=("${ALL_IDS[@]}")
      is_all_selected=true
    else
      targets+=("$id")
    fi
  done

  targets=("${(@u)targets}")  # 去重

  for id in "${targets[@]}"; do
    write_block_to_profile "$id"
  done

  write_cd_desktop_block
  success_echo "🏁 本轮写入完成"

  open_profile_file

  if $is_all_selected; then
    return 99  # ✅ 特殊返回值表示全选
  else
    return 0   # ✅ 正常完成一轮
  fi
}


# ✅ 是否继续写入？
prompt_continue() {
  while true; do
    echo ""
    read "resp?🔁 是否继续写入？(y/n): "
    case "$resp" in
      y|Y) return 0 ;;
      n|N) success_echo "👋 已退出脚本"; return 1 ;;
      *) warn_echo "⚠️ 无效输入，请输入 y 或 n" ;;
    esac
  done
}

# ✅ 准备文件与备份
prepare_profile_file() {
  [[ ! -f "$PROFILE_FILE" ]] && {
    warn_echo "⚠️ $PROFILE_FILE 不存在，已创建"
    touch "$PROFILE_FILE"
  }

  cp "$PROFILE_FILE" "$BACKUP_FILE"
  success_echo "🗂️ 已备份为：$BACKUP_FILE"
}

# ✅ 主函数入口
main() {
    print_description                   # ✅ 自述信息
    wait_for_user_to_start              # ✅ 等待用户确认
#    install_homebrew                    # ✅ 自检安装 Homebrew
#    install_fzf                         # ✅ 自检安装 Homebrew.fzf
    info_echo "📋 准备写入 $PROFILE_FILE"
    prepare_profile_file                # ✅ 准备文件与备份

    while true; do
        run_write_flow
        case $? in
          99) success_echo "✅ 全选写入完成，已自动退出"; break ;;
          1)  break ;;  # 用户未选择任何项
        esac
        prompt_continue || break
    done
}

main "$@"
