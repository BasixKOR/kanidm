#!/bin/bash

# sets up the venv and runs the integration test

MYDIR="$(dirname "$0")"

if [ ! -d ".venv" ]; then
    echo "Setting up virtualenv"
    python -m venv .venv
    # shellcheck disable=SC1091
    source .venv/bin/activate
    pip install --upgrade pip
    pip install uv
    echo "Installing in virtualenv"
    pip install -e .
fi

# shellcheck disable=SC1091
source .venv/bin/activate

python "${MYDIR}/integration_test.py"
