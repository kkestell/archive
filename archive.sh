#!/usr/bin/env bash

OS_EXCLUDE=(
    --exclude='.DS_Store'
)

MISC_EXCLUDE=(
    --exclude='*.mp4'
)

EXCLUDE=(
    ${OS_EXCLUDE[@]}
    ${MISC_EXCLUDE[@]}
)

rsync \
    -avz \
    --compress-level=9 \
    --no-links \
    --filter='P .Trash-10*' \
    ${EXCLUDE[@]} \
    ~/nas/archive \
    ~/mnt/archive
