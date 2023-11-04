# Reference: https://github.com/devcontainers/images/blob/main/src/python/.devcontainer/Dockerfile
ARG VARIANT=3.8-bookworm

FROM python:${VARIANT}

# See https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=vagrant
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG POETRY_VERSION=1.6.1

# Configure non-root user
# Create the user
RUN echo $USER_GID $USERNAME
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # Add sudo support.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

USER $USERNAME

RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && sudo apt-get purge -y imagemagick imagemagick-6-common 

# Temporary: Upgrade python packages due to https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-40897
# They are installed by the base image (python) which does not have the patch.
RUN python3 -m pip install --upgrade setuptools

# Customize image for the requirements of https://github.com/Lichess4545/heltour

# Install poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=${POETRY_VERSION} python3 -
ENV PATH="${PATH}:$HOME/.local/bin"

# Install SASS from node.js, because pure dart-sass does not seem to be supported
RUN sudo apt-get update &&\
    sudo apt-get install -y nodejs npm &&\
    mkdir $HOME/.npm-global &&\
    npm config set prefix '~/.npm-global'
ENV PATH=$HOME/.npm-global/bin:$PATH
RUN npm install -g sass

# Install virtualenv
RUN python -m pip install virtualenv

# Install Fabric3 (not fabric)
RUN pip install fabric3

