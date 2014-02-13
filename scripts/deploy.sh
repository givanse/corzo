#/!bin/bash

git push -f heroku master

# destroy

heroku pg:reset DATABASE

heroku run rake assets:clean

# build

heroku run rake db:migrate

# This should only be used if your Heroku deploy fails without it.
heroku run rake assets:precompile

echo 'Last step, seed the DB.'
heroku run rake db:seed

#EOF
