# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function a {
    local url="https://amazon.co.jp/s?k="
    url+=${@}
    open $url
}
alias ah='apt search'
function aw {
    local url="https://duckduckgo.com/?q=arch+wiki+"
    url+=${@}
    url+="&t=brave&ia=web"
    open $url
}
alias b='open http://mubou.seesaa.net/'
alias bi='brew install'
alias bs='brew search'
alias c='open https://gemini.google.com'
alias cac='open https://docs.google.com/spreadsheets/d/1ECwWvDWYEH4iZL_Hy9V2Xqy0NOVmpsAP/'
alias cdd='cd ~/downloads'
alias cg='open https://chatgpt.com'
alias cl='sudo rm -rf ~/Library/Caches/*; sudo rm /var/log/asl/*.asl; brew autoremove; brew cleanup; find . -name .DS_Store -delete; find . -name .Rhistory -delete; find . -name .ipynb_checkpoints -delete; rm /Library/Logs/DiagnosticReports/Sleep\ Wake\ Failure*'
alias co='open https://consensus.app/search/'
alias cr='cp -r'
alias d='open https://drive.google.com/drive/recent'
alias de='open https://deepl.com'
alias di='open https://discord.com/app'
alias dh='df -h'
function f {
    local url="https://duckduckgo.com/?q=freebsd+wiki+"
    url+=${@}
    url+="&t=brave&ia=web"
    open $url
}
alias g='open https://gakujo.shizuoka.ac.jp/portal/'
alias gc='open https://calendar.google.com'
alias gi='open "https://github.com/mxvish?tab=repositories"'
alias gm='open https://google.com/maps'
alias gu='open https://www.gu-global.com/jp/ja/'
function gw {
    local url="https://duckduckgo.com/?q=gentoo+wiki+"
    url+=${@}
    url+="&t=brave&ia=web"
    open $url
}
alias h='open https://hands.net'
alias hl='open "https://www.lib-city-hamamatsu.jp/licsxp-opac/WOpacEsSchCmpdDispAction.do?moveToGamenId=esschcmpd"'
function i {
    local url="https://duckduckgo.com/?q=wiki+"
    url+=${@}
    open $url
}
function ii {
    local url="https://duckduckgo.com/?q=wiki+"
    url+=${@}
    open $url
    url+="+pixiv"
    open $url
    url=`echo "$url" | sed 's/pixiv/dic.nicovideo/'`
    open $url
}
alias k='open https://keybr.com'
alias ke='open https://keep.google.com'
alias kn='open "https://www.kyorindo-netsuper.jp"'
alias l='ls -a ~/downloads'
alias le='less'
alias li='open -a /Applications/LINE.app'
alias lk='open https://www.linkedin.com/in/koshima/'
#alias m='open https://mail.google.com/mail/u/0/'
alias m='aerc'
alias mj='open https://www.muji.com/jp/ja/store'
alias mk='mkdir'
alias mp='mpg321 -qg 10'
#alias mp='mpg321 -qg 3'
alias mu='open "https://entry11.bk.mufg.jp/ibg/dfw/APLIN/loginib/login?_TRANID=AA000_001&link_id=direct_zandaka_login"'
alias n='open https://amplenote.com/notes'
alias o='open -a /Applications/Safari.app "https://onedrive.live.com/?gologin=1"'
alias ou='open https://outlook.office.com/mail'
alias op='v ~/.bashrc;source ~/.bashrc'
alias p='python3'
alias pe='open https://www.perplexity.ai/'
alias po='poweroff'
alias pr='open https://projecteuler.net/archives'
function pu {
    local url="https://pubmed.ncbi.nlm.nih.gov/?term="
    url+=${@}
    open $url
}
alias r='ranger'
alias rb='open "https://fes.rakuten-bank.co.jp/MS/main/RbS?CurrentPageID=START&&COMMAND=LOGIN"'

alias re='open -a /System/Applications/Reminders.app'
alias rr='rm -rf'
alias rs='open "https://www.rakuten-sec.co.jp/ITS/V_ACT_Login.html"'
alias s='open https://app.slack.com/client'
function sc {
    local url="https://scholar.google.com/scholar?q="
    url+=${@}
    open $url
}
function sm {
    local url="https://sm.rakuten.co.jp/search?keyword="
    url+=${@}
    url+="&sort=1&page=1"
    open $url
}
alias sr='open https://ib.surugabank.co.jp/im/IBGate'
alias t='open https://todoist.com/app'
alias te='open https://teams.microsoft.com'
alias tv='open https://tver.jp/mypage/fav'
alias u='brew doctor; brew update; brew upgrade'
alias up='uptime'
function us {
    local url="https://opac.lib.shizuoka.ac.jp/opac/search?autoDetail=true&q="
    url+=${@}
    open $url
}
alias uv='diskutil umount force /Volumes/UNTITLED'
alias v='vim'
alias va='v ~/a;xc ~/a'
alias vb='v ~/b;xc ~/b'
alias vs='open https://docs.google.com/spreadsheets/d/1iuQ-DxULNRZp0QisqnwkH33GpLA8dkec/'
alias vpn='open https://vpn.inf.shizuoka.ac.jp/dana-na/auth/url_3/welcome.cgi'
alias vv='v ~/.vimrc'
alias w='open "https://www.accuweather.com/en/jp/hamamatsu-shi/226090/weather-forecast/226090"'
alias x='open'
alias xc='xclip -sel c <'
alias y='open "https://www.youtube.com/feed/playlists"'

PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"
PS1='\W $'

xmodmap ~/.Xmodmap
