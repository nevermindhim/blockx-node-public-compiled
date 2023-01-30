# Pre-requisites:
Go version 1.18

Ubuntu 22.04

# Compiled version
This is the compiled version to make it easier for validators, node operators or developers to run a full node.

# Pre-requisite step
## 1) Install Golang:
Install latest go version https://golang.org/doc/install

```
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
source ~/.profile
```

To verify that Golang installed
```
go version
```

It should return go version go1.18 linux/amd64

# How to become a validator using Ubuntu 22.04
1. Download blockxd binary file and genesis file. If you don't have a key yet, go to the section below on How to add a key.
2. run the following commands

    $ RUN_PATH = "/usr/local/sbin/"

    $ mv ./blockxd $RUN_PATH

    $ blockxd init <validator-name> --chain-id blockx_12345-1 --keyring-backend file

    $ blockxd config chain-id blockx_12345-1

    $ blockxd config keyring-backend file

    $ echo "seed words from your account" | blockxd keys add validator --keyring-backend file --recover

    $ cp ./genesis.json ~/.blockxd/config/genesis.json

3. open config.toml file and set the seeds.

    $ vim ~/.blockxd/config/config.toml

    Find seeds = "" line and modify as seeds = "seed-id@seed-rpc"
4. run the node

    $ blockxd start --minimum-gas-prices 1000000000abcx
5. run the following command

    $ blockxd tx staking create-validator --amount=100000000000000000000000abcx --pubkey=$(blockxd tendermint show-validator) --moniker=< your node name> --chain-id=blockx_12345-1 --commission-rate="0.05" --commission-max-rate="0.10" --commission-max-change-rate="0.01" --min-self-delegation="1000000" --gas="300000" --gas-prices="1000000000abcx" --from=<your key> --keyring-backend file



# How to run a fullnode using Ubuntu 22.04
```
git clone https://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@github.com/defi-ventures/blockx-node-public-compiled.git
cd blockx-node-public-compiled
./run-fullnode.sh
```

# How to add a key
```
blockxd keys add <your key name> --keyring-backend file --algo eth_secp256k1
# e.g.  blockxd keys add mykey --keyring-backend file --algo eth_secp256k1
```
