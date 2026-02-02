#!/bin/bash

INPUT_PATH="$1"

date="$(date +%Y%m%d_%H%M%S)"

[[ -z "$INPUT_PATH" ]] && echo "path is wrong " && exit 1

[[ ! -e "$INPUT_PATH" ]] && echo "we dont have this path " && exit 1

ls $INPUT_PATH

PATH_ABS="$INPUT_PATH"

mkdir -p backup/back_log 

tar -czf "backup/back_log_$date.tar.gz" $PATH_ABS && echo " backup completed succesfully" || echo "backup faiiled"