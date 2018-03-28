#/bin/sh
date=`date "+%Y-%m-%d %H:%M:%S"`
if [ "$1" = "up" ]; then
    /usr/bin/amixer -D pulse sset Master 5%+
elif [ "$1" = "down" ]; then
    /usr/bin/amixer -D pulse sset Master 5%-
elif [[ "$1" =~ ^[0-9]+$ ]]; then
    /usr/bin/amixer -D pulse sset Master $1%
else
    echo "Volume Error: [$1 $date]" >> $HOME/scripts/log
fi
