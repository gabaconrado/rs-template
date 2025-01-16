#!/usr/bin/env bash
#
# Run all tests in system
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

info "Building the system"
./scripts/ci/build.sh debug
info "Linting the system"
./scripts/ci/lint.sh
info "Testing the system"
./scripts/ci/test.sh

exit 0
