#!/bin/zsh

# ✅ 全局变量
REPO_URL="https://github.com/295060456/JobsCommand.iOS.git"
CLONE_DIR="$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")/将此文件夹管理的脚本拖到此iOS项目的根目录运行.command"

# ✅ 彩色输出
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }

# ✅ 下载并运行
main() {
    info_echo "📥 开始克隆 SourceTree.sh 仓库到 $CLONE_DIR..."
    rm -rf "$CLONE_DIR"  # 删除旧版本
    if ! git clone --depth=1 "$REPO_URL" "$CLONE_DIR"; then
        error_echo "❌ 克隆失败"
        exit 1
    fi

    success_echo "✔ 克隆完成：$CLONE_DIR"

    info_echo "🔑 赋予执行权限..."
    find "$CLONE_DIR" -type f \( -name "*.sh" -o -name "*.command" \) -exec chmod +x {} \;
    
    open $CLONE_DIR
}

main "$@"
