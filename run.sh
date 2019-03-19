#!/bin/sh
echo '[INFO] in the run.sh script'
echo "[INFO] should be able to see the value of SOME_VAR=$SOME_VAR"
echo "[INFO] can we also see MANDATORY_ARG=$MANDATORY_ARG or OPTIONAL_ARG=$OPTIONAL_ARG ?"
echo "[WARN] this line is going to stderr" >&2

