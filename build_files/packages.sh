#!/bin/bash

set -ouex pipefail

# install jq first so we can read JSON files below
dnf -y install jq

mapfile -t COPR_REPOS < <(jq -r ".copr.[]" /ctx/build_files/packages.json)
mapfile -t PACKAGES < <(jq -r ".packages.[]" /ctx/build_files/packages.json)

for copr in "${COPR_REPOS[@]}"; do
  dnf5 -y copr enable "$copr"
done

dnf -y install "${PACKAGES[@]}"

# clean package manager cache
dnf clean all
