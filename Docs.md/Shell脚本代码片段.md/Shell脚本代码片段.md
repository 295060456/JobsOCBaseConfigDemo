# `Shell`脚本代码片段

[toc]

## 一、🎯<font id=目的>**目的**</font>

* 虽然**Shell**脚本晦涩难懂，但相较于**python**等脚本，因为减少了一层系统封装调用，所以使得**shell**脚本具有更大的普适度

  * 不会因为第三方**Api**更新而影响使用
  * 也降低了某些潜在的兼容性等**Bug**的出现几率
  * 增强了代码执行的效率

* 为了更好的规避**Shell**脚本的晦涩难懂，特此文件记录一些高频需求涉及到的**Shell**脚本代码片段

* 以下所有的**Shell**脚本使用`#!/bin/zsh`语法

  | 特性                           | `#!/bin/zsh`（推荐）          | `#!/bin/sh`（兼容） |
  | ------------------------------ | ----------------------------- | ------------------- |
  | 默认交互功能（补全、高亮等）   | ✅ 强                          | ❌ 弱                |
  | 支持数组                       | ✅ 原生支持                    | ❌ 基本不支持        |
  | 字符串处理能力强               | ✅ 强大（支持正则/替换）       | ❌ 弱                |
  | 支持关联数组（字典）           | ✅ 支持                        | ❌ 不支持            |
  | 脚本调试支持                   | ✅ `set -x` + `zsh -x`         | ✅ `sh -x`           |
  | 更好的语法扩展（例如 `[[ ]]`） | ✅ 支持                        | ❌ 不支持            |
  | 更现代更安全的语法             | ✅ 是                          | ❌ 否                |
  | **macOS** 默认支持             | ✅ 是（**Catalina** 之后默认） | ✅ 是                |

## 二、💥代码讲解 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

### 🎯 打印输出彩色函数 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
color_echo() { echo "\033[1;32m$1\033[0m"; }
warm_echo()  { echo "\033[1;33m$1\033[0m"; }
warn_echo()  { echo "\033[1;33m$1\033[0m"; }
err_echo()   { echo "\033[1;31m$1\033[0m"; }
```

```shell
_color_echo() {
  local color="$1"; shift
  local text="$*"
  case "$color" in
    green)  printf "\033[32m%s\033[0m\n" "$text" ;;
    red)    printf "\033[31m%s\033[0m\n" "$text" ;;
    yellow) printf "\033[33m%s\033[0m\n" "$text" ;;
    blue)   printf "\033[34m%s\033[0m\n" "$text" ;;
    cyan)   printf "\033[36m%s\033[0m\n" "$text" ;;
    *)      printf "%s\n" "$text" ;;
  esac
}
```

```shell
_JobsPrint() {
    local COLOR="$1"
    local TEXT="$2"
    local RESET="\033[0m"
    echo "${COLOR}${TEXT}${RESET}"
}
_JobsPrint_Red()    { _JobsPrint "\033[1;31m" "$1" }
_JobsPrint_Green()  { _JobsPrint "\033[1;32m" "$1" }
_JobsPrint_Yellow() { _JobsPrint "\033[1;33m" "$1" }
```

### 🎯 打开系统设置 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open "x-apple.systempreferences:com.apple.preference.security?Privacy"
```

### 🎯 等待用户输入后执行 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
read '?XXX 任意键=跳过： ' sim_input
if [[ -z "$sim_input" ]]; then
  # 系统检测到用户输入回车，开始执行
else
  # 系统检测到用户输入任意键
fi
```

```shell
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

echo ""
```

```shell
read -p "⚠️ 确定要卸载 XXX？请输入 yes 开始执行：" confirm

if [[ "$confirm" != "yes" ]]; then
  echo "❎ 已取消卸载操作"
  exit 0
fi

