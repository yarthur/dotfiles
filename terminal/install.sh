infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti

tic ~/.dotfiles/terminal/xterm-256color-italic.terminfo
