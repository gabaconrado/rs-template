#!/usr/bin/env bash
#
# Creates a tag and pushes to the repository
#

#########################
#       Constants       #
#########################

# Assumes scripts are called from the root of the repository
COMMON_LIB_PATH="./scripts/common.sh"
MAIN_BRANCH="main"

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

./scripts/ci/check-version.sh "${tag}"

current_branch="$(git branch --show-current)"

if [ "${current_branch}" != "${MAIN_BRANCH}" ]; then
    echo "Tags must be created on the '${MAIN_BRANCH}'. Current is '${current_branch}'"
fi

git tag "${tag}" && git push origin "${tag}"
