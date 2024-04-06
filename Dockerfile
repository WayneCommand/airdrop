FROM alpine:edge
LABEL MAINTAINER="waynecommand"

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash nodejs-current nginx git; \
    chmod +x /entrypoint.sh && \
    rm -rf /var/cache/apk/*


# init snapdrop project
RUN git clone https://github.com/RobinLinus/snapdrop.git
COPY ./snapdrop /app/airdrop
COPY ./config/default.conf /etc/nginx/conf.d/default.conf

# setting server
WORKDIR "/app/airdrop/server"
RUN npm i

ENV PUID=0 PGID=0 UMASK=022
EXPOSE 10000

CMD [ "/entrypoint.sh" ]