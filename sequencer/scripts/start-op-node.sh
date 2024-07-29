#!/bin/sh
set -eou

# Start op-node.
exec op-node \
  --l2=$L2_RPC_WS_URL \
  --l2.jwt-secret=/chainconfig/jwt.txt \
  --sequencer.enabled \
  --sequencer.l1-confs=5 \
  --verifier.l1-confs=4 \
  --rollup.config=/chainconfig/rollup.json \
  --rpc.addr=0.0.0.0 \
  --rpc.port=$OP_NODE_HTTP_PORT \
  --p2p.disable=$P2P_DISABLE \
  --p2p.listen.tcp=$OP_NODE_P2P_PORT \
  --rpc.enable-admin \
  --p2p.sequencer.key=$GS_SEQUENCER_PRIVATE_KEY \
  --l1=$L1_RPC_URL \
  --l1.rpckind=$L1_RPC_KIND
  $EXTENDED_ARG_OP_NODE $@