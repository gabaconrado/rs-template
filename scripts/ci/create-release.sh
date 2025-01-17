#!/usr/bin/env bash
#
# Uses the GH CLI to create a release
#

#########################
#       Constants       #
#########################

# Assumes scripts are called from the root of the repository
COMMON_LIB_PATH="./scripts/common.sh"

#########################
#         Inputs        #
#########################

tag="${1}"

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

validate_arg "tag"

gh release create "${tag}" --generate-notes --verify-tag
