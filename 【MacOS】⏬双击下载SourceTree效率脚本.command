#!/bin/zsh

# ✅ 全局变量
REPO_URL="https://github.com/295060456/SourceTree.sh.git"
CLONE_DIR="$HOME/SourceTree.sh"

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
    chmod +x "$CLONE_DIR"/*.sh

    info_echo "🚀 正在执行脚本..."
    /bin/zsh "$CLONE_DIR/SourceTree.sh"
    
    open $HOME/SourceTree.sh
}

main "$@"
