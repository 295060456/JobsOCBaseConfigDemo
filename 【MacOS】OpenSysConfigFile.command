#! /bin/zsh
open ~/.bash_profile
open ~/.bashrc
open ~/.zshrc
# 如果文件存在且非空，则执行source
[[ -s "$HOME/.bash_profile" ]] && source "$HOME/.bash_profile"
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -s "$HOME/.zshrc" ]] && source "$HOME/.zshrc"
[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

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
