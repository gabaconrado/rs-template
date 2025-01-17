#!/usr/bin/env bash
#
# Checks the version on the Cargo.toml file with the given tag
#

#########################
#       Constants       #
#########################

# Assumes scripts are called from the root of the repository
COMMON_LIB_PATH="./scripts/common.sh"
# Path to the cargo file
CARGO_FILE_PATH="Cargo.toml"

#########################
#         Inputs        #
#########################

version="${1}"

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

validate_arg "version"

file_exists "${CARGO_FILE_PATH}"

# Parse the crate version from the cargo file
cargo_version=$(grep -Po '(?<=^version = ")[^"]*' "${CARGO_FILE_PATH}")

if [ -z "${cargo_version}" ]; then
    echo "Version not found in '${CARGO_FILE_PATH}'"
    exit 10
fi

if [ "${version}" != "${cargo_version}" ]; then
    echo "Version in '${CARGO_FILE_PATH}|${cargo_version}' does not match given version '${version}'"
    exit 11
fi

echo "Version '${version}' is correct!"
