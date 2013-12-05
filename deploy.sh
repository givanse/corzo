#/!bin/bash

git push heroku master
heroku run rake db:migrate

#EOF
