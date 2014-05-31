#!/bin/bash

set -e

START=`date +%s`

# The script assumes that is executed from the root folder. #

# Shutdown app / server

rm -rv db/migrate/ || true
mkdir -v db/migrate

########### Clean ##########
rake db:drop
createdb -U ivan -O ivan corzo_development

rails destroy active_admin:install
rails destroy active_admin:resource product

rails destroy devise user 

########### Build ##########

echo 'Create Devise User.'
rails g devise user 
rake db:migrate
echo 'Add custom fields to Devise User.'
# Manually add accessible fields in the User model
rails g migration add_active_to_users active:boolean
rails g migration add_name_to_users name:string{50}
rails g migration add_phone_number_to_users phone_number:string{16}
rails g migration add_role_id_to_users role:references
rails g migration add_tracker_device_id_to_users \
                  tracker_device:references

# Migrations
# http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column
#
# In a bash shell, use dots for precision type fields
# http://stackoverflow.com/a/14369874/7852
echo 'Generate migrations.'
rails g migration CreateClients tservice_location_orig:references \
                                user:references --force
rails g migration CreateDailyLogs tracker_device:references \
                                  date:date --force
rails g migration CreateDrivers cellphone:string{16} \
                                driver_status:references \
                                license:string \
                                user:references --skip
rails g migration CreateDriverStatuses name:string{12} --force
rails g migration CreateDriversVehicle driver:references \
                                       vehicle:references \
                                       assigned_at:datetime --force
rails g migration CreatePositionRecords daily_log:references \
                                        latitude:decimal{18.15} \
                                        longitude:decimal{18.15} --force
rails g migration CreateRoles name:string{24} --force
rails g migration CreateTrackerDevices description:string --force
rails g migration CreateTransportServices client:references \
                                          client_name:string{48} \
                                          comments:string \
                                          fare:decimal{8.3} \
                                          driver:references \
                                          schedule_at:datetime \
                                          tservice_location_orig:references \
                                          tservice_location_dest:references \
                                          --force
rails g migration CreateTransportServiceLocations comments:string \
                                                  latitude:decimal{18.15} \
                                                  longitude:decimal{18.15} \
                                                  address:string --force
rails g migration CreateVehicles model:string \
                                 plate:string \
                                 vehicle_role:references \
                                 tracker_device:references \
                                 year:integer{4} --force
rails g migration CreateVehicleRoles name:string --force

# Models
echo 'Generate models.'
rails g model Client --migration false --skip 
rails g model DailyLog --migration false --skip
rails g model Driver --migration false --skip 
rails g model DriverStatus --migration false --skip
rails g model DriversVehicle --migration false --skip
rails g model PositionRecord --migration false --skip
rails g model Role --migration false --skip
rails g model TrackerDevice --migration false --skip
rails g model TransportService --migration false --skip 
rails g model TransportServiceLocation --migration false --skip 
rails g model Vehicle --migration false --skip
rails g model VehicleRole --migration false --skip 

rake db:migrate

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
rails g active_admin:resource DriversVehicle --skip 
rails g active_admin:resource PositionRecord --skip 
rails g active_admin:resource Role --skip  
rails g active_admin:resource TrackerDevice --skip  
rails g active_admin:resource TransportService --skip  
rails g active_admin:resource TransportServiceLocation --skip  
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
