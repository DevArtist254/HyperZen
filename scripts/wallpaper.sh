#!/bin/bash

# exec rm -rf "~/.config/*.png"

# Define the folder containing the images
IMAGE_FOLDER="/home/devartist/.config/wallpaper"

# Check if the image folder exists
if [ ! -d "$IMAGE_FOLDER" ]; then
    echo "Error: image folder not found."
    exit 1
fi

# Get all image files in the folder
image_files=("$IMAGE_FOLDER"/*)

# Check if there are any image files in the folder
if [ ${#image_files[@]} -eq 0 ]; then 
    echo "Error: no image file found."
    exit 1
fi

# Select a random image
random_index=$((RANDOM % ${#image_files[@]}))
random_image=${image_files[$random_index]}

# Set input and output file names
input_image="$random_image"

# Create a tmp file for my system to use
touch ~/.config/$random_image

# Apply pywal colors
echo "Theme configuration saved to ~/.config/theme.conf"# Apply pywal colors
echo "Applying pywal theme..."
wal -q -i "$random_image"

PYWAL_COLORS="$HOME/.cache/wal/colors.json"

echo "Applying theme to Hyprland..."

# Read colors from wal's JSON output
BACKGROUND=$(jq -r '.special.background | sub("#";"")' "$PYWAL_COLORS")
FOREGROUND=$(jq -r '.special.foreground | sub("#";"")' "$PYWAL_COLORS")
COLOR1=$(jq -r '.colors.color1 | sub("#";"")' "$PYWAL_COLORS")
COLOR2=$(jq -r '.colors.color2 | sub("#";"")' "$PYWAL_COLORS")
COLOR3=$(jq -r '.colors.color3 | sub("#";"")' "$PYWAL_COLORS")
COLOR4=$(jq -r '.colors.color4 | sub("#";"")' "$PYWAL_COLORS")
COLOR5=$(jq -r '.colors.color5 | sub("#";"")' "$PYWAL_COLORS")
COLOR6=$(jq -r '.colors.color6 | sub("#";"")' "$PYWAL_COLORS")

# Generate the config file
cat > ~/.config/hypr/theme.conf <<EOF
\$background = rgb($BACKGROUND)
\$foreground = rgb($FOREGROUND)
\$color0 = rgb($COLOR0)
\$color1 = rgb($COLOR1)
EOF

hyprctl reload

# Generate the Starship config dynamically
STARSHIP_CONFIG="$HOME/.config/starship.toml"
cat > "$STARSHIP_CONFIG" <<EOF
format = """
[](#$BACKGROUND)\
\$python\
\$username\
[](bg:#$COLOR1 fg:#$BACKGROUND)\
\$directory\
[](fg:#$COLOR1 bg:#$COLOR2)\
\$git_branch\
\$git_status\
[](fg:#$COLOR2 bg:#$COLOR3)\
\$c\
\$elixir\
\$elm\
\$golang\
\$haskell\
\$java\
\$julia\
\$nodejs\
\$nim\
\$rust\
[](fg:#$COLOR3 bg:#$COLOR4)\
\$docker_context\
[](fg:#$COLOR4 bg:#$COLOR5)\
\$time\
[ ](fg:#$COLOR5)\
"""
command_timeout = 5000

[username]
show_always = true
style_user = "bg:#$BACKGROUND"
style_root = "bg:#$BACKGROUND"
format = '[\$user ](\$style)'

[directory]
style = "bg:#$COLOR1"
format = "[ \$path ](\$style)"
truncation_length = 3
truncation_symbol = "…/"

[c]
symbol = " "
style = "bg:#$COLOR3"
format = '[ \$symbol (\$version) ](\$style)'

[docker_context]
symbol = " "
style = "bg:#$COLOR4"
format = '[ \$symbol \$context ](\$style) \$path'

[git_branch]
symbol = ""
style = "bg:#$COLOR2"
format = '[ \$symbol \$branch ](\$style)'

[git_status]
style = "bg:#$COLOR2"
format = '[\$all_status\$ahead_behind ](\$style)'

[time]
disabled = false
time_format = "%R"
style = "bg:#$COLOR5"
format = '[ \$time ](\$style)'
EOF

# Set the wallpaper using swaybg
exec swaybg -i "$random_image" -o "DP-1"

notify-send "Theme" "Theme applied successfully!"
