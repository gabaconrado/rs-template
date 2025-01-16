#!/usr/bin/env bash
#
# Builds the system
#

#########################
#       Constants       #
#########################

# Assumes scripts are called from the root of the repository
COMMON_LIB_PATH="./scripts/common.sh"

CARGO_CMD="cargo --color always build --all-features --tests --examples"

#########################
#         Inputs        #
#########################

mode="${1}"

#########################
#       Functions       #
#########################


#########################
#      Script Start     #
#########################

set -e -o pipefail

# Disables shellchek not being able to follow the dynamic script
# shellcheck disable=SC1090
source "${COMMON_LIB_PATH}"

validate_arg "mode" "debug" "release"

case "${mode}" in
    "debug")
        ${CARGO_CMD}
        ;;
    "release")
        ${CARGO_CMD} --release
        ;;
esac

exit 0
