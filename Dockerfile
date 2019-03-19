FROM alpine:3.8
LABEL author="Tom Saleeba"
LABEL description="sandbox for playing with cron on alpine in docker"

ADD entrypoint.sh run.sh /app/
RUN chmod +x /app/*.sh
WORKDIR /app/

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
CMD [""]

