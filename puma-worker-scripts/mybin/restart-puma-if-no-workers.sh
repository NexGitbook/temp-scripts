#!/usr/bin/env bash

# restart-puma-if-no-workers.sh

set +e

main() {
  local does_exist=$(check-puma-workers-exists.sh)

  if [[ "$does_exist" == "false" ]]; then
    local log="/tmp/myscript.log"
    sudo systemctl restart my_post_labels.target &> $log
    local status=$?
    if [[ "$status" == "0" ]]; then
      echo "restarted"
    else
      cat $log
    fi
  fi
}

main
