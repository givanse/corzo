#/!bin/bash

# This should only be used if your Heroku deploy fails without it.
# rake assets:precompile

git push heroku master
heroku run rake db:migrate

#EOF