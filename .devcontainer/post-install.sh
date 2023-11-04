# Change some Poetry settings to better deal with working in a container
poetry config cache-dir ${WORKSPACE_DIR}/.cache
poetry config virtualenvs.in-project true

#!/bin/bash
echo "source /workspaces/heltour/env/bin/activate" >> /root/.bashrc

virtualenv env --prompt="(heltour):" --python=/usr/local/bin/python3
source env/bin/activate
#pip install poetry
git config --global --add safe.directory /workspaces/heltour
poetry install
fab update
