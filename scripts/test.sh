#!/bin/bash

createdb -U ivan -O rails corzo_test
rake db:migrate RAILS_ENV=test
rake test:prepare

#EOF
