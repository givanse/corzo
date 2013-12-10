#/!bin/bash

# This should only be used if your Heroku deploy fails without it.
# rake assets:precompile

# heroku pg:reset DATABASE

git push heroku master

heroku run rake db:migrate

heroku run rake db:seed

#EOF
