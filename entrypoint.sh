#! /usr/bin/env bash

set -eo pipefail
set -x

ACTION_STATES_DIR="${ACTION_STATES_DIR:-.}"

set -u

cd "${GITHUB_WORKSPACE}"

ACTION_STATES_PATH="${GITHUB_WORKSPACE}/${ACTION_STATES_DIR}"

if [ ! -f "${ACTION_STATES_PATH}" -a ! -d "${ACTION_STATES_PATH}" ]; then
  >&2 echo "==> Can't find '${ACTION_STATES_PATH}'.
    Please ensure to set up ACTION_STATES_DIR env var
    relative to the root of your project."
  exit 1
fi

>&2 echo
>&2 echo "==> Linting ${ACTION_STATES_PATH}…"

salt-lint "${ACTION_STATES_PATH}"/*.sls

>&2 echo
