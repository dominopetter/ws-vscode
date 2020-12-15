#!/bin/bash
set -o nounset -o errexit -o pipefail

##Install VSCode and requirements including Node
apt-get update -qq && \
curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
apt-get install \
  jq \
  libx11-dev \
  libxkbfile-dev \
  libsecret-1-dev \
  node-gyp \
  nodejs -y && \
pip install -q python-language-server autopep8 flake8 pylint && \
apt-get clean && \
rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*

CODE_SERVER_VERSION=3.6.1

mkdir /opt/code-server && \
cd /opt/code-server && \
wget -qO- https://github.com/cdr/code-server/releases/download/v$CODE_SERVER_VERSION/code-server-$CODE_SERVER_VERSION-linux-amd64.tar.gz| tar zxf - --strip-components=1 && \
echo 'export PATH=/opt/code-server:$PATH' >> /home/ubuntu/.domino-defaults && \
apt-get purge --auto-remove -y \
  libx11-dev \
  libxkbfile-dev \
  libsecret-1-dev && \
apt-get clean && \
rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/* 

##Install VSCode extensions for python (pinned to this version due to a bug)
export PATH=/opt/code-server/bin:$PATH && \
cd /tmp && \
wget -q https://github.com/microsoft/vscode-python/releases/download/2020.5.86806/ms-python-release.vsix && \
code-server \
  --install-extension ms-python-release.vsix \
  --extensions-dir /home/ubuntu/.local/share/code-server/extensions && \
chown -R ubuntu:ubuntu /home/ubuntu/.local/ && \
rm -rf /tmp/*