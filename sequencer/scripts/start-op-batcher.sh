#!/bin/sh
set -eou

#!/bin/bash

exec op-batcher \
  --l2-eth-rpc=$L2_RPC_URL \
  --rollup-rpc=$ROLLUP_RPC_URL \
  --data-availability-type=blobs \
  --poll-interval=12s \
  --sub-safety-margin=6 \
  --num-confirmations=3 \
  --safe-abort-nonce-too-low-count=3 \
  --resubmission-timeout=20s \
  --rpc.addr=0.0.0.0 \
  --rpc.port=$OP_BATHCER_HTTP_PORT \
  --rpc.enable-admin \
  --max-channel-duration=150 \
  --log.level=debug \
  --l1-eth-rpc=$L1_RPC_URL \
  --private-key=$GS_BATCHER_PRIVATE_KEY