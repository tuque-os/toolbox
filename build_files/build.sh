#!/bin/bash

set -ouex pipefail

# run scripts
/ctx/build_files/packages.sh
/ctx/build_files/files.sh

{
  echo "IMAGE_NAME=Tuque OS"
  echo "IMAGE_VARIANT=Toolbox"
  echo "IMAGE_VERSION=\"${VERSION:-00.00000000}\""
  echo "IMAGE_HOME_URL=https://github.com/tuque-os/toolbox"
} >>/usr/lib/os-release
