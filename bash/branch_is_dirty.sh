#!/bin/bash

# Check if inside a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not inside a Git repository."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    echo "Branch is dirty (uncommitted changes exist)."
    exit 1
else
    echo "Branch is clean."
    exit 0
fi
