#!/bin/bash

# TST015: add group with identical members, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=group-with-identical-members
session addconf $invalid --type=group --members="foo,foo,foo"
if [ "$?" != 0 ]; then
    echo "Failure: group \"$invalid\" contains identical members.."
    failure="group \"$invalid\" contains identical members; $failure"
fi

echo "Removing leftover group.."
session delconf $invalid

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi