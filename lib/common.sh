#!/bin/bash
PLUGIN_NAME=BUILDKITE_PLUGIN_OCTOPUS_RELEASE_

# Stolen from https://github.com/buildkite-plugins/docker-compose-buildkite-plugin/blob/0f9d4caf8b0d0198213a7d8534a779f00c42ce95/lib/shared.bash#L41-L57
# Reads either a value or a list from the given env prefix
function plugin_read_list_attribute() {
  local prefix="${PLUGIN_NAME}$1"
  local parameter="${prefix}_0"

  if [[ -n "${!parameter:-}" ]]; then
    local i=0
    local parameter="${prefix}_${i}"
    while [[ -n "${!parameter:-}" ]]; do
      echo "${!parameter}"
      i=$((i+1))
      parameter="${prefix}_${i}"
    done
  elif [[ -n "${!prefix:-}" ]]; then
    echo "${!prefix}"
  fi
}