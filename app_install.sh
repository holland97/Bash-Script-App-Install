#!/usr/bin/env bash
set -e

# Function to check whether applications are installed
check_firefox_installed () {
    if [ -d "/Applications/Firefox.app" ]
    then
        echo "Firefox is installed"
        echo "----------------------"
        return 0
    else
        echo "Firefox isn't installed"
        echo "----------------------"
        return 1
    fi
}

check_discord_installed () {
    if [ -d "/Applications/Discord.app" ]
    then
        echo "Discord is installed"
        echo "----------------------"
        return 0
    else
        echo "Discord isn't installed"
        echo "----------------------"
        return 1
    fi
}

firefox_install () {
    echo "Installing Firefox..."

    # Download Firefox dmg file
    echo "Downloading Firefox..."
    curl -sL -o /tmp/firefox.dmg "https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US"

    # Mount the dmg file
    echo "Mounting Firefox image..."
    hdiutil attach /tmp/firefox.dmg -nobrowse -quiet

    # Copy Firefox to Applications/
    echo "Copying Firefox to Applications..."
    cp -R "/Volumes/Firefox/Firefox.app" /Applications/

    # Unmount the dmg file
    echo "Unmounting Firefox image"
    hdiutil detach "/Volumes/Firefox" -quiet

    echo "Firefox installation complete..."
    echo "----------------------------------"
}

discord_install () {
    echo "Installing Discord..."

    # Download Discord dmg file
    echo "Downloading Discord imagine..."
    curl -sL -o /tmp/discord.dmg "https://discord.com/api/download?platform=osx"

    # Mount the dmg file
    echo "Mounting Discord imagine..."
    hdiutil attach /tmp/discord.dmg -nobrowse -quiet

    # Copy Discord to Applications/
    echo "Copying Discord to Applications"
    cp -R "/Volumes/Discord/Discord.app" /Applications/

    # Unmount the dmg file
    echo "Unmounting Discord imagine"
    hdiutil detach "/Volumes/Discord" -quiet

    echo "Discord installation complete..."
}

if ! check_firefox_installed
then
    firefox_install
fi

if ! check_discord_installed
then
    discord_install
fi


