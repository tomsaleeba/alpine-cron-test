A sandbox for playing with cron on alpine in docker

## Quick start

  1. build the container with:
      ```bash
      ./docker-build.sh
      ```
  1. run the container with a TTY attached with:
      ```bash
      ./docker-run-with-tty.sh
      ```
  1. or, run the container in the background and tail the logs:
      ```bash
      ./docker-run-detached.sh
      ```

The cron schedule is all stars (`*`) so it'll run every minute. Once you've started the container, wait until the change of the minute and you should see some log output.

