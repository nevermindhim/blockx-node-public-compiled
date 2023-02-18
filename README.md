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

# How to run a fullnode using Ubuntu 22.04

```
git clone https://github.com/defi-ventures/blockx-node-public-compiled.git
cd blockx-node-public-compiled
./run-fullnode-cosmovisor.sh
```

# How to become a validator using Ubuntu 22.04

Open `create-validator.sh` with any text editor, and change configurations as you need.

Then run the script.

```
./create-validator.sh
```

# How to add a key

```
blockxd keys add <your key name> --keyring-backend file --algo eth_secp256k1
# e.g.  blockxd keys add mykey --keyring-backend file --algo eth_secp256k1
```