echo "🧨 正在卸载 XXX..."
```

### 🎯 获取系统变量 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

* **获取：脚本所在目录的绝对路径**

  >`"$0"`：表示**当前脚本的相对路径或调用路径**
  >
  >`dirname "$0"`：提取出脚本所在的**目录路径**
  >
  >`cd "$(dirname "$0")"`：进入脚本所在的目录
  >
  >`pwd`：获取当前目录的**绝对路径**

  ```shell
  script_path="$(cd "$(dirname "$0")" && pwd)"
  ```

* **获取：当前脚本文件名**

  > `basename "$0"`：提取脚本文件的**文件名**部分（去除路径）

  ```shell
  script_file="$(basename "$0")"
  ```

* **获取：桌面路径**

  ```shell
  DESKTOP_PATH=~/Desktop
  ```

* **获取：当前用户名**

  > 用双引号 `"` 包裹起来，可以防止用户名中出现空格、特殊字符时发生错误

  ```shell
  user="$USER" # 最强兼容性（大部分 shell 都默认支持）
  user="${USER:-$(whoami)}" # 最强健壮性：防止极端场景 $USER 为空
  ```

  ```shell
  user="$(whoami)"
  ```

  ```shell
  user="$(id -un)" 
  ```

  ```shell
  user="$(logname)" 
  ```

  | 表达式    | 类型     | 含义说明                                                 |
  | --------- | -------- | -------------------------------------------------------- |
  | `"$USER"` | 环境变量 | 当前 shell 会话中的用户名变量（快捷方式）                |
  | `whoami`  | 命令     | 实际正在运行当前 shell 进程的用户名                      |
  | `id -un`  | 命令     | 当前有效用户的用户名（与 `whoami` 通常一样，但更底层）   |
  | `logname` | 命令     | 最初登录系统的用户（在 `sudo` 场景下可能与当前用户不同） |

* 

### 🎯 判断当前目录是否为[**Flutter**](https://flutter.dev/)项目 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
if [[ -f "$flutter_project_root/pubspec.yaml" ]]; then
  flutter_project_name=$(grep -m1 '^name:' "$flutter_project_root/pubspec.yaml" | awk '{print $2}')
else
  flutter_project_name="Flutter项目"
fi
```

### 🎯 生成桌面快捷方式 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
shortcut_name="${flutter_project_name}.command"
shortcut_path="$HOME/Desktop/$shortcut_name"
if [[ ! -f "$shortcut_path" ]]; then
  ln -s "$script_path/$script_file" "$shortcut_path"
  chmod +x "$shortcut_path"
  echo "📎 已在桌面创建快捷方式：$shortcut_name"
fi
```

### 🎯 转换路径为<font color=red>**绝对路径**</font> <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> **将用户输入的路径（文件或文件夹）转换为“绝对路径（不含软链接）”**，并去掉多余的双引号或末尾斜杠，增强兼容性。

```shell
_abs_path() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  # 去掉包裹双引号
  p="${p//\"/}"
  # 去掉末尾斜杠（不影响根 /）
  [[ "$p" != "/" ]] && p="${p%/}"
  if [[ -d "$p" ]]; then
    (cd "$p" 2>/dev/null && pwd -P)
  elif [[ -f "$p" ]]; then
    (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")
  else
    return 1
  fi
}
```

### 🎯 判断[**Flutter**](https://flutter.dev/)文件是否是入口🚪 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> <font color=red>**支持的**`main`**函数写法**</font>
> `void main() {}`// 标准同步入口
> `void main() => runApp();`// 箭头函数写法
> `Future<void> main() async {}`// 异步入口函数
> `Future<void> main() => runApp(); `// 异步箭头写法
> `main() {}`// 无返回值声明的入口
> `main() async {}`// 无返回值 + 异步入口

