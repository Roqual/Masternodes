#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

# Run this file
# bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/dev-x0/masternode/master/lightpaycoin.sh)" ; source ~/.bashrc

# Github user and project.
GITHUB_REPO='lpcproject/LightPayCoin'
# Display Name.
DAEMON_NAME='Light Pay Coin'
# Coin Ticker.
TICKER='LPC'
# Binary base name.
BIN_BASE='lightpaycoin'
# Directory.
DIRECTORY='.lightpaycoin'
# Conf File.
CONF='lightpaycoin.conf'
# Port.
DEFAULT_PORT=39797
# Amount of Collateral needed.
COLLATERAL=1000
# Blocktime in seconds.
BLOCKTIME=60
# Explorer URL
EXPLORER_URL='http://explorer.lightpaycoin.org:3001/'
# Cycle Daemon on first start
DAEMON_CYCLE=1

# Cycle Daemon
DAEMON_CYCLE=0
# Fallback Blockcount
BLOCKCOUNT_FALLBACK_VALUE=26000
# Multiple on single IP.
MULTI_IP_MODE=1
# Run Mini Monitor.
MINI_MONITOR_RUN=1
# Mini Monitor check masternode list.
MINI_MONITOR_MN_LIST=1
# Mini Monitor Status to check for.
MINI_MONITOR_MN_STATUS='4'
# Mini Monitor Queue Payouts.
MINI_MONITOR_MN_QUEUE=1
# Mini Monitor masternode count is a json string.
MINI_MONITOR_MN_COUNT_JSON=1

cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- goo.gl/uQw9tz -O ~/___mn.sh
  COUNTER=$((COUNTER+1))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane
