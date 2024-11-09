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

# Default settings
REPO=${REPO:-ohmyzsh/ohmyzsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

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
  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

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