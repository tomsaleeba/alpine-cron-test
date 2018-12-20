#!/bin/sh
set -e
thisDir=`pwd`

# assert env vars exist with bash parameter expansion (http://wiki.bash-hackers.org/syntax/pe#display_error_if_null_or_unset)
: ${MANDATORY_ARG:?}
CRON_SCHEDULE='* * * * *'
export OPTIONAL_ARG=${OPTIONAL_ARG:-somedefaultvalue}

# This doesn't work because you get "permission denied" when trying to access another process's fd
#  redirectToDockerLogs='> /proc/1/fd/1 2> /proc/1/fd/2'

# I didn't think this should work because /dev/stdout is actually /proc/self/fd/1, and self != pid 1 so how does docker see it?
redirectToDockerLogs="> /dev/stdout 2> /dev/stderr"

echo "$CRON_SCHEDULE SOME_VAR=something sh $thisDir/run.sh $redirectToDockerLogs" > /var/spool/cron/crontabs/root
crond -l 2 -f

