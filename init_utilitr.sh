#!/bin/bash
curl -sSL https://raw.githubusercontent.com/A2-ai/rv/refs/heads/main/scripts/install.sh | bash
source ~/.bashrc

if [ -d "/home/onyxia/work/utilitr" ]; then
  cd /home/onyxia/work/utilitr
  rv sync
else
  git clone https://github.com/inseefrlab/utilitr
  cd /home/onyxia/work/utilitr
  rv sync
  cd ..
  rm -rf utilitr
fi
