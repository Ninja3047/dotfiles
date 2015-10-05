source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen bundle git
antigen bundle pip
antigen bundle rsync
antigen bundle python
antigen bundle virtualenvwrapper
antigen bundle node
antigen bundle npm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle history

antigen-use oh-my-zsh
antigen-theme gentoo
antigen-apply

export PATH=$HOME/bin:$HOME/.scripts:/usr/local/bin:/opt/android-sdk/platform-tools:/usr/bin/vendor_perl:$PATH

alias msmtp="msmtp -C ~/.config/msmtp/config"
alias mutt="mutt -F ~/.config/mutt/config"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export EDITOR=nvim

export PROJECT_HOME=~/Documents/Codes

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Virtual Env Wrapper
source /usr/bin/virtualenvwrapper.sh
