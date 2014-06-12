#!/bin/bash

set -e

sudo service postgresql start 

foreman start

exit
#EOF
