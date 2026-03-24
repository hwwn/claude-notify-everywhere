#!/usr/bin/env bash
# Terminal bundle IDs, display names, and sounds
# Compatible with bash 3.2+ (macOS default)

TERMINAL_KEYS="ghostty iterm2 terminal claude warp alacritty wezterm vscode cursor"

get_bundle_id() {
  case "$1" in
    ghostty)   echo "com.mitchellh.ghostty" ;;
    iterm2)    echo "com.googlecode.iterm2" ;;
    terminal)  echo "com.apple.Terminal" ;;
    claude)    echo "com.anthropic.claudedesktop" ;;
    warp)      echo "dev.warp.Warp-Stable" ;;
    alacritty) echo "org.alacritty" ;;
    wezterm)   echo "com.github.wez.wezterm" ;;
    vscode)    echo "com.microsoft.VSCode" ;;
    cursor)    echo "com.todesktop.230313mzl4w4u92" ;;
    *)         echo "com.mitchellh.ghostty" ;;
  esac
}

get_display_name() {
  case "$1" in
    ghostty)   echo "Ghostty" ;;
    iterm2)    echo "iTerm2" ;;
    terminal)  echo "Terminal.app" ;;
    claude)    echo "Claude Desktop" ;;
    warp)      echo "Warp" ;;
    alacritty) echo "Alacritty" ;;
    wezterm)   echo "WezTerm" ;;
    vscode)    echo "VS Code" ;;
    cursor)    echo "Cursor" ;;
    *)         echo "$1" ;;
  esac
}

SOUNDS="Glass Ping Pop Hero Submarine Blow Bottle Frog Funk Purr Basso Morse Sosumi Tink"

get_sound_by_index() {
  local i=1
  for s in $SOUNDS; do
    if [ "$i" -eq "$1" ]; then
      echo "$s"
      return
    fi
    i=$((i + 1))
  done
}

count_sounds() {
  local c=0
  for _ in $SOUNDS; do c=$((c + 1)); done
  echo "$c"
}

count_terminals() {
  local c=0
  for _ in $TERMINAL_KEYS; do c=$((c + 1)); done
  echo "$c"
}

get_terminal_by_index() {
  local i=1
  for key in $TERMINAL_KEYS; do
    if [ "$i" -eq "$1" ]; then
      echo "$key"
      return
    fi
    i=$((i + 1))
  done
}
