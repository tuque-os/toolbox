#!/bin/bash

set -ouex pipefail

# copy files
# rsync -rvK /ctx/system_files/ /

# run scripts
# TODO

# clean package manager cache
dnf5 clean all
