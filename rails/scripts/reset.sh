#!/bin/bash

set -e

START=`date +%s`

# The script assumes that is executed from the root folder. #

# Shutdown app / server
rm -rv db/migrate/* || true
rake db:drop
createdb -U ivan -O ivan corzo_development

########### Clean ##########

rails destroy active_admin:install
rails destroy active_admin:resource product
rails destroy devise user

########### Build ##########

echo 'Create Devise User.'
rails g devise user
rake db:migrate

./scripts/reset-db.sh

# Models
#echo 'Generate models.'
#rails g model Client --migration false --skip
#rails g model DailyLog --migration false --skip
#rails g model Driver --migration false --skip
#rails g model DriverStatus --migration false --skip
#rails g model DriverVehicleRecord --migration false --skip
#rails g model PositionRecord --migration false --skip
#rails g model UserRole --migration false --skip
#rails g model TrackerDevice --migration false --skip
#rails g model TransportService --migration false --skip
#rails g model Location --migration false --skip
#rails g model Vehicle --migration false --skip
#rails g model VehicleRole --migration false --skip
#rake db:migrate

# Add Active_Admin
echo 'Install ActiveAdmin'
# TODO: https://github.com/gregbell/active_admin/issues/2789
rails g active_admin:install --skip --skip-users # skips authentication
rake db:migrate

echo 'Register ActiveAdmin resources'
rails g active_admin:resource Client --skip
rails g active_admin:resource DailyLog --skip
rails g active_admin:resource Driver --skip
rails g active_admin:resource DriverStatus --skip
rails g active_admin:resource DriverVehicleRecord --skip
rails g active_admin:resource PositionRecord --skip
rails g active_admin:resource UserRole --skip
rails g active_admin:resource TrackerDevice --skip
rails g active_admin:resource TransportService --skip
rails g active_admin:resource Location --skip
rails g active_admin:resource User --skip
rails g active_admin:resource Vehicle --skip
rails g active_admin:resource VehicleRole --skip

echo 'Restore customizations'
git checkout app/models/user.rb
git checkout app/admin/
git checkout config/initializers/active_admin.rb
git checkout app/admin/footer.rb

# Populate
echo 'Almost done, last step, populate the DB.'
rake db:seed

if [ ! -f .env ] ; then
    echo "RACK_ENV=development" >>.env
    echo "PORT=3000" >> .env
fi

./scripts/install-bootstrap.sh
./scripts/install-libraries.sh

END=`date +%s`
ELAPSED=$(( $END - $START ))
echo 'elapsed: ' $ELAPSED / 60 ' mins.'

echo 'Start the server with:'
echo '    $> foreman start'

exit
#EOF
