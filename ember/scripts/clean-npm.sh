#!/bin/bash

set -e

npm uninstall -g ember-cli

npm cache clear

rm -rf node_modules

rm -r ~/.npm

rm -r ~/tmp

exit
#EOF
