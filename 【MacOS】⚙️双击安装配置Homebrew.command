#! /bin/sh

# 如果没有执行权限，在这个sh文件的目录下，执行chmod u+x *.sh

# 检测是否已经安装了brew
if ! command -v brew &> /dev/null
then
    echo "brew 未安装，开始安装..."
    open https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    ## Homebrew 环境变量设置
    ### 将 Homebrew 添加到终端会话的环境变量中，以便确保所有 Homebrew 安装的软件包都可以在终端中使用。
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    ### 将 Homebrew 加载到当前 Shell 会话中，以便立即生效。这意味着您现在可以使用 Homebrew 来安装、更新和删除软件包。
    eval "$(/opt/homebrew/bin/brew shellenv)"
    open /Users/$(whoami)/.zprofile

<<'COMMENT'
# Homebrew 环境变量配置，也可以这么写。保证只写入一次

grep homebrew /Users/$(whoami)/.zprofile
if [ $? -ne 0 ] ;then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
	source /Users/$(whoami)/.zprofile
fi
COMMENT

else
    echo "brew 已经安装，跳过安装步骤。"
    ## brew 升级
    brew update
    brew doctor
    brew -v
fi

echo "安装一些插件"
brew install --cask cakebrew
brew install --cask launchrocket

brew install docker
brew install carthage
brew install php
brew install mysql
brew install tomcat
brew install maven
brew install java
brew install -g node
brew install nvm
brew install docker
brew install python3
brew install openssl
brew install wget
brew install heroku
brew install git
brew install autojump
brew install Mongodb
brew install Nginx
brew install iTerm2
brew install xz
brew install pkg-config
brew install readline
brew install coreutils
brew install lrzsz
brew install clang-format
brew install git-flow
brew install Autojump
brew install caskroom/cask/brew-cask
brew install tomcat
brew install ruby
brew install curl ruby
brew install ffmpeg
brew install watchman
brew install gnupg
brew install oclint
brew install yarn # 或者 brew reinstall yarn --without-node 如果您使用 nvm 或类似的东西，您应该排除安装 Node.js 以便使用 nvm 的 Node.js 版本
brew install cask

# brew upgrade
# brew reinstall

<<'COMMENT'
卸载 brew

echo "======== 不管系统有没有安装brew 首先全部归零 ========"
echo "May have unnecessary local Core tap!This can cause problems installing up-to-date formulae."
brew untap homebrew/core

echo "执行brew垃圾清除..."
brew cleanup

echo "准备卸载Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"  

echo "准备手动清除Homebrew安装残留（可能需要输入管理员密码）"
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

# 解决 Running `brew update --preinstall`... fatal: Could not resolve HEAD to a revision
sudo rm -rf $(brew --repo homebrew/core)
echo "======== 执行完毕brew归零操作 ========"
COMMENT


