#!/bin/bash

# Check if username is provided
if [ -z "$1" ]; then
    echo "Please provide a username."
    exit 1
fi

# Create user
sudo adduser "$1"
