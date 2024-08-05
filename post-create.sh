#!/bin/bash

set -e

# Install poetry and set virtual env
curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH in .bashrc if it's not already there
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
fi

# Apply changes immediately in the current session
export PATH="$HOME/.local/bin:$PATH"

# Enable virtualenvs.in-project
poetry config virtualenvs.in-project true

# Create and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate
poetry install
