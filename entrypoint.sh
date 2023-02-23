#!/bin/bash
set -e

# check if more than one parameter was passed to the script
# if so, exit with an error
if [ $# -gt 1 ]; then
    echo "Too many parameters passed to the script."
    exit 1
fi

# check if the length of the parameter is greater than 0
# if not, exit with an error
if [ ${#1} -gt 0 ]; then
    echo "Parameter passed to the script: $1"
    # make a gihub api call to get a secret
    curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/username/repo-name/actions/secrets/SECRET_NAME
else
    echo "No parameter passed to the script."
    exit 1
fi
