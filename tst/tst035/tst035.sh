#!/bin/bash

# TST035: modify group, re-add item, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Store old group entry.
old="$(session list hostgroup --verbose)"

# Remove item.
echo "Adding item to group.."
session modconf hostgroup --type=group --members=tst016,tst018

# Store new group entry.
new="$(session list hostgroup --verbose)"

echo "Checking if group was changed correctly.."
if [ "$old" = "$new" ]; then
    echo "Failure: group remained the same:"
    echo "Failure: old: $old"
    echo "Failure: new: $new"
    failure="group remained the same; $failure"
else
    echo "Success: group changed:"
    echo "Success: old: $old"
    echo "Success: new: $new"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
