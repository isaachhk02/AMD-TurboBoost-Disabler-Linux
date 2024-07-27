#!/bin/bash
# craeted by isaachhk02


DisableAMDTurboBoost() {
  if [ -f /sys/devices/system/cpu/cpufreq/boost ]; then
    echo "Disabling Turbo Boost"
    echo 0 > /sys/devices/system/cpu/cpufreq/boost
    echo "Done!"
  else
    echo "No turbo boost detected!"
  fi
}

EnableAMDTurboBoost() {
  if [ -f /sys/devices/system/cpu/cpufreq/boost ]; then
    echo "Enabling Turbo Boost"
    echo 1 > /sys/devices/system/cpu/cpufreq/boost
    echo "Done!"
  else
    echo "No turbo boost detected!"
  fi
}
if [ $EUID -eq 0 ]; then
  if [ -z "$1" ]; then
    echo "ERROR: No arguments"
  fi
  if [ "$1" == "--help" ]; then
    echo "Created by isaachhk02"
    echo "amdturboostdisablerlinux.sh [option]"
    echo "--enable : Enable AMD Turbo Boost"
    echo "--disable : Disable AMD Turbo Boost"
  fi
  if [ "$1" == "--enable" ]; then
    EnableAMDTurboBoost
  fi
  if [ "$1" == "--disable" ]; then
    DisableAMDTurboBoost
  fi
else
  echo "ERROR: Run this root!"
fi
  
