[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
sh ~/.fehbg &
exec xcompmgr &
exec setxkbmap -layout us,ru -variant altgr-intl, -option grp:lwin_toggle &
exec dunst &
exec dwm &
exec wal -n -R &
exec dwmblocks
