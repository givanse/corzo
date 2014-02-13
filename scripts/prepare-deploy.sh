#!/bin/bash

set -e

git branch -D master || true
git checkout -b master

# Assumes that it will be executed from the root folder, not scripts/
driver_script="keepMine.sh"

# Prepare merge driver
git config merge.keepMine.name "always keep mine during merge"
git config merge.keepMine.driver $driver_script" %O %A %B"

# Place the driver in PATH
driver_path=`pwd`'/scripts/'
export PATH=$driver_path:$PATH

git merge --no-commit rails

bundle install

./scripts/reset.sh

git add Gemfile.lock
git reset HEAD dia/
git reset HEAD .secret
git reset HEAD scripts/
git rm -r --cache scripts/
git add scripts/deploy.sh
git commit -m 'keep only deploy.sh'

git add app/assets
git add public/assets
git commit -m 'add assets (JS, CSS, images)'

git add db/migrate

git commit -m 'add migrations'

echo "Dont't forget to update:
    - app secret
    - contact email"

exit 0
#EOF
