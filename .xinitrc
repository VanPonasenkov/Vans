[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
exec xcompmgr &
exec setxkbmap -layout us,ru -variant altgr-intl, -option grp:lwin_toggle &
exec dwm
