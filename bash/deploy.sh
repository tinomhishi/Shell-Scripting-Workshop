#!/bin/bash
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" = "main" ]; then
    echo "Deploying to production..."
    git pull origin main
    systemctl restart myapp.service
else
    echo "Not on main branch, skipping deployment."
fi