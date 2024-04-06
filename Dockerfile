FROM alpine:edge
LABEL MAINTAINER="waynecommand"

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash nodejs-current npm nginx git; \
    rm -rf /var/cache/apk/*

# RUN chmod +x entrypoint.sh

# init snapdrop project
RUN git clone https://github.com/RobinLinus/snapdrop.git
RUN mkdir -p /root/snapdrop; mv ./snapdrop /root/

ADD config/default.conf /etc/nginx/conf.d/default.conf

# setting server
WORKDIR "/root/snapdrop/server"
RUN cd /root/snapdrop/server; npm i

ENV PUID=0 PGID=0 UMASK=022
EXPOSE 10000

CMD [ "/entrypoint.sh" ]