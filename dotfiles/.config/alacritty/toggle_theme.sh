#!/bin/bash

CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
THEME_LINE="import = [\"~/.config/alacritty/themes/themes/github_light.toml\"]"

# Check if the theme import line exists (not commented)
if grep -q "^import = " "$CONFIG_FILE"; then
    # Comment out the import line
    sed -i 's/^import = /# import = /' "$CONFIG_FILE"
    echo "Theme disabled"
else
    # Check if there's a commented import line
    if grep -q "^# import = " "$CONFIG_FILE"; then
        # Uncomment the import line
        sed -i 's/^# import = /import = /' "$CONFIG_FILE"
        echo "Theme enabled"
    else
        # Add the import line after the [general] section
        sed -i "/^\[general\]$/a $THEME_LINE" "$CONFIG_FILE"
        echo "Theme enabled"
    fi
fi