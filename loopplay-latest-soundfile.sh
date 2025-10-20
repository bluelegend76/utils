#!/usr/bin/env bash

# - Identify last edited/created file
#   in the directory
# - Send this name to the
#   'Open With'-script

trans \
  -s en \
  -t en \
  -o '~/.vim/transl/transl.mp3' \
  "your word" \
&& termux-intent-send \
  --action android.intent.action.VIEW \
  --uri file:///sdcard/Download/translation.mp3 \
  --package com.toth.loopplayer

