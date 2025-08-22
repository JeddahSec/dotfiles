#!/bin/bash

# Get the pywal colors
source "$HOME/.cache/wal/colors.sh"

# Create or update the dunst config file
cat > "$HOME/.config/dunst/dunstrc" <<EOF
[global]
    font = Monospace 14
    allow_markup = yes
    format = "<b>%s</b>\\n%b"
    sort = yes
    indicate_hidden = yes
    alignment = left
    bounce_freq = 0
    show_age_threshold = 60
    word_wrap = yes
    ignore_newline = no
    geometry = "300x5-30+50"
    transparency = 0
    idle_threshold = 120
    monitor = 0
    follow = mouse
    sticky_history = yes
    history_length = 20
    show_indicators = yes
    line_height = 0
    separator_height = 2
    padding = 8
    horizontal_padding = 8
    separator_color = frame
    startup_notification = false

    frame_width = 3
    frame_color = "$color15"

[urgency_low]
    background = "$color0"
    foreground = "$color7"
    timeout = 4

[urgency_normal]
    background = "$color0"
    foreground = "$color7"
    timeout = 6

[urgency_critical]
    background = "$color0"
    foreground = "$color7"
    timeout = 0
EOF

# Restart dunst to apply changes
pkill dunst
dunst &
