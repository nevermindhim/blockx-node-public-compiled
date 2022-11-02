rm -rf $HOME/.blockxd
rm $HOME/go/bin/blockxd

cp blockxd $HOME/go/bin

blockxd config chain-id blockx_12345-1
blockxd config keyring-backend file
blockxd init seednode2 --chain-id blockx_12345-1 --keyring-backend file

cp genesis.json $HOME/.blockxd/config
cd $HOME/.blockxd/config
sed -i 's/seed_mode = false/seed_mode = true/g' config.toml
sed -i 's/persistent_peers = \"\"/persistent_peers = \"8339668165d1fe98f24c042e7a61fd7c6aa7a1aa@142.93.202.64:26656\"/g' config.toml
blockxd start --minimum-gas-prices=1000000000abcx
