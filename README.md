> A sandbox for playing with cron on alpine in docker.

Getting the logs from cron jobs running in a Docker container doesn't seem to be as easy as I expect. I want them to be
written to stdout and stderr so `docker logs` can see them. I also want to uphold docker recommendations about having a
single process per container so backgrounding cron and then tailing a log file in the foreground doesn't seem right.

This example runs cron in the foreground and captures the output from the jobs that are run.

## Quick start

  1. run the container with a TTY attached with:
      ```bash
      docker-compose up --build
      ```
  1. or, run the container in the background and tail the logs:
      ```bash
      docker-compose up --build -d && docker logs -f ts_act
      ```
  1. to clean up
      ```bash
      docker-compose down
      ```

The cron schedule is all stars (`*`) so it'll run every minute. Once you've started the container, wait until the change
of the minute and you should see some log output.

## Example output

The output should look like the following. The `entrypoint.sh` script will echo the commands it runs, then when the cron
job runs, we'll see the stdout and stderr output.
```
ts_act | + pwd
ts_act | + thisDir=/app
ts_act | + : supplied
ts_act | + CRON_SCHEDULE='* * * * *'
ts_act | + export 'OPTIONAL_ARG=somedefaultvalue'
ts_act | + echo '* * * * * SOME_VAR=something sh /app/run.sh'
ts_act | + crond -f
ts_act | [WARN] this line is going to stderr
ts_act | [INFO] in the run.sh script
ts_act | [INFO] should be able to see the value of SOME_VAR=something
ts_act | [INFO] can we also see MANDATORY_ARG=supplied or OPTIONAL_ARG=somedefaultvalue ?
```

