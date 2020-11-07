#!/bin/bash

cd ~/.termdev/bin
wget https://github.com/tomnomnom/gron/releases/download/v0.6.0/gron-linux-amd64-0.6.0.tgz
tar xzvf gron-linux-amd64-0.6.0.tgz
chmod 750 gron
rm gron-linux-amd64-0.6.0.tgz
