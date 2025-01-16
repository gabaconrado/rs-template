#!/usr/bin/env bash
#
# Lints the system
#

#########################
#       Constants       #
#########################

# Assumes scripts are called from the root of the repository
COMMON_LIB_PATH="./scripts/common.sh"

#########################
#         Inputs        #
#########################

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

cargo --color always fmt --check
cargo clippy --color always --all-features --tests --examples --bins

exit 0
