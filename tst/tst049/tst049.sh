#!/bin/bash

# TST049: check service that is not on, state should be off
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Checking state of service that is off.."
result=$(session state $test_stopped_service)
echo $result

if [[ ! "$result" =~ "off" ]]; then
    echo "Failure: state check did not return off.."
    failure="state check failed; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
