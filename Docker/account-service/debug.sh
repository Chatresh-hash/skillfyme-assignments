#!/bin/bash
set -e

NETWORK_NAME="bank-local-mesh"
TARGET_URL="http://transaction-srv:8080/transactions/health"

echo "🔍 Running debug curl container on network: $NETWORK_NAME"
docker run --rm --network $NETWORK_NAME curlimages/curl curl -i $TARGET_URL