```shell
_is_dart_entry_file() {
  local f="$1"
  local abs=$(_abs_path "$f") || return 1
  [[ $abs == *.dart ]] || return 1

  # ✅ 支持 main() {...} 和 main() => ... 写法
  if grep -Ev '^\s*//' "$abs" | grep -Eq '\b(Future\s*<\s*void\s*>|void)?\s*main\s*\(\s*\)\s*(async\s*)?(\{|=>)' ; then
    return 0
  fi
  return 1
}
```

### 🎯 统一获取[**Flutter**](https://flutter.dev/)项目路径 和 Dart 入口文件路径 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> 兼容用户拖入目录、拖入 Dart 文件、或直接回车（默认为当前目录为[**Flutter**](https://flutter.dev/)项目根目录）三种用法

```shell
# ---------------------------------------------------------------------------
# 获取脚本自身绝对路径（用于桌面快捷方式）
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd -P)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"

# ---------------------------------------------------------------------------
# 入口识别：支持三种情况
#   A. 用户拖入路径（目录 / 文件）并回车
#   B. 用户直接回车（空输入）=> 若脚本所在目录是 Flutter 根目录则自动使用
#   C. 用户拖入 Dart 单文件
# ---------------------------------------------------------------------------
entry_file=""
flutter_root=""

while true; do
  _color_echo yellow "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径："
  read -r user_input
  user_input="${user_input//\"/}"          # 去掉引号
  user_input="${user_input%/}"              # 去尾斜杠

  # 用户直接回车：尝试脚本所在目录
  if [[ -z "$user_input" ]]; then
    if _is_flutter_project_root "$SCRIPT_DIR"; then
      flutter_root=$(_abs_path "$SCRIPT_DIR")
      entry_file="$flutter_root/lib/main.dart"
      _color_echo cyan "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
      break
    else
      _color_echo red "❌ 未检测到有效路径（脚本目录不是 Flutter 根）。请重新拖入。"
      continue
    fi
  fi

  if [[ -d "$user_input" ]]; then
    if _is_flutter_project_root "$user_input"; then
      flutter_root=$(_abs_path "$user_input")
      entry_file="$flutter_root/lib/main.dart"
      break
    fi
  elif [[ -f "$user_input" ]]; then
    if _is_dart_entry_file "$user_input"; then
      entry_file=$(_abs_path "$user_input")
      flutter_root="${entry_file:h}"
      break
    fi
  fi

  _color_echo red "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
 done

cd "$flutter_root" || { _color_echo red "无法进入项目目录：$flutter_root"; exit 1; }
_color_echo green "✅ 项目路径：$flutter_root"
_color_echo green "🎯 入口文件：$entry_file"
```

### 🎯 [**FVM**](https://fvm.app/) 检测 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
if [[ -f "$flutter_root/.fvm/fvm_config.json" ]]; then
  _color_echo yellow "🧩 检测到 FVM，将使用 fvm flutter。"
  flutter_cmd=(fvm flutter)
else
  flutter_cmd=(flutter)
fi
```

```dart
read '?📦 执行 flutter pub get？(回车=执行 / 任意键=跳过) ' run_get
if [[ -z "$run_get" ]]; then
  "${flutter_cmd[@]}" pub get
else
  _color_echo yellow "⏭️ 跳过 pub get。"
fi
```

> 如果安装了[**FVM**](https://fvm.app/) ，则 `fvm flutter pub get`
>
> 如果没有安装[**FVM**](https://fvm.app/) ，则 `flutter pub get`

### 🎯 iOS 模拟器（检测）防止假后台  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> 如果是假后台：`xcrun simctl list devices | grep -E "Booted"` 控制台什么也不输出
> 如果真后台：`xcrun simctl list devices | grep -E "Booted"` 控制台会有输出

```shell
_color_echo yellow "🕵️ 检测模拟器是否处于假后台..."

booted_check=$(xcrun simctl list devices | grep "(Booted)")
simulator_running=$(pgrep -f Simulator)

