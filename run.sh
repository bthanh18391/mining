#!/bin/bash
sudo apt-get update
sudo apt-get install git make automake screen libcurl4-openssl-dev -y
sudo apt-get install libcurl4-openssl-dev build-essential libjansson-dev -y
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 3))
git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi
./autogen.sh
CFLAGS="-march=native" ./configure
make
screen -S minerd 
sudo ./minerd -a cryptonight -o stratum+tcp://asia.monero.miningpoolhub.com:20580 -u buithanhktckbk54.new1 -p x -x testdaotien.ddns.net:808
