#!/bin/bash

set -e

rake db:drop

rails generate devise user 
rake db:migrate

rails generate scaffold role name:string{24}
rails generate migration AddRoleIdToUsers
rails generate migration add_name_to_users name:string
rails generate migration add_phone_number_to_users phone_number:integer
rake db:migrate


rake db:seed

rails generate scaffold_controller user id role_id name phone_number email encrypted_password reset_password_token reset_password_sent_at remember_created_at sign_in_count current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip created_at updated_at

# Relationships, manually add:
#   app/models/role.rb
#     has_many :users
#   app/models/user.rb
#     belongs_to :role

exit
#EOF
