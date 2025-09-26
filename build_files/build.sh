#!/bin/bash

set -ouex pipefail

# copy files
# rsync -rvK /ctx/system_files/ /

# run scripts
/ctx/build_files/packages.sh

{
  echo "IMAGE_NAME=Tuque OS"
  echo "IMAGE_VARIANT=Toolbox"
  echo "IMAGE_VERSION=\"${VERSION:-00.00000000}\""
  echo "IMAGE_HOME_URL=https://github.com/tuque-os/toolbox"
} >>/usr/lib/os-release
