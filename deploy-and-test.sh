#!/bin/bash

# reduce kapp log verbosity by polling less aggressively
DEPLOY_FLAGS="--wait-check-interval=5s"

kapp deploy -c -y -a kdemo -f app.yaml $DEPLOY_FLAGS

trap 'kill $(jobs -p)' EXIT

kubectl proxy &
sleep 2

curl http://localhost:8001/api/v1/namespaces/default/services/kdemo/proxy/
