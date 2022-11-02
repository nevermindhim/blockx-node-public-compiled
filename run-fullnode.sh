rm -rf $HOME/.blockxd
rm $HOME/go/bin/blockxd

cp blockxd $HOME/go/bin

blockxd config chain-id blockx_12345-1
blockxd config keyring-backend file
blockxd init seednode2 --chain-id blockx_12345-1 --keyring-backend file

cp genesis.json $HOME/.blockxd/config
cp blockxd.service /etc/systemd/system
cd $HOME/.blockxd/config

# for seed nodes, run following. need to change persistent_peers
# sed -i 's/seed_mode = false/seed_mode = true/g' config.toml
# sed -i 's/persistent_peers = \"\"/persistent_peers = \"8339668165d1fe98f24c042e7a61fd7c6aa7a1aa@142.93.202.64:26656\"/g' config.toml

# for non-seed nodes, run following.
sed -i 's/seeds = \"\"/seeds = \"8339668165d1fe98f24c042e7a61fd7c6aa7a1aa@142.93.202.64:26656,20ac427a3d3cbabf5818e87056438495ee5dc2c3@142.93.3.163:26656,b12d15da3ef70b306aec7a4a240f81b497033837@167.99.12.133:26656\"/g' config.toml

systemctl daemon-reload
systemctl start blockxd.service
service blockxd start
