FROM alpine:3.7
LABEL author="Tom Saleeba"
LABEL description="sandbox for playing with cron on alpine in docker"

ADD entrypoint.sh run.sh /app/
RUN chmod +x /app/*.sh
WORKDIR /app/

# FIXME remove
#RUN echo '* * * * * SOME_VAR=defaultvalue sh /run.sh > /proc/1/fd/1 2> /proc/1/fd/2' > /var/spool/cron/crontabs/root
#ENTRYPOINT ["crond", "-l", "2", "-f"]

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
CMD [""]

