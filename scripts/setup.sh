#!/bin/bash

set -e

# The script assumes that is executed from the root folder. #

# PostgresSQL
sudo apt-get install postgresql
sudo service postgresql start

# http://stackoverflow.com/a/12670521/7852
# create user rails
createuser -U postgres -d -e -E -l -P -r -s rails
createdb -U ivan -O rails corzo_development
echo 'Now you can:'
echo '    $> psql -U rails corzo_development'

# Rails

wget https://raw.githubusercontent.com/railsgirls/installation-scripts/master/rails-install-ubuntu.sh
chmod u+x rails-install-ubuntu.sh
./rails-install-ubuntu.sh

source ~/.rvm/scripts/rvm 

rvm install ruby-2.0.0-p481
rvm --default ruby-2.0.0-p481
rvm use ruby-2.0.0-p481
ruby -v

bundle update

rails -v

# Node
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz
tar -xvzf node-v0.10.28.tar.gz
cd node-v0.10.28/
./configure
make
sudo make install

# TODO: I have no idea of what is the best way of doing things with npm.
# http://stackoverflow.com/a/19474869/7852
sudo chown -R $USER /usr/local

# Ember CLI
npm install phantomjs -g
npm install -g ember-cli
ember -v

exit
#EOF
