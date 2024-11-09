#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or via wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# or via fetch:
#   sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#

set -e

# Make sure important variables exist if not already defined
USER=${USER:-$(id -u -n)}
HOME="${HOME:-$(eval echo ~$USER)}"

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

setup_color() {
  FMT_RED=""
  FMT_GREEN=""
  FMT_YELLOW=""
  FMT_BLUE=""
  FMT_BOLD=""
  FMT_RESET=""

  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
}

fmt_error() {
  printf '%sError: %s%s\n' "${FMT_BOLD}${FMT_RED}" "$*" "$FMT_RESET" >&2
}

setup_git() {
  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  cd $HOME
}

clone_dotfiles() { 
    if [ ! -d "$HOME/.dotfiles" ]; then
      echo "${FMT_BLUE}Cloning .dotfiles...${FMT_RESET}"
      git clone https://github.com/dstroot/dotfiles.git .dotfiles
      echo "${FMT_GREEN}....is now installed!${FMT_RESET}"
    else
      fmt_error ".dotfiles already exists!"
    fi
}

clone_macos() { 
    if [ ! -d "$HOME/.macos" ]; then
      echo "${FMT_BLUE}Cloning .macos...${FMT_RESET}"
      git clone https://github.com/dstroot/.macos.git .macos
      echo "${FMT_GREEN}....is now installed!${FMT_RESET}"
    else
      fmt_error ".macos already exists!"
    fi
}

main() {
  setup_color
  setup_git
  clone_dotfiles
  clone_macos
}

main "$@"