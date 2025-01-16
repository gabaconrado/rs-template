#!/usr/bin/env bash
#
# Base template script
#
# Used to create new templates in this repository

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

exit 0
