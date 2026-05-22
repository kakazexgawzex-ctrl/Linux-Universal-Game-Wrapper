#!/usr/bin/env sh

# ===================================================
# Universal Portable Game Wrapper — Uninstaller
# ===================================================

dir="$(dirname "$(readlink -f "$0")")"
CONFIG="$dir/config.ini"

# Try to read game name from config
GAME_NAME="Game"
if [ -f "$CONFIG" ]; then
    GAME_NAME="$(sed -n '/^\[Game\]/,/^\[/p' "$CONFIG" | grep -i "^name\s*=" | head -1 | cut -d= -f2- | sed 's/^ *//;s/ *$//')"
fi
[ -z "$GAME_NAME" ] && GAME_NAME="Game"

# User environment launchers
[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config"
. "$XDG_CONFIG_HOME/user-dirs.dirs" 2>/dev/null
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_DESKTOP_DIR" ] && XDG_DESKTOP_DIR="$HOME/Desktop"

desklauncher="$XDG_DESKTOP_DIR/$GAME_NAME.desktop"
menudir="$XDG_DATA_HOME/applications"
menulauncher="$menudir/$GAME_NAME.desktop"

# Localization
if locale 2>/dev/null | grep -q 'ru_RU'; then
    title="Удаление"
    msg="Удалить"
    msg2="Удаляется"
    msg3="Готово."
    canc="Отмена."
else
    title="Uninstall"
    msg="Do you want to uninstall"
    msg2="Uninstalling"
    msg3="Done."
    canc="Canceled."
fi

red="\033[1;31m"
green="\033[1;32m"
reset="\033[0m"

if command -v zenity >/dev/null; then
    if zenity --question --title="$title $GAME_NAME" --text="$msg $GAME_NAME?" --no-wrap >/dev/null 2>&1; then
        rm -f "$desklauncher" "$menulauncher"
        cd "$dir/.." || exit
        rm -rf "$dir" | zenity --progress --title="$title $GAME_NAME" \
            --text="$msg2 $GAME_NAME..." --width=300 --pulsate --no-cancel --auto-close >/dev/null 2>&1
        zenity --info --title="$title $GAME_NAME" --text="$msg3" --no-wrap >/dev/null 2>&1
    fi
    exit
elif command -v kdialog >/dev/null; then
    if kdialog --yesno "$msg $GAME_NAME?" --title="$title $GAME_NAME" >/dev/null 2>&1; then
        rm -f "$desklauncher" "$menulauncher"
        cd "$dir/.." || exit
        rm -rf "$dir"
        kdialog --msgbox "$msg3" --title="$title $GAME_NAME" >/dev/null 2>&1
    fi
    exit
else
    clear
    printf "\n%s  $msg $GAME_NAME? (y)es/(n)o:\n\n" ""
    read -r answer
    case "$answer" in
        [yY]*)
            printf "\n%s$msg2 $GAME_NAME...\n" ""
            rm -f "$desklauncher" "$menulauncher"
            cd "$dir/.." || exit
            rm -rf "$dir"
            printf "\n%s${green}$msg3${reset}\n\n" ""
            ;;
        *)
            printf "\n%s  ${red}$canc${reset}\n\n" ""
            exit
    esac
fi
