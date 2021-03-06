#!/usr/bin/env expect


# We use the venerable expect to drive signercli.py.
# https://en.wikipedia.org/wiki/Expect


# Get keystore, metadata_directory from the arguments to this script.
set keystore_directory [lindex $argv 0]
set repository_metadata_directory [lindex $argv 1]
set repository_configuration_file [lindex $argv 2]
set timestamp_password [lindex $argv 3]
# Set expect timeout to N seconds.
set timeout 2


spawn signercli.py --maketimestamp $keystore_directory
expect ".*Enter the metadata directory.*:"
send "$repository_metadata_directory\r"


expect ".*Enter the configuration file path.*:"
send "$repository_configuration_file\r"


expect ".*Enter the password for the timestamp role.*:"
send "$timestamp_password\r"


expect ".*Done..*"
