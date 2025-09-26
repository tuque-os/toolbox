#!/bin/bash

# set -ouex pipefail

FISH_CONF=(
  "apps-configs"
  "default-progs"
  "emoji-width"
  "no-startup-msg"
  "starship"
  "theme"
  "xdg-base-dirs"
  "zoxide"
)

FISH_FUNCTIONS=(
  "cdg"
  "la"
  "ls"
  "lsdu"
  "mkcd"
)

# copy config from workstation
rsync -rvK /workstation/usr/share/tuque-os /usr/share/

cp "/workstation/usr/share/fish/tools/web_config/themes/Catppuccin Mocha.theme" /usr/share/fish/tools/web_config/themes/

for conf in "${FISH_CONF[@]}"; do
  cp "/workstation/usr/share/fish/vendor_conf.d/${conf}.fish" /usr/share/fish/vendor_conf.d/
done

for func in "${FISH_FUNCTIONS[@]}"; do
  cp "/workstation/usr/share/fish/vendor_functions.d/${func}.fish" /usr/share/fish/vendor_functions.d/
done
