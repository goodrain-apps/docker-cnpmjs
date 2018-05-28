#!/bin/bash

[[ $DEBUG ]] && set -x

SYNC_MODEL=${SYNC_MODEL:- none}
SYNC_INTERVAL=${SYNC_INTERVAL:-10m}

# replace config.js with env
sed -i "s/__SYNC_MODEL__/${SYNC_MODEL}/g" $APPDIR/config/config.js
sed -i "s/__SYNC_INTERVAL__/${SYNC_INTERVAL}/g" $APPDIR/config/config.js

case "$1" in
"debug")
  /bin/bash;;
"start")
  /usr/local/bin/node /app/cnpmjs.org/dispatch.js;;
"version")
  echo "cnpm_version:$CNPMJS_ORG_VERSION"
*)
  echo -e "Optional parameters:\n debug - get bash cli\n start - start cnpmjs\n version - show cnpmjs version"
  exit 1;
esac

