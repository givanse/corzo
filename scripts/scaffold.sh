#!/bin/bash

set -e

# Shutdown app

# clean
rake db:drop
createdb -U ivan -O rails corzo_development

rails destroy devise user 
rails destroy scaffold role name:string{24}
rails destroy migration add_role_id_to_users 
rails destroy migration add_name_to_users name:string
rails destroy migration add_phone_number_to_users phone_number:integer

# build
rails generate devise user 
rake db:migrate

rails generate scaffold role name:string{24}

rails generate migration add_role_id_to_users role_id:integer
rails generate migration add_name_to_users name:string
rails generate migration add_phone_number_to_users phone_number:integer
# Manually add as accessible fields in the User model
rake db:migrate

# Add Active_Admin
rails g active_admin:install --skip-users # skips user authentication entirely
rake db:migrate
# Edit file config/initializers/active_admin.rb 
# http://stackoverflow.com/a/14651686/7852
rails generate active_admin:resource User

# populate
rake db:seed

rails generate scaffold_controller user id role_id name phone_number email encrypted_password reset_password_token reset_password_sent_at remember_created_at sign_in_count current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip created_at updated_at

echo 'Relationships, manually add:
  app/models/role.rb
    has_many :users
  app/models/user.rb
    belongs_to :role'

exit
#EOF
