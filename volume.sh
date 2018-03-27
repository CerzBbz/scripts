#/bin/sh
if [ $1 == 'up' ]; then
    amixer -D pulse sset Master 5%+
elif [ $1 == 'down' ]; then
    amixer -D pulse sset Master 5%-
elif [[ $1 =~ ^[0-9]+$ ]]; then
    amixer -D pulse sset Master $1%
else
    echo "Unknown parameters"
fi
