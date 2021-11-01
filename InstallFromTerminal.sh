#!/bin/sh
# chmod a+x InstallFromTerminal.sh

function install() {
  # 1st arg, command value
  cmd=$1
  shift
  # 2nd arg, array
  arr=("$@")
  for i in "${arr[@]}";
  do
    $cmd "$i"
  done
}

# install brew dependencies
xcode-select --install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brewArr=(
  "zsh"
  "node"
  "yarn"
  "docker"
  "docker-clean"
  "docker-completion"
)

install "brew install" "${brewArr[@]}"

# brew cask
# https://caskroom.github.io/search
brewCaskArr=(
  "iterm2"
  "google-chrome"
  "docker"
  "postman"
  "spotify"
  "grammarly"
  "spectacle"
  "visual-studio-code"
)

install "brew install --cask" "${brewCaskArr[@]}"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
