#!/bin/bash

set -e

bootstrapZip='bootstrap-3.0.0-dist.zip'
bootstrapFolder='bootstrap-3.0.0'

if [ ! -f $bootstrapZip ] ; then
    echo 'downloading Bootstrap...'
    # http://getbootstrap.com/
    wget https://github.com/twbs/bootstrap/releases/download/v3.0.0/bootstrap-3.0.0-dist.zip
fi

unzip -o $bootstrapZip -d $bootstrapFolder 

# css

cp -v $bootstrapFolder/dist/css/bootstrap.css \
      app/assets/stylesheets/
cp -v $bootstrapFolder/dist/css/bootstrap.min.css \
      app/assets/stylesheets/

# js

cp -v $bootstrapFolder/dist/js/bootstrap.js \
      app/assets/javascripts/

cp -v $bootstrapFolder/dist/js/bootstrap.min.js \
      app/assets/javascripts/

exit
#EOF
