#!/bin/bash

set -e

bootstrapZip='bootstrap-3.0.0-dist.zip'
bootstrapFolder='bootstrap-3.0.0'

if [ ! -f $bootstrapZip]; then
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

echo 'Do you want to update application.css and application.js?'

select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo 'application.css'
            app_css='app/assets/stylesheets/application.css'
            sed -i '$ d' $app_css
            echo ' *= require bootstrap' >> $app_css
            echo ' */' >> $app_css
            tail -3 $app_css

            echo 'application.js'
            app_js='app/assets/javascripts/application.js'
            sed -i '$ d' $app_js
            echo '//= require bootstrap' >> $app_js 
            tail -3 $app_js

            echo 'done'
            break;;
        No ) 
            exit
    esac
done

exit
#EOF
