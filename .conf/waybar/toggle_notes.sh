#!/bin/bash
TODO="$HOME/.config/waybar/to-do.txt"
SHORTCUTS="$HOME/.config/waybar/shortcuts.txt"

if ! pgrep -x eww >/dev/null 2>&1; then
    eww daemon >/dev/null 2>&1
    sleep 0.5
fi

if [ -f "$TODO" ]; then
    TODO_CONTENT="$(fold -s -w 45 "$TODO")"
else
    TODO_CONTENT=""
fi

if [ -f "$SHORTCUTS" ]; then
    SHORTCUTS_CONTENT="$(fold -s -w 45 "$SHORTCUTS")"
else
    SHORTCUTS_CONTENT=""
fi

eww update todo="$TODO_CONTENT"
eww update shortcuts="$SHORTCUTS_CONTENT"

if eww active-windows 2>/dev/null | grep -qw "notes"; then
    eww close notes
else
    eww open notes
fi