if [[ -z "$booted_check" && -n "$simulator_running" ]]; then
  _color_echo red "❗️ 模拟器处于假后台状态，正在强制关闭..."
  xcrun simctl shutdown all >/dev/null 2>&1
  osascript -e 'quit app "Simulator"' >/dev/null 2>&1
  pkill -f Simulator >/dev/null 2>&1
  _color_echo green "✅ 已强制关闭假后台模拟器。"
else
  _color_echo green "✅ 模拟器状态正常，无需关闭。"
fi
```

### 🎯 执行耗时  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
START_TIME=$(date +%s) # 放在最前面
# 耗时操作...

print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  info "⚙️ 脚本总耗时：${DURATION}s"
}

print_duration
```

### 🎯 判断芯片架构（ARM64 / x86_64）<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}
```

### 🎯自检安装 🍺**`Homebrew`** （自动架构判断）<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_homebrew() {
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
```



### 🎯 删除🍺**`Homebrew`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
# 1. 尝试 untap & 清理
brew untap homebrew/core || true
brew cleanup || true

# 2. 官方卸载脚本（HEAD 版）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# 3. 手动删除常见路径（Intel 和 M 系）
sudo rm -rf /usr/local/Caskroom/
sudo rm -rf /usr/local/Frameworks/
sudo rm -rf /usr/local/Homebrew/
sudo rm -rf /usr/local/bin/
sudo rm -rf /usr/local/etc/
sudo rm -rf /usr/local/include/
sudo rm -rf /usr/local/lib/
sudo rm -rf /usr/local/opt/
sudo rm -rf /usr/local/sbin/
sudo rm -rf /usr/local/share/
sudo rm -rf /usr/local/var/
sudo rm -rf /opt/homebrew/

# 4. 修复 fatal: Could not resolve HEAD 错误
brew_repo=$(brew --repo homebrew/core 2>/dev/null)
if [[ -n "$brew_repo" ]]; then
  sudo rm -rf "$brew_repo"
fi
```

### 🎯 自检安装 **`fzf`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_fzf() {
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
```

### 🎯 安装 **`Ruby`**（fzf交互 + 多选项） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_ruby() {
  method=$(fzf_select "通过 Homebrew 安装 Ruby" "通过 Rbenv 安装 Ruby" "通过 RVM 安装 Ruby")
  case $method in
    *Homebrew*)
      brew install ruby
      echo 'export PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
      ;;
    *Rbenv*)
      brew install rbenv ruby-build
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
      eval "$(rbenv init -)"
      rbenv install 3.3.0
      rbenv global 3.3.0
      ;;
    *RVM*)
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      source ~/.rvm/scripts/rvm
      ;;
    *) err "❌ 未选择安装 Ruby";;
  esac
}
```

### 🎯 设置**`Ruby`**镜像源（根据 IP 自动判断） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
set_gem_source() {
  COUNTRY=$(curl -s https://ipinfo.io | jq -r '.country')
  if [[ "$COUNTRY" == "CN" ]]; then
    gem sources --remove https://rubygems.org/ 2>/dev/null
    gem sources --add https://gems.ruby-china.com/
    info "🇨🇳 使用 Ruby 中国镜像"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null
    gem sources --add https://rubygems.org/
    info "🌐 使用默认 Ruby 镜像"
  fi
  gem sources -l | tee -a "$LOG_FILE"
}
```

