#!/usr/bin/env bash

url="http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=${LAST_FM_USER}&api_key=${LAST_FM_KEY}&format=json"
curl $url 2>/dev/null | jq '.recenttracks.track[0].artist["#text"], .recenttracks.track[0].name' -r | sed ':a;N;$!ba;s/\n/ - /g'
