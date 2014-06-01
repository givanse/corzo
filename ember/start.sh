#!/bin/bash

set -e

# proxy remote requests
ember server --proxy http://localhost:5000

exit
#EOF
