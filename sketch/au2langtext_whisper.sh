#!/usr/bin/env bash

# pip install -U openai-whisper
# pip3 install -U openai-whisper
# whisper /path/to/your/german_news.mp3 --language German
# whisper /path/to/your/german_news.mp3 --language German --model medium
#
# By default, Whisper will generate
# several output files in the same
# directory as your audio-file, which
# is a very useful feature. These
# include:
# 
# - .txt: A plain text file with the
#   transcription. This is likely
#   what you're looking for.
# - .vtt: A WebVTT file, which
#   includes timestamps for each
#   transcribed segment.
# - .srt: An SRT subtitle file, also
#   with timestamps.
# - .json: A JSON file with a
#   detailed breakdown of the
#   transcription, including
#   confidence scores and segment
#   information.
# 
# The .txt file is great for a quick
# read, while the .srt or .vtt files
# are excellent if you want to follow
# along with the audio and see the
# timestamps.
# 
# For a Linux enthusiast like
# yourself, Whisper's command-line
# interface makes it a powerful and
# flexible tool for your
# language-learning project. You can
# even write simple bash scripts to
# automate the process for multiple
# audio files.

