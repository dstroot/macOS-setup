#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL sh -c "$(curl -fsSL https://raw.githubusercontent.com/dstroot/macos-setup/master/scripts/install.sh)")"
#
# or via wget:
#   sh -c "$(wget -qO- sh -c "$(curl -fsSL https://raw.githubusercontent.com/dstroot/macos-setup/master/scripts/install.sh)")"
#
# or via fetch:
#   sh -c "$(fetch -o - sh -c "$(curl -fsSL https://raw.githubusercontent.com/dstroot/macos-setup/master/scripts/install.sh)")"

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

# logging functions
fmt_info() {
  printf '%sInfo: %s%s\n' "${FMT_BOLD}${FMT_BLUE}" "$*" "$FMT_RESET" >&2
}
fmt_warning() {
  printf '%sWarning: %s%s\n' "${FMT_BOLD}${FMT_YELLOW}" "$*" "$FMT_RESET" >&2
}
fmt_success() {
  printf '%sSuccess: %s%s\n' "${FMT_BOLD}${FMT_GREEN}" "$*" "$FMT_RESET" >&2
}
fmt_error() {
  printf '%sError: %s%s\n' "${FMT_BOLD}${FMT_RED}" "$*" "$FMT_RESET" >&2
}


verify_git() {
  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  cd $HOME
}

verify_homebrew() {
  command_exists brew || {
    fmt_error "Homebrew is not installed"
    exit 1
  }
}

clone_repo() {
  if [ ! -d "$HOME/$1" ]; then
    fmt_info "Cloning $1..."
    git clone https://github.com/dstroot/$1.git 
    cd "$1"
    git submodule init && git submodule update
    fmt_success "$1 cloned!"
  else
    fmt_error "$1 already exists!"
  fi
}

restore_mackup() {
  if [ ! -f "$HOME"/.mackup.cfg ]; then
    fmt_info "Restoring Mackup..."
    brew install mackup
    cp "$HOME"/.dotfiles/mackup/.mackup.cfg ~/
    cp -r "$HOME"/.dotfiles/mackup/.mackup ~/
    yes Yes | mackup restore
    fmt_success "Mackup restored!"
  else
    fmt_error "Mackup already restored!"
  fi
}

install_brewfile() {
  fmt_info "Validating Brewfile..."
  if [ -f "$HOME/.Brewfile" ]; then
    # Install everything!  
    fmt_info "Installing Homebrew Apps..."
    brew bundle --file="$HOME"/.Brewfile
  else
    fmt_error "Brewfile not found!"
    exit 1
  fi
}

setup_autofs() {
    sh "$HOME"/.dotfiles/macos/autofs.sh
}

main() {
  # housekeeping
  setup_color
  verify_git
  verify_homebrew

  # clone our key repos first
  clone_repo ".dotfiles"
  clone_repo ".macos"

  # the next thing we should do is restore our .dotfiles, right?
  restore_mackup

  # next install Homebrew apps
  install_brewfile

  # setup NAS folders
  setup_autofs

  # run `dot` script as final validation/install
  sh "$HOME"/.dotfiles/bin/dot
}

main "$@"
