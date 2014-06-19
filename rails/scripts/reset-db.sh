#!/bin/bash

set -e

START=`date +%s`

# The script assumes that is executed from the root folder. #

echo 'Add custom fields to Devise User.'
# Manually add accessible fields in the User model
rails g migration add_active_to_users active:boolean
rails g migration add_name_to_users name:string{50}
rails g migration add_phone_number_to_users phone_number:string{16}
rails g migration add_user_role_id_to_users user_role:references
rails g migration add_authentication_token_to_users authentication_token:string

# Migrations
# http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column
#
# In a bash shell, use dots for precision type fields
# http://stackoverflow.com/a/14369874/7852
echo 'Generate migrations.'
rails g migration CreateClients default_location:references \
                                user:references --force
rails g migration CreateDailyLogs tracker_device:references \
                                  date:date --force
rails g migration CreateDrivers cellphone:string{16} \
                                driver_status:references \
                                license:string \
                                tracker_device:references \
                                user:references --skip
rails g migration CreateDriverStatuses name:string{12} --force
rails g migration CreateDriverVehicleRecord driver:references \
                                            vehicle:references \
                                            assigned_at:datetime --force
rails g migration CreatePositionRecords daily_log:references \
                                        latitude:decimal{18.15} \
                                        longitude:decimal{18.15} --force
rails g migration CreateUserRoles name:string{24} --force
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
rails g migration CreateLocations comments:string \
                                  latitude:decimal{18.15} \
                                  longitude:decimal{18.15} \
                                  address:string --force
rails g migration CreateVehicles model:string \
                                 plate:string \
                                 vehicle_role:references \
                                 tracker_device:references \
                                 year:integer{4} --force
rails g migration CreateVehicleRoles name:string --force

echo 'Migrate'
rake db:migrate

echo 'Now run: '
echo '  > rake db:seed'

END=`date +%s`
ELAPSED=$(( $END - $START ))
echo 'elapsed: ' $ELAPSED / 60 ' mins.'

exit
#EOF
