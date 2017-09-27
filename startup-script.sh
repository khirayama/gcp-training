#! /bin/bash
# [START startup]
set -v

PROJECTID=$(curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")

apt-get update
apt-get install -yq git nodejs

# Install nodejs
mkdir /opt/nodejs
curl https://nodejs.org/dist/v4.2.2/node-v4.2.2-linux-x64.tar.gz | tar xvzf - -C /opt/nodejs --strip-components=1
ln -s /opt/nodejs/bin/node /usr/bin/node
ln -s /opt/nodejs/bin/npm /usr/bin/npm

export HOME=/root
git clone https://github.com/khirayama/gcp-training.git /opt/app

cd /opt/app/gcp-training
npm install
# [END startup]
