#!/bin/bash

set -e

# Shutdown app

########### Clean ##########
rake db:drop
createdb -U ivan -O rails corzo_development

rails destroy active_admin:install
rails destroy active_admin:resource product

rails destroy devise user 

rake db:migrate VERSION=0

#rails destroy scaffold_controller user
#rails destroy scaffold role

########### Build ##########

rails generate devise user 
rake db:migrate
# Manually add as accessible fields in the User model
rails generate migration add_role_id_to_users role_id:integer
rails generate migration add_name_to_users name:string
rails generate migration add_phone_number_to_users phone_number:integer
# Models
rails generate model role name:string{24}
rails generate model driver_status name:string{12}
rails generate model driver license:string cellphone:integer driver_status_id:integer
rails generate model vehicle plate:string model:string year:integer  
# if bash shell, use dots for precision, http://stackoverflow.com/a/14369874/7852
rails generate model service address:string suburb:string phone_number:integer latitude:decimal{9.6} longitude:decimal{9.6} schedule_at:datetime 
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
rake db:seed

echo 'Relationships, manually add:
  app/models/role.rb
    has_many :users
  app/models/user.rb
    belongs_to :role'

exit
#EOF