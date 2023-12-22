#!/bin/bash

# Function for displaying help
display_help() {
    cat <<EOF
Usage: internsctl [OPTIONS] COMMAND [ARGS]...

Options:
  --help     Show this message and exit.
  --version  Show version information.

Commands:
  cpu         Get CPU information
  memory      Get memory information
  user        User management
  file        File information
EOF
}

# Function for displaying version
display_version() {
    echo "internsctl v0.1.0"
}

# Argument parsing
if [ "$1" == "--help" ]; then
    display_help
elif [ "$1" == "--version" ]; then
    display_version
elif [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    ./scripts/cpu_info.sh
elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    ./scripts/memory_info.sh
elif [ "$1" == "user" ]; then
    if [ "$2" == "create" ]; then
        ./scripts/create_user.sh "$3"
    elif [ "$2" == "list" ]; then
        if [ "$3" == "--sudo-only" ]; then
            ./scripts/list_sudo_users.sh
        else
            ./scripts/list_users.sh
        fi
    fi
elif [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
    ./scripts/file_info.sh "$3" "$4"
else
    echo "Invalid arguments. Use '--help' for usage information."
fi
