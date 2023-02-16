#!/bin/bash
CHAINID="blockx_12345-2"
MONIKER="Blockx-Node-2"
KEYRING="file"
PROJECT_DIR=$PWD

# Stop & remove old data
sudo systemctl stop blockxd.service
# sudo rm -f /etc/systemd/system/blockxd.service
sudo rm $HOME/go/bin/blockxd
sudo rm -rf $HOME/.blockxd

# Replace service
cp blockxd.service /etc/systemd/system

# make folder structure for cosmovisor
rm -rf $HOME/.blockxd/cosmovisor
mkdir -p $HOME/.blockxd/cosmovisor/genesis/bin
curl -LO https://github.com/defi-ventures/blockx-node-public-compiled/releases/download/v9.0.0/blockxd
chmod +x blockxd
cp blockxd /root/go/bin
mv blockxd $HOME/.blockxd/cosmovisor/genesis/bin

# init binary
cd $HOME/.blockxd/cosmovisor/genesis/bin
./blockxd config chain-id $CHAINID
./blockxd config keyring-backend $KEYRING
./blockxd init $MONIKER --chain-id $CHAINID --keyring-backend $KEYRING

cd $PROJECT_DIR
cp genesis.json $HOME/.blockxd/config
cp blockxd.service /etc/systemd/system

export DAEMON_NAME=blockxd         # binary name
export DAEMON_HOME=$HOME/.blockxd  # daemon's home directory

cd $HOME/.blockxd/config

sed -i 's/persistent_peers = \"\"/persistent_peers = \"4a7401f7d6daa39d331196d8cc179a4dcb11b5f9@143.198.110.221:26656\"/g' config.toml

go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@latest

systemctl daemon-reload
systemctl start blockxd.service
