#!/bin/env bash

MAIN_KB_CAPS=$(hyprctl devices | grep -B 6 "main: yes" | grep "capsLock" | head -1 | awk '{print $2}')
MAIN_KB_NUM=$(hyprctl devices | grep -B 6 "main: yes" | grep "numLock" | head -1 | awk '{print $2}')

if [ "$MAIN_KB_CAPS" = "yes" ] && [ "$MAIN_KB_NUM" = "yes" ]; then
    echo "CapsLock active • NumLock active"
elif [ "$MAIN_KB_CAPS" = "yes" ]; then
    echo "CapsLock active"
else
    echo ""
fi
