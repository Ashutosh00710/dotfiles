width=${2:-95%}
height=${2:-95%}
if [ "$(tmux display-message -p -F "#{session_name}")" = "scratch" ];then
    tmux detach-client
else
    tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux new -A -s scratch"
fi
