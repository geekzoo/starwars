#FROM alpine:latest
FROM ubuntu:19.04
#RUN apk add --no-cache curl jq bash grep pv gzip gawk
RUN apt-get update
RUN apt -y install curl jq bash grep pv gzip gawk
COPY star_Wars.sh /
#COPY scrap.sh /
COPY data.sh /
RUN chmod +x star_Wars.sh
#RUN chmod +x scrap.sh
ENTRYPOINT ./star_Wars.sh
