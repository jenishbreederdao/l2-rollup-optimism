#!/bin/sh
set -eou

#!/bin/bash

exec op-proposer \
  --poll-interval=12s \
  --rpc.port=$OP_PROPOSER_HTTP_PORT \
  --rollup-rpc=$ROLLUP_RPC_URL \
  --l2oo-address=$L2_OO_ADDRESS \
  --private-key=$GS_PROPOSER_PRIVATE_KEY \
  --log.level=debug \
  --num-confirmations=4 \
  --l1-eth-rpc=$L1_RPC_URL