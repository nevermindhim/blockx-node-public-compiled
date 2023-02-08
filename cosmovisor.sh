sudo systemctl stop blockxd.service
sudo rm -f /etc/systemd/system/blockxd.service
sudo rm $HOME/go/bin/blockxd

cd $HOME/.blockxd
rm -rf cosmovisor
mkdir -p cosmovisor/genesis/bin
mkdir -p cosmovisor/upgrades/v9.0.0/bin

curl -LO https://github.com/defi-ventures/blockx-node-public-compiled/releases/download/v8.0.0/blockxd
chmod +x blockxd
mv blockxd $HOME/.blockxd/cosmovisor/genesis/bin

curl -LO https://github.com/defi-ventures/blockx-node-public-compiled/releases/download/v9.0.0/blockxd
chmod +x blockxd
mv blockxd $HOME/.blockxd/cosmovisor/upgrades/v9.0.0/bin

export DAEMON_NAME=blockxd         # binary name
export DAEMON_HOME=$HOME/.blockxd  # daemon's home directory

go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@latest
cosmovisor run start --home $DAEMON_HOME