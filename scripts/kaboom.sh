#!/bin/bash

set -e

# The script assumes that is executed from the root folder. #

# Shutdown app / server

rm app/admin/*
rm db/migrate/*

########### Clean ##########
rake db:drop
createdb -U ivan -O rails corzo_development

rails destroy active_admin:install
rails destroy active_admin:resource product

rails destroy devise user 

########### Build ##########

rails generate devise user 
rake db:migrate
# Manually add as accessible fields in the User model
rails generate migration add_role_id_to_users role_id:integer{1}
rails generate migration add_name_to_users name:string{50}
rails generate migration add_phone_number_to_users phone_number:string{16}
# Models
rails generate model role name:string{24}
rails generate model driver_status name:string{12}
rails generate model driver license:string cellphone:string{16} driver_status_id:integer user_id:integer
rails generate model vehicle plate:string model:string year:integer{4} driver_id:integer 
# if bash shell, use dots for precision, http://stackoverflow.com/a/14369874/7852
rails generate model service address:string suburb:string phone_number:string{16} latitude:decimal{9.6} longitude:decimal{9.6} schedule_at:datetime 
rake db:migrate

# Add Active_Admin
rails g active_admin:install --skip-users # skips user authentication entirely
rake db:migrate
# Edit file config/initializers/active_admin.rb 
# http://stackoverflow.com/a/14651686/7852
rails generate active_admin:resource User
rails generate active_admin:resource Role
rails generate active_admin:resource DriverStatus 
rails generate active_admin:resource Driver 
rails generate active_admin:resource Vehicle 
rails generate active_admin:resource Service 
# Enable strong parameters in app/admin/* 

# populate
#rake db:seed

cp -v config/initializers/active_admin.rb.bck config/initializers/active_admin.rb

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

exit
#EOF
