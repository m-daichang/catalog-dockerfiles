#!/bin/bash

set -e

GIDDYUP='/opt/rancher/bin/giddyup'

# Waiting for leader service up
if [ "$( ${GIDDYUP} leader check ; echo $? )" -ne "0" ] ; then
echo "waiting..."
  ${GIDDYUP} service wait scale --timeout 120
  # add wait
  sleep 30
fi

exec /docker-entrypoint.sh rabbitmq-server
