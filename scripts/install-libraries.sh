#!/bin/bash

set -e

#JQuery 
wget http://code.jquery.com/jquery-2.1.0.js
mv jquery-2.1.0.js app/assets/javascripts/


# JQuery UI
echo 'JQuery UI'
zipFolder='jquery-ui-1.10.4.zip'
folder='jquery-ui-1.10.4'
if [ ! -f $zipFolder ] ; then
    wget http://jqueryui.com/resources/download/jquery-ui-1.10.4.zip 
fi
unzip -o $zipFolder 
echo 'JQuery UI, copying'
# image
mkdir -p public/assets/images/
cp -v $folder/themes/base/images/* \
      public/assets/images/
# css
cp -v $folder/themes/base/jquery-ui.css \
      app/assets/stylesheets/
# js
cp -v $folder/ui/jquery-ui.js \
      app/assets/javascripts/
cp -v $folder/ui/i18n/jquery.ui.datepicker-es.js \
      app/assets/javascripts/i18n/


# JQuery time picker
echo 'JQuery time picker'
zipFolder='1.3.3.zip'
folder='jquery-timepicker-1.3.3'
if [ ! -f $zipFolder ] ; then
    wget https://github.com/jonthornton/jquery-timepicker/archive/1.3.3.zip 
fi
unzip -o $zipFolder
echo 'JQuery time picker, copying'
# css
cp -v $folder/jquery.timepicker.css \
      app/assets/stylesheets/
# js
cp -v $folder/jquery.timepicker.js \
      app/assets/javascripts/
cp -v $folder/jquery.timepicker.min.js \
      app/assets/javascripts/

echo 'Success!'

exit 0
#EOF