#!/bin/zsh

# 打印 "Jobs" logo
jobs_logo() {
    local logo="
JJJJJJJJ     oooooo    bb          SSSSSSSSSS
      JJ    oo    oo   bb          SS      SS
      JJ    oo    oo   bb          SS
      JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS
J     JJ    oo    oo   bb      bb          SS
JJ    JJ    oo    oo   bb      bb  SS      SS
 JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS
"
    _JobsPrint_Green "$logo"
}

# 全局变量声明
typeset -g script_dir
typeset -g default_old_project_name
# 定义新的工程名变量
NEW_PROJECT_NAME="Monkey"
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
# 自述信息
self_intro() {
    _JobsPrint_Red "【MacOS】更改iOS项目工程名"
    _JobsPrint_Red "按回车键继续..."
    read
}
# 定义一个函数用于搜索和替换内容
search_and_replace() {
    local file_path="$1"
    local search_term="$2"
    local replace_term="$3"
    get_script_dir
    if [[ ! -f $file_path ]]; then
        _JobsPrint_Red "文件不存在。"
        return 1
    fi
    if grep -q "$search_term" "$file_path"; then
        sed -i "" "s/$search_term/$replace_term/g" "$file_path"
        _JobsPrint_Green "内容已从 '$search_term' 替换为 '$replace_term'。"
    else
        _JobsPrint_Red "文件中没有找到 '$search_term'。"
    fi
}
# 在指定路径下搜索并替换文件内容
process_file() {
    local directory="$1"
    local filename_pattern="$2"
    local search_term="$3"
    local replace_term="$4"

    _JobsPrint_Green "directory = $directory"
    _JobsPrint_Green "filename_pattern = $filename_pattern"
    _JobsPrint_Green "search_term = $search_term"
    _JobsPrint_Green "replace_term = $replace_term"

    file_path=$(find "$directory" -type f -path "$directory/$filename_pattern")
    if [[ -n "$file_path" ]]; then
        _JobsPrint_Green "正在处理文件：$file_path"
        search_and_replace "$file_path" "$search_term" "$replace_term"
    else
        _JobsPrint_Red "未找到符合条件的文件: $filename_pattern"
    fi
}
# 更新 Oh My Zsh
update_OhMyZsh() {
    _JobsPrint_Red "检查是否有新版本..."
    cd ~/.oh-my-zsh || exit
    git fetch origin master
    if git rev-list --count HEAD..origin/master | grep -q '^0$' > /dev/null; then
        _JobsPrint_Green "已经是最新版本，无需更新。"
    else
        _JobsPrint_Red "发现新版本，正在升级 Oh My Zsh..."
        git pull origin master
    fi
}
# 检查并安装 Oh My Zsh
check_OhMyZsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        _JobsPrint_Red "当前系统中未安装 Oh My Zsh，正在进行安装..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        return 1
    else
        _JobsPrint_Red "当前系统中已安装 Oh My Zsh，进行检查更新升级。"
        update_OhMyZsh
        return 0
    fi
}
# 检查系统是否支持 Rosetta 2
check_rosetta_compatibility() {
    if /usr/sbin/softwareupdate --install-rosetta --agree-to-license &> /dev/null; then
        _JobsPrint_Red "系统支持 Rosetta 2，正在安装..."
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
        _JobsPrint_Green "Rosetta 2 安装成功"
    else
        _JobsPrint_Red "系统不支持 Rosetta 2，跳过安装。"
    fi
}
# 准备前置环境
prepare_environment() {
    _JobsPrint_Green "先做一些准备工作..."
    defaults write com.apple.Finder AppleShowAllFiles YES
    sudo spctl --master-disable
    check_OhMyZsh
    check_rosetta_compatibility
}
# 检查 Xcode 和 Xcode Command Line Tools
check_xcode_and_tools() {
    if ! command -v xcodebuild &> /dev/null; then
        _JobsPrint_Red "Xcode 未安装，请安装后再运行此脚本。"
        open -a "App Store" "macappstore://apps.apple.com/app/xcode/id497799835"
        return 1
    fi

    if ! xcode-select -p &> /dev/null; then
        _JobsPrint_Red "Xcode Command Line Tools 未安装，请安装后再运行此脚本。"
        xcode-select --install
        _JobsPrint_Red "请按照提示进行安装，安装完成后再次运行此脚本。"
        return 0
    fi
    _JobsPrint_Red "🍺🍺🍺 Xcode 和 Xcode Command Line Tools 均已安装。"
}
# 检查并安装/更新 fzf
check_and_update_fzf() {
    if ! command -v fzf &> /dev/null; then
        _JobsPrint_Red "fzf 没有安装，正在安装到最新版本"
        brew install fzf
    else
        _JobsPrint_Red "fzf 已被安装，正在检查更新..."
        brew upgrade fzf
        outdated_packages=$(brew outdated fzf)
        if [ -n "$outdated_packages" ]; then
            _JobsPrint_Red "升级 fzf..."
            brew upgrade fzf
        else
            _JobsPrint_Green "fzf 已经是最新版本"
        fi
    fi
}
# 安装 Homebrew
install_homebrew() {
    local choice
    choice=$(printf "1. 自定义脚本安装（可能不受官方支持）\n2. 官方脚本安装（推荐）" | fzf --prompt "请选择安装方式：")
    case $choice in
    "1. 自定义脚本安装（可能不受官方支持）")
        _JobsPrint_Red "正在使用自定义脚本安装 Homebrew..."
        open https://gitee.com/ineo6/homebrew-install/
        /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
        ;;
    "2. 官方脚本安装（推荐）")
        _JobsPrint_Red "正在使用官方脚本安装 Homebrew..."
        open https://brew.sh/
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新选择。"
        install_homebrew
        ;;
    esac
}
# 检查并安装 Homebrew
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        _JobsPrint_Red "brew 未安装，开始安装..."
        install_homebrew
        return 1
    else
        _JobsPrint_Red "Homebrew 已经安装，跳过安装步骤。"
        _JobsPrint_Red "检查更新 Homebrew..."
        brew update
        _JobsPrint_Red "升级 Homebrew 和由 Homebrew 管理的程序包..."
        brew upgrade
        _JobsPrint_Green "正在执行 Homebrew 清理工作..."

        if [ -d "/usr/local/Cellar/" ]; then
            sudo chown -R $(whoami) /usr/local/Cellar/
        fi
        if [ -d "$(brew --prefix)" ]; then
            sudo chown -R $(whoami) "$(brew --prefix)"/*
        fi
        brew cleanup
        _JobsPrint_Green "🍺🍺🍺完成更新和清理 Homebrew"
        brew doctor
        brew -v
        return 0
    fi
}
# 检查并安装 zsh
check_and_install_zsh() {
    if command -v zsh >/dev/null 2>&1; then
        _JobsPrint_Red "zsh 已经安装，不需要执行任何操作。"
    else
        _JobsPrint_Red "zsh 未安装，正在通过 Homebrew 安装 zsh..."
        check_homebrew
        brew install zsh
    fi
}
# 定义获取脚本目录的方法
get_script_dir() {
    script_path="${(%):-%x}"
    script_dir=$(cd "$(dirname "$script_path")"; pwd)
    _JobsPrint_Red "当前脚本的执行目录：$script_dir"
}
# 定义提取文件名的方法
extract_filename() {
    local filepath=$1
    local type=$2
    local filename=$(basename "$filepath")
    
    if [[ "$type" == "full" ]]; then
        echo "$filename"
    elif [[ "$type" == "no_ext" ]]; then
        echo "${filename%.*}"
    else
        echo "Invalid type. Use 'full' for full filename or 'no_ext' for filename without extension."
    fi
}
# 获取用户选择或确认项目名称
get_project_names() {
    _JobsPrint_Red "查找 .xcodeproj 文件..."
    xcodeproj_files=($(find "$script_dir" -maxdepth 1 -name "*.xcodeproj"))

    if [[ ${#xcodeproj_files[@]} -eq 0 ]]; then
        _JobsPrint_Red "错误：当前目录下没有找到任何 .xcodeproj 文件"
        exit 1
    elif [[ ${#xcodeproj_files[@]} -eq 1 ]]; then
        default_old_project_name=$(extract_filename "$xcodeproj_files" "no_ext")
        _JobsPrint_Green "找到唯一的 .xcodeproj 文件：${default_old_project_name}.xcodeproj"
    else
        _JobsPrint_Green "找到多个 .xcodeproj 文件，请选择一个："
        selected_project=$(printf "%s\n" "${xcodeproj_files[@]}" | fzf --prompt "请选择旧项目名称：")
        default_old_project_name=$(basename "$selected_project" .xcodeproj)
    fi

    read "new_project_name?请输入新工程名（按回车使用默认值: $NEW_PROJECT_NAME）："
    new_project_name=${new_project_name:-$NEW_PROJECT_NAME}
}
# 删除 Pods 目录及其内容
delete_pods() {
    _JobsPrint_Red "删除 Pods 目录及其内容..."
    if [[ -d "$script_dir/Pods" ]]; then
        rm -rf "$script_dir/Pods"
        _JobsPrint_Green "已删除 Pods 目录"
    else
        _JobsPrint_Red "Pods 目录不存在"
    fi
}
# 删除 Podfile.lock 文件
delete_podfile_lock() {
    _JobsPrint_Red "删除 Podfile.lock 文件..."
    if [[ -f "$script_dir/Podfile.lock" ]]; then
        rm "$script_dir/Podfile.lock"
        _JobsPrint_Green "已删除 Podfile.lock 文件"
    else
        _JobsPrint_Red "Podfile.lock 文件不存在"
    fi
}
# 删除 .xcworkspace 文件
delete_xcworkspace() {
    _JobsPrint_Red "删除 .xcworkspace 文件..."
    if [[ -d "$script_dir/${default_old_project_name}.xcworkspace" ]]; then
        rm -rf "$script_dir/${default_old_project_name}.xcworkspace"
        _JobsPrint_Green "已删除 ${default_old_project_name}.xcworkspace 文件"
    else
        _JobsPrint_Red "${default_old_project_name}.xcworkspace 文件不存在"
    fi
}
# 替换项目目录和文件名中的旧工程名
replace_project_content() {
    _JobsPrint_Red "替换项目目录和文件名中的旧工程名..."

    process_file "$script_dir" \
        "${NEW_PROJECT_NAME}Tests/${NEW_PROJECT_NAME}Tests.m" \
        "$default_old_project_name" \
        "$NEW_PROJECT_NAME"

    process_file "$script_dir" \
        "${NEW_PROJECT_NAME}UITests/${NEW_PROJECT_NAME}UITests.m" \
        "$default_old_project_name" \
        "$NEW_PROJECT_NAME"

    process_file "$script_dir" \
        "${NEW_PROJECT_NAME}UITests/${NEW_PROJECT_NAME}UITestsLaunchTests.m" \
        "$default_old_project_name" \
        "$NEW_PROJECT_NAME"

    _JobsPrint_Green "项目目录和文件名中的旧工程名替换完成"
}
# 替换 Podfile 文件中的旧工程名
replace_podfile() {
    _JobsPrint_Red "替换 Podfile 文件中的旧工程名..."
    if [[ -f "$script_dir/Podfile" ]]; then
        search_and_replace "$script_dir/Podfile" "$default_old_project_name" "$NEW_PROJECT_NAME"
        search_and_replace "$script_dir/Podfile" "${default_old_project_name}Tests" "${NEW_PROJECT_NAME}Tests"
        search_and_replace "$script_dir/Podfile" "${default_old_project_name}UITests" "${NEW_PROJECT_NAME}UITests"
        _JobsPrint_Green "Podfile 文件中的旧工程名替换完成"
    else
        _JobsPrint_Red "Podfile 文件不存在"
    fi
}
# 重命名文件
rename_file() {
    local old_path="$1"
    local new_path="$2"
    _JobsPrint_Green "重命名前检查文件是否存在：$old_path"
    
    # 将路径进行编码转换
#    old_path_encoded=$(iconv -f utf-8 -t utf-8-mac <<< "$old_path")
#    new_path_encoded=$(iconv -f utf-8 -t utf-8-mac <<< "$new_path")
    
#    if [[ -f "$old_path_encoded" ]]; then
#        mv "$old_path_encoded" "$new_path_encoded"
#        _JobsPrint_Green "文件已重命名：$old_path -> $new_path"
#    else
#        _JobsPrint_Red "文件未找到：$old_path"
#    fi

    if [[ -f "$old_path" ]]; then
        mv "$old_path" "$new_path"
        _JobsPrint_Green "文件已重命名：$old_path -> $new_path"
    else
        _JobsPrint_Red "文件未找到：$old_path"
    fi
}
# 重命名文件夹
rename_folder() {
    local old_path="$1"
    local new_path="$2"
    _JobsPrint_Green "重命名前检查文件夹是否存在：$old_path"
    if [[ -d "$old_path" ]]; then
        mv "$old_path" "$new_path"
        _JobsPrint_Green "文件夹已重命名：$old_path -> $new_path"
    else
        _JobsPrint_Red "文件夹未找到：$old_path"
    fi
}
# 替换项目目录和文件名中的旧工程名
replace_project_names() {
    _JobsPrint_Red "替换项目目录和文件名中的旧工程名..."
    rename_folder "$script_dir/${default_old_project_name}Tests" \
                  "$script_dir/${NEW_PROJECT_NAME}Tests"
    rename_file "$script_dir/${NEW_PROJECT_NAME}Tests/${default_old_project_name}Tests.m" \
                "$script_dir/${NEW_PROJECT_NAME}Tests/${NEW_PROJECT_NAME}Tests.m"
    rename_folder "$script_dir/${default_old_project_name}UITests" \
                  "$script_dir/${NEW_PROJECT_NAME}UITests"
    rename_file "$script_dir/${NEW_PROJECT_NAME}UITests/${default_old_project_name}UITests.m" \
                "$script_dir/${NEW_PROJECT_NAME}UITests/${NEW_PROJECT_NAME}UITests.m"
    rename_file "$script_dir/${NEW_PROJECT_NAME}UITests/${default_old_project_name}UITestsLaunchTests.m" \
                "$script_dir/${NEW_PROJECT_NAME}UITests/${NEW_PROJECT_NAME}UITestsLaunchTests.m"
    rename_folder "$script_dir/${default_old_project_name}" \
                  "$script_dir/${NEW_PROJECT_NAME}"
    rename_file "$script_dir/${default_old_project_name}.xcodeproj" \
                "$script_dir/${NEW_PROJECT_NAME}.xcodeproj"
    _JobsPrint_Green "项目目录和文件名中的旧工程名替换完成"
}
# 处理 *.xcodeproj.project.pbxproj
replace_pbxproj() {
    _JobsPrint_Red "替换 project.pbxproj 文件中的旧工程名..."
    local project_file_path="$script_dir/${default_old_project_name}.xcodeproj/project.pbxproj"
    search_and_replace "$project_file_path" "$default_old_project_name" "$NEW_PROJECT_NAME"
    _JobsPrint_Green "project.pbxproj 文件中的旧工程名替换完成"
}
# 替换 Info.plist 文件中的旧工程名
replace_infoplist() {
    _JobsPrint_Red "替换 Info.plist 文件中的旧工程名..."
    find "$script_dir" -name "Info.plist" -exec sed -i '' "s/$default_old_project_name/$new_project_name/g" {} +
    _JobsPrint_Red "Info.plist 文件中的旧工程名替换完成"
}
# 替换 .xcscheme 文件中的旧工程名
replace_xcscheme() {
    _JobsPrint_Red "替换 .xcscheme 文件中的旧工程名..."
    find "$script_dir" -name "*.xcscheme" -exec sed -i '' "s/$default_old_project_name/$new_project_name/g" {} +
    _JobsPrint_Green ".xcscheme 文件中的旧工程名替换完成"
}
# 处理符号链接（如果有）
process_symlinks() {
    _JobsPrint_Red "处理符号链接（如果有）..."
    find "$script_dir" -type l -name "*$default_old_project_name*" | while read -r symlink; do
        target=$(readlink "$symlink")
        new_target=${target//$default_old_project_name/$new_project_name}
        ln -sf "$new_target" "$symlink"
    done
    _JobsPrint_Green "符号链接处理完成"
}
# 重命名 .xcodeproj 文件
rename_xcodeproj() {
    _JobsPrint_Red "重命名 .xcodeproj 文件..."
    if [[ -d "$script_dir/${default_old_project_name}.xcodeproj" ]]; then
        mv "$script_dir/${default_old_project_name}.xcodeproj" "$script_dir/${new_project_name}.xcodeproj"
        _JobsPrint_Green "已重命名 .xcodeproj 文件"
    else
        _JobsPrint_Red ".xcodeproj 文件不存在"
    fi
}
# 其他的一些自定义的，需要手动配置的
others() {
    ## 数据库
    rename_file "$script_dir/$NEW_PROJECT_NAME/Others/系统创建/${default_old_project_name}.xcdatamodeld" \
                "$script_dir/$NEW_PROJECT_NAME/Others/系统创建/${NEW_PROJECT_NAME}.xcdatamodeld"
    ## pch文件
    rename_file "$script_dir/${NEW_PROJECT_NAME}/${default_old_project_name}PrefixHeader.pch" \
                "$script_dir/${NEW_PROJECT_NAME}/${NEW_PROJECT_NAME}PrefixHeader.pch"
}
# 重新安装 CocoaPods 依赖
reinstall_pods() {
    _JobsPrint_Red "重新安装 CocoaPods 依赖..."
    (cd "$script_dir" && pod install)
    _JobsPrint_Green "CocoaPods 依赖安装完成"
}
# 主流程
main() {
    jobs_logo # 版权所有
    self_intro # 显示自诉信息并等待用户回车
    prepare_environment # 检查并准备环境
    get_script_dir # 获取脚本所在目录
    get_project_names # 获取用户选择或确认项目名称
    
    delete_pods # 删除 Pods 目录及其内容
    delete_podfile_lock # 删除 Podfile.lock 文件
    delete_xcworkspace # 删除 .xcworkspace 文件
    
    replace_project_names # 处理文件夹名：JobsOCBaseConfigTests、JobsOCBaseConfigUITests、JobsOCBaseConfig
    replace_project_content # 处理文件内容：JobsOCBaseConfigTests、JobsOCBaseConfigUITests、JobsOCBaseConfig
    
    replace_podfile # 替换 Podfile 文件中的旧工程名
    
    replace_pbxproj # 处理文件内容 *.xcodeproj.project.pbxproj
    rename_xcodeproj # 处理 *.xcodeproj 文件

    replace_infoplist # 处理文件内容 Info.plist
    replace_xcscheme # 替换 .xcscheme 文件中的旧工程名
    process_symlinks # 处理符号链接（如果有）

    others # 其他的一些自定义的，需要手动配置的
    reinstall_pods # 重新安装 CocoaPods 依赖

    _JobsPrint_Green "项目名称已成功从 $default_old_project_name 修改为 $new_project_name，并重新安装了 CocoaPods 依赖"
}
# 调用主函数
main
