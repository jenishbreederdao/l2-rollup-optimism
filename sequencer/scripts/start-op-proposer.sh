#!/bin/sh
set -eou

#!/bin/bash

exec op-proposer \
  --poll-interval=12s \
  --rpc.port=$OP_PROPOSER_HTTP_PORT \
  --rollup-rpc=$ROLLUP_RPC_URL \
  --l2oo-address=$L2_OO_ADDRESS \
  --private-key=$GS_PROPOSER_PRIVATE_KEY \
  --log.level=${OP_PROPOSER_LOG_LEVEL} \
  --num-confirmations=${OP_PROPOSER_BLOCK_CONFIRMATION} \
  --l1-eth-rpc=$L1_RPC_URL \
  $EXTENDED_ARG_OP_PROPOSER $@