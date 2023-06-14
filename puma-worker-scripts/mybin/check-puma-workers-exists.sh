#!/usr/bin/env bash

# checks for puma workers and
# prints true or false

set +e

main() {
  ps -ef | grep -q "puma: cluster worker" | grep -v grep

  local status="$?"

  if [ "$status" = "0" ]; then
    echo true
  else
    echo false
  fi
  exit 0
}

main
