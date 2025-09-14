#!/bin/bash

if command -v playerctl &> /dev/null; then
    if playerctl -p Feishin status &> /dev/null; then
        player="Feishin"
    elif playerctl -p plasma-browser-integration status &> /dev/null; then
        player="plasma-browser-integration"
    else
        player=""
    fi

    if [[ -n "$player" ]]; then
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        title=$(playerctl -p "$player" metadata title 2>/dev/null)

        if [[ -n "$artist" && -n "$title" ]]; then
            echo "♪ $artist - $title"
        elif [[ -n "$title" ]]; then
            echo "♪ $title"
        else
            echo "♪ Music Playing"
        fi
    else
        echo ""
    fi
else
    echo ""
fi
