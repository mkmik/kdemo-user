#!/bin/bash

kapp deploy -c -y -a kdemo -f app.yaml

trap 'kill $(jobs -p)' EXIT

kubectl proxy &
sleep 2

curl http://localhost:8001/api/v1/namespaces/default/services/kdemo/proxy/
