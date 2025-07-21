#!/usr/bin/env bash

url="http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=${LAST_FM_USER}&api_key=${LAST_FM_KEY}&format=json&limit=1"
song=`curl $url 2>/dev/null | jq '.recenttracks.track[0] | .artist["#text"], .name // empty' -r | sed ':a;N;$!ba;s/\n/ - /g'`
if [[ $song != null ]]; then
  echo "$song"
fi
