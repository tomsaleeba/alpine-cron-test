#!/bin/sh
set -euxo pipefail
thisDir=`pwd`

# assert env vars exist with bash parameter expansion (http://wiki.bash-hackers.org/syntax/pe#display_error_if_null_or_unset)
: ${MANDATORY_ARG:?}
CRON_SCHEDULE='* * * * *'
export OPTIONAL_ARG=${OPTIONAL_ARG:-somedefaultvalue}

echo "$CRON_SCHEDULE SOME_VAR=something sh $thisDir/run.sh" > /var/spool/cron/crontabs/root
crond -f # supplying log level (`-f 2`) doesn't seem to make a difference :S

