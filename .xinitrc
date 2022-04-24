sh ~/.fehbg &
xcompmgr &
dwmstatus 2>&1 >/dev/null &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
exec dwm
