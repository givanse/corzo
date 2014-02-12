#!/bin/bash

set -e

START=`date +%s`

# The script assumes that is executed from the root folder. #

# Shutdown app / server

rake db:drop

createdb -U ivan -O ivan corzo_development

rake db:migrate

rake db:seed

END=`date +%s`
ELAPSED=$(( $END - $START ))
echo 'elapsed: ' $ELAPSED / 60 ' mins.'

exit
#EOF
