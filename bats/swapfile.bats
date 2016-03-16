#!/usr/bin/env bats
# vim: ft=sh:sw=2:ts=2:noet

set -o pipefail

@test "create swap file" {
  swapsize=2048 # in MB
  fallocate -l ${swapsize}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
}
