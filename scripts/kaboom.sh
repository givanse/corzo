#!/bin/bash

set -e

START=`date +%s`

# The script assumes that is executed from the root folder. #

# Shutdown app / server

rm -rv db/migrate/
mkdir -v db/migrate

########### Clean ##########
rake db:drop
createdb -U ivan -O rails corzo_development

rails destroy active_admin:install
rails destroy active_admin:resource product

rails destroy devise user 

########### Build ##########

echo 'Create Devise User.'
rails generate devise user 
rake db:migrate
echo 'Add custom fields to Devise User.'
# Manually add as accessible fields in the User model
rails generate migration add_role_id_to_users role:references
rails generate migration add_name_to_users name:string{50}
rails generate migration add_phone_number_to_users phone_number:string{16}

# Models
# In a bash shell, use dots for precision type fields
# http://stackoverflow.com/a/14369874/7852
echo 'Generate models.'
rails generate model Role name:string{24} --skip
rails generate model DriverStatus name:string{12} --skip
rails generate model Driver license:string cellphone:string{16} driver_status:references user:references --skip
rails generate model Vehicle plate:string model:string year:integer{4} driver:references --skip
rails generate model Service address:string suburb:string references:string phone_number:string{16} latitude:decimal{9.6} longitude:decimal{9.6} schedule_at:datetime --skip
rake db:migrate

# Add Active_Admin
echo 'Install ActiveAdmin'
rails generate active_admin:install --skip --skip-users # skips user authentication entirely
rake db:migrate

echo 'Register ActiveAdmin resources'
rails generate active_admin:resource User --skip
rails generate active_admin:resource Role --skip  
rails generate active_admin:resource DriverStatus --skip 
rails generate active_admin:resource Driver --skip 
rails generate active_admin:resource Vehicle --skip 
rails generate active_admin:resource Service --skip 
#Enable strong parameters in app/admin/* (???) 

echo 'Restore customizations'
# Edit file config/initializers/active_admin.rb 
# http://stackoverflow.com/a/14651686/7852
# restore config file
cp -v config/initializers/active_admin.rb.bck config/initializers/active_admin.rb

git checkout app/admin/footer.rb

# Populate
echo 'Almost done, last step, populate the DB.'
rake db:seed

echo 'Next steps:
1.- Relationships, manually add:
  app/models/role.rb
    has_many :users
  app/models/user.rb
    belongs_to :role

  app/models/user.rb
    has_one :driver
  app/models/driver.rb
    belongs_to :user

  app/models/driver_status.rb
    has_many :drivers
  app/models/driver.rb
    belongs_to :driver_status

  app/models/driver.rb
    has_one :vehicle
  app/models/vehicle.rb
    belongs_to :driver
'
END=`date +%s`
ELAPSED=$(( $END - $START ))
echo 'elapsed: '$ELAPSED/60' mins.'

exit
#EOF
