#!/bin/bash

# SIP disabled
yabai -m space --focus $(yabai -m query --displays --display | jq --arg SPACE $(($1 - 1)) '.spaces[$SPACE|tonumber]')

# SIP enabled
# skhd --key "ctrl - $(yabai -m query --displays --display | jq --arg SPACE $(($1 - 1)) '.spaces[$SPACE|tonumber]')"
