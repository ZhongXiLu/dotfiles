#!/bin/bash

free_space=$(yabai -m query --spaces | current_space=$(yabai -m query --spaces --space | jq '.index') jq -re 'map(select(."windows" == [] and ."index" > (env.current_space|tonumber)))[0].index')
yabai -m window --space $free_space
skhd --key "ctrl - $free_space"
