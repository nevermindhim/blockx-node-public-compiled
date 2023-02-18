#!/bin/bash

CHAINID="blockx_12345-2"            # Chain ID
MONIKER="Blockx-Node-2"             # Moniker of your node
KEYRING="file"                      # Keyring Backend
KEY="node2"                         # key name from which validator will be created
AMOUNT=140000000bcx # Self-delegation amount
COMMISSION_RATE=0.05                # Commission rate
COMMISSION_MAX_RATE=0.10            # Commission max rate
COMMISSION_MAX_CHANGE_RATE=0.01     # Commission max change rate
MIN_SELF_DELEGATION=1000bcx         # Min self delegation

blockxd tx staking create-validator \
--amount=$AMOUNT \
--pubkey=$(blockxd tendermint show-validator) \
--moniker=$MONIKER \
--chain-id=$CHAINID \
--commission-rate=$COMMISSION_RATE \
--commission-max-rate=$COMMISSION_MAX_RATE \
--commission-max-change-rate=$COMMISSION_MAX_CHANGE_RATE \
--min-self-delegation=$MIN_SELF_DELEGATION \
--gas="300000" \
--gas-prices="1000000000abcx" \
--from=$KEY \
--keyring-backend $KEYRING