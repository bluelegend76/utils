#!/usr/bin/env bash
# List files based on underscore-separated
# year of publication

ls | sort -r -t_ -k2 -n

