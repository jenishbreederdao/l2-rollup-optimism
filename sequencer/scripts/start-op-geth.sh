#!/bin/sh
set -eou

if [ -n "${INITIALIZE_GENESIS}" ]; then
  geth init --datadir="$DATADIR" /chainconfig/genesis.json
fi

exec geth \
  --datadir $DATADIR \
  --http \
  --http.corsdomain="*" \
  --http.vhosts="*" \
  --http.addr=0.0.0.0 \
  --http.api=web3,debug,eth,txpool,net,engine \
  --http.port=$OP_GETH_HTTP_PORT \
  --ws \
  --ws.addr=0.0.0.0 \
  --ws.port=${OP_GETH_WS_PORT} \
  --ws.origins="*" \
  --ws.api=debug,eth,txpool,net,engine \
  --syncmode=${SYNC_MODE} \
  --gcmode=${GC_MODE} \
  --nodiscover=$NO_DISCOVER \
  --maxpeers=$MAX_PEERS \
  --networkid=$L2_CHAIN_ID \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --authrpc.port=${OP_GETH_AUTH_RPC_PORT} \
  --authrpc.jwtsecret=/chainconfig/jwt.txt \
  --log.file=/app/log-op-geth/log.txt \
  --log.format=logfmt \
  --log.rotate=false \
  --rollup.disabletxpoolgossip=true \
  --port="${OP_GETH_P2P_PORT}" \
  --discovery.port="${OP_GETH_P2P_PORT}" \
  $EXTENDED_ARG_OP_GETH $@