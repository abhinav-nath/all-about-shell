#!/bin/bash

# Function to convert from feet to inches
f2i() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameters. Usage: f2i <feet> [<inches>]"
        return 1
    fi

    feet=$1
    inches=${2:-0}  # If in not provided, default to 0

    total_inches=$((feet * 12 + inches))
    echo "$feet ft $inches in = $total_inches in"
}

# Function to convert from in to centimeters
i2c() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameter. Usage: i2c <inches>"
        return 1
    fi

    inches=$1
    centimeters=$(bc <<< "scale=2; $inches * 2.54")
    echo "$inches in = $centimeters cm"
}

# Function to convert from centimeters to inches
c2i() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameter. Usage: c2i <centimeters>"
        return 1
    fi

    centimeters=$1
    inches=$(bc <<< "scale=2; $centimeters / 2.54")
    echo "$centimeters cm = $inches in"
}

# Function to convert from inches to feet
i2f() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameter. Usage: i2f <inches>"
        return 1
    fi

    inches=$1
    feet=$((inches / 12))
    remaining_inches=$((inches % 12))
    echo "$inches in = $feet ft $remaining_inches in"
}

# Function to convert from feet to centimeters
f2c() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameters. Usage: f2c <feet> [<inches>]"
        return 1
    fi

    feet=$1
    inches=${2:-0}  # If in not provided, default to 0

    total_inches=$((feet * 12 + inches))
    centimeters=$(bc <<< "scale=2; $total_inches * 2.54")
    echo "$feet ft $inches in = $centimeters cm"
}

# Function to convert from centimeters to feet and inches
c2f() {
    if [ $# -lt 1 ]; then
        echo "Error: Missing parameter. Usage: c2f <centimeters>"
        return 1
    fi

    centimeters=$1
    total_inches=$(bc <<< "scale=2; $centimeters / 2.54")

    feet=$((total_inches / 12))
    remaining_inches=$((total_inches % 12))

    echo "$centimeters cms = $feet ft and $remaining_inches in"
}

# Main script
if [ $# -eq 0 ]; then
    echo "Error: No function name provided. Available functions: f2i, i2c, c2i, i2f, f2c, c2f"
    exit 1
fi

function_name="$1"
shift

case "$function_name" in
    "f2i") f2i "$@" ;;
    "i2c") i2c "$@" ;;
    "c2i") c2i "$@" ;;
    "i2f") i2f "$@" ;;
    "f2c") f2c "$@" ;;
    "c2f") c2f "$@" ;;
    *)
        echo "Error: Invalid function name. Available functions: f2i, i2c, c2i, i2f, f2c, c2f"
        exit 1
        ;;
esac
