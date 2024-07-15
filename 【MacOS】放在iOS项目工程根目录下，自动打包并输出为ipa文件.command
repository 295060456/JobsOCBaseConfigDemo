#!/bin/zsh

print_color() {
    local COLOR="$1"
    local TEXT="$2"
    local RESET="\033[0m"
    echo "${COLOR}${TEXT}${RESET}"
}

_JobsPrint_Red() {
    print_color "\033[1;31m" "$1"
}

_JobsPrint_Green() {
    print_color "\033[1;32m" "$1"
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
    _JobsPrint_Green "【MacOS】放在iOS项目工程根目录下，自动打包并输出为ipa文件.）"
    _JobsPrint_Red "按回车键继续..."
    read
}

setup_xcode() {
    local XCODE_DIR="/Applications/Xcode.app"
    if [ ! -d "$XCODE_DIR" ]; then
        _JobsPrint_Red "Xcode.app not found in Applications."
        exit 1
    fi
    _JobsPrint_Green "Found Xcode.app at: $XCODE_DIR"
}

install_package_application() {
    local PACKAGE_DIR="$1/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin"
    local PACKAGE_NAME="PackageApplication"
    local PACKAGE_ZIP="${PACKAGE_NAME}.zip"
    local PACKAGE_PATH="${PACKAGE_DIR}/${PACKAGE_NAME}"

    if [ ! -f "$PACKAGE_PATH" ]; then
        curl -# -OL "https://github.com/JackSteven/PackageApplication/raw/master/${PACKAGE_ZIP}" && unzip -o "$PACKAGE_ZIP" && mv "$PACKAGE_NAME" "$PACKAGE_DIR" && rm "$PACKAGE_ZIP"
        if [ $? -ne 0 ]; then
            _JobsPrint_Red "Failed to install $PACKAGE_NAME."
            exit 2
        fi
        sudo xcode-select -switch "$1/Contents/Developer/"
        chmod +x "$PACKAGE_PATH"
        _JobsPrint_Green "$PACKAGE_NAME installed successfully!"
    fi
}

build_app() {
    local build_command="xcodebuild"
    local workspace=$(find . -name "*.xcworkspace" -print -quit)
    local project=$(find . -name "*.xcodeproj" -print -quit)

    if [[ -n "$workspace" ]]; then
        scheme="${workspace%%.*}"
        build_command+=" -workspace $workspace -scheme $scheme"
    elif [[ -n "$project" ]]; then
        scheme="${project%%.*}"
        build_command+=" -project $project -scheme $scheme"
    else
        _JobsPrint_Red "No workspace or project found."
        exit 3
    fi

    local sdk=$(xcodebuild -showBuildSettings | awk '/SDK_NAME =/ {print $3}')
    build_command+=" -configuration Release -sdk $sdk"
    echo "Executing build command: $build_command"
    if ! $build_command; then
        _JobsPrint_Red "Build failed, please check!"
        exit 4
    fi
}

main() {
    _JobsPrint_Green "正在开始编译打包 ipa"
    jobs_logo
    self_intro
    setup_xcode
    install_package_application "/Applications/Xcode.app"
    build_app
    _JobsPrint_Green "编译打包 ipa 成功完成！！！"
}

main
