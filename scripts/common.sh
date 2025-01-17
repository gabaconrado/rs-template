#!/usr/bin/env bash
#
# Defines useful and common functionality to other scripts
#

#########################
#       Constants       #
#########################

#########################
#         Inputs        #
#########################

#########################
#       Functions       #
#########################

# Prints a debug message in the terminal
function debug() {
    local color="\033[1;34m"
    local level="DEBUG"
    local msg="${1}"
    _print "${msg}" "${color}" "${level}"
}

# Prints a info message in the terminal
function info() {
    local color="\033[1;32m"
    local level="INFO"
    local msg="${1}"
    _print "${msg}" "${color}" "${level}"
}

# Prints a warn message in the terminal
function warn() {
    local color="\033[1;33m"
    local level="WARN"
    local msg="${1}"
    _print "${msg}" "${color}" "${level}"
}

# Prints an error message in the terminal
function error() {
    local color="\033[1;31m"
    local level="ERROR"
    local msg="${1}"
    _print "${msg}" "${color}" "${level}"
}

# Validates that an argument is present, optionally receives a list of possible values to validate
# against
function validate_arg() {
    local arg="${1}"
    shift
    local possible_values=${*}
    local ev_arg="${!arg}"
    if [ -z "${ev_arg}" ]; then
        error "Missing argument '${arg}'"
        exit 1
    fi
    if [ -z "${possible_values}" ]; then
        # Early return if no possible values provided
        return 0
    fi
    for value in ${possible_values}; do
        if [[ "${ev_arg}" = "${value}" ]]; then
            # Early return if any value matches
            return 0
        fi
    done
    error "Invalid argument '${arg}' = '${ev_arg}'. Possible values: ${possible_values}"
    exit 2
}

# Validates that a file exists
function file_exists() {
    local path="${1}"
    if [ ! -f "${path}" ]; then
        error "File '${path}' not found"
        exit 3
    fi
}

#########################
#  Internal Functions   #
#########################

# Internal print log message that takes a message, color and level and prints it in the screen
function _print() {
    local nc="\033[0m"
    local msg="${1}"
    local color="${2}"
    local level="${3}"
    local ts
    ts="$(date +"%Y-%m-%d %H:%M:%S")"
    echo -e "${color}[${ts}][${level}]: ${msg}${nc}"
}
