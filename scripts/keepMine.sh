#!/bin/bash

# http://stackoverflow.com/a/930495/7852

# A simple Copy/Merge driver, it does nothing.

# Add the driver:
# git config merge.keepMine.name "always keep mine during merge"
# git config merge.keepMine.driver "scripts/keepMine.sh %O %A %B"

# I want to keep MY version when there is a conflict
# Nothing to do: %A (the second parameter) already contains my version
# Just indicate the merge has been successfully "resolved" with the exit status

echo '   merge: '$1
echo '    mine: '$2
echo 'ignoring: '$3

exit 0
#EOF
