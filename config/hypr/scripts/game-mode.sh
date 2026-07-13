#!/usr/bin/env bash
# Alterna o monitor principal (DP-5) entre 4K (desktop) e Full HD (jogos).
# Uso: game-mode.sh [on|off|toggle]   (padrão: toggle)

MONITOR="DP-5"
DESKTOP_MODE="3840x2160@100"
DESKTOP_SCALE="1.5"
GAME_MODE="1920x1080@100"
GAME_SCALE="1"
POSITION="1080x0"

set_mode() {
    hyprctl eval "hl.monitor({ output = \"${MONITOR}\", mode = \"${1}\", position = \"${POSITION}\", scale = \"${2}\" })"
}

current_width() {
    hyprctl -j monitors | jq -r ".[] | select(.name == \"${MONITOR}\") | .width"
}

action="${1:-toggle}"

if [[ "$action" == "toggle" ]]; then
    if [[ "$(current_width)" -le 1920 ]]; then
        action="off"
    else
        action="on"
    fi
fi

case "$action" in
    on)
        set_mode "$GAME_MODE" "$GAME_SCALE"
        notify-send -a "Game Mode" "🎮 Modo jogo ativado" "${MONITOR}: ${GAME_MODE}, escala ${GAME_SCALE}"
        ;;
    off)
        set_mode "$DESKTOP_MODE" "$DESKTOP_SCALE"
        notify-send -a "Game Mode" "🖥️ Modo desktop restaurado" "${MONITOR}: ${DESKTOP_MODE}, escala ${DESKTOP_SCALE}"
        ;;
    *)
        echo "Uso: $(basename "$0") [on|off|toggle]" >&2
        exit 1
        ;;
esac
