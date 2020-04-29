#!/bin/bash

kapp deploy -c -y -a kdemo -f app.yaml

trap 'kill $(jobs -p)' EXIT

kubectl port-forward deploy/kdemo 8080:8080 &
sleep 2

curl http://localhost:8080
