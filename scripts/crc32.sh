#!/bin/bash

# Function to display help message
function display_help {
    local scriptname=$(basename "$0")
    echo "Usage: $scriptname [OPTIONS] FILENAME"
    echo
    echo "Options:"
    echo " -h, --help     Display this help message and exit."
    echo " FILENAME        File to checksum and convert to hexadecimal."
    echo
    echo "Example:"
    echo " $scriptname -h"
    echo " $scriptname filename.txt"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    echo "Error: No arguments provided." >&2
    display_help
    exit 1
fi

# Parse command-line options
while getopts ":h" opt; do
    case ${opt} in
        h)
            display_help
            exit 0
            ;;
        \?)
            echo "Invalid Option: -$OPTARG" >&2
            display_help
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Check if filename was provided
if [ $# -ne 1 ]; then
    echo "Error: Please provide a filename." >&2
    display_help
    exit 1
fi

# Proceed with the original functionality
cksum -o3 "$1" | cut -d' ' -f1 | xargs -I{} echo printf '%0X\\n' {} | sh

