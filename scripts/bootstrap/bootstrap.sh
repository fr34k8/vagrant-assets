#!/bin/bash

echo "Making all shell scripts executable.."
find /tmp/packer-provision/bootstrap/ -type f -name '*.sh' -print -exec chmod +x {} \;

echo "Executing shell scripts.."
for f in $(ls -r /tmp/packer-provision/bootstrap/*.sh | sort); do
  ${f} || exit 1
done

echo "Cleaning /tmp"
rm -rf /tmp/*

echo "Finishing ${0}.."
