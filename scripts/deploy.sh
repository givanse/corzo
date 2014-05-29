#/!bin/bash

git merge rails
source ~/.rvm/scripts/rvm
bundle update
bundle install

git add Gemfile.lock 
git add app/assets
git commit -m 'update Gemfile.lock & add libraries'

git push -f heroku heroku:master

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