### 🎯 安装**`CocoaPods`**（`fzf`选择 `gem`/`brew`） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```
install_cocoapods() {
  method=$(fzf_select "通过 gem 安装 CocoaPods" "通过 Homebrew 安装 CocoaPods")
  case $method in
    *gem*)
      sudo gem install cocoapods
      ;;
    *Homebrew*)
      brew install cocoapods
      ;;
    *) err "❌ 未选择安装方式";;
  esac
  pod setup
  info "✅ CocoaPods 安装完成"
  pod --version | tee -a "$LOG_FILE"
}
```

### 🎯 检测本地**`Java`**环境是否已经安装 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> **`command -v java`**：检查 `java` 命令是否存在于 `PATH` 中；
>
> **`>/dev/null 2>&1`**：忽略输出（标准输出和错误输出）；
>
> 如果存在，则执行 `then` 块，否则执行 `else`。
>
> **`java -version 2>&1 | head -n 1`**：获取 `java -version` 输出（通常是多行），`head -n 1`：只取第一行显示版本号。
>
> **`echo "JAVA_HOME" "${JAVA_HOME:-[未设置]}"`**：`${JAVA_HOME:-[未设置]}`：如果 `JAVA_HOME` 没有设置，就显示 `[未设置]`；

```shell
if command -v java >/dev/null 2>&1; then
    java -version 2>&1 | head -n 1
    echo "JAVA_HOME" "${JAVA_HOME:-[未设置]}"
else
    echo "未安装 Java"
fi 
```

### 🎯 删除本地**`Git`**缓存目录 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
REPO_PATH="$HOME/.cocoapods/repos/cocoapods"
if [ -d "$REPO_PATH" ]; then
  print_green "🗑️ 删除本地 git 源缓存目录: $REPO_PATH"
  rm -rf "$REPO_PATH"
else
  print_green "✅ 本地 git 缓存目录不存在，无需删除"
fi
```

### 🎯 删除**`CDN`**源**`trunk`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
if pod repo list | grep -q "^trunk"; then
  print_green "🔍 检测到 trunk（CDN 源），正在删除..."
  pod repo remove trunk
else
  print_green "✅ 未检测到 trunk（CDN 源），无需删除"
fi
```

### 🎯 添加**`Git`**源 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
print_green "🔗 正在添加 Git 源 https://github.com/CocoaPods/Specs.git ..."
pod repo add cocoapods https://github.com/CocoaPods/Specs.git
```

### 🎯 切换`Shell` <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
# ========== 获取所有可用 shell ==========
available_shells=($(cat /etc/shells | grep -E "^/"))

if [[ ${#available_shells[@]} -eq 0 ]]; then
    echo "❌ 无法读取可用 shell"
    exit 1
fi

# ========== fzf 选择 ==========
echo "🎯 请选择你要切换的默认 shell："
selected_shell=$(printf "%s\n" "${available_shells[@]}" | fzf --prompt="Shell ➜ ")

if [[ -z "$selected_shell" ]]; then
    echo "❌ 未选择 shell，操作取消"
    exit 1
fi

# ========== 执行切换 ==========
echo "🔧 正在切换默认 shell 为：$selected_shell"
chsh -s "$selected_shell"
```

### 🎯 显示当前`Shell` <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
echo "✅ 当前默认 shell 已更新为："
dscl . -read ~/ UserShell
```

### 🎯 打开新的终端窗口并切换到脚本所在的目录 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open_terminal_and_cd() {
    local dir="$1"
    osascript <<EOF
tell application "Terminal"
    do script "cd $dir"
    activate
end tell
EOF
}
```

### 🎯 把环境变量 `$PATH` 中的路径项按冒号（`:`）拆分，并逐行打印每一项路径 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> `IFS=':'`：设置字段分隔符（Internal Field Separator）为 `:`；
>
> `read -ra PATH_PARTS`：
>
> - `-r`：表示不让反斜杠转义；
> - `-a PATH_PARTS`：把读取的结果保存到数组 `PATH_PARTS` 中；
>
> `<<< "$PATH"`：将 `$PATH` 的内容作为输入传给 `read`；

```shell
IFS=':' read -ra PATH_PARTS <<< "$PATH" # 等价于把 $PATH 按 : 拆成数组。
for p in "${PATH_PARTS[@]}"; do # 遍历数组 PATH_PARTS 中的每一项；
    echo "  $p" # 并在每一项前加两个空格打印出来。
done
```

```
/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin 

=>

/usr/local/bin
/opt/homebrew/bin
/usr/bin
/bin
```

