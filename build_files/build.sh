#!/bin/bash

set -ouex pipefail

# copy files
# rsync -rvK /ctx/system_files/ /

# run scripts
/ctx/build_files/packages.sh
