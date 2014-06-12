#!/bin/bash

set -e

# proxy remote requests
ember server --proxy http://0.0.0.0:5000

exit
#EOF
