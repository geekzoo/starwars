FROM alpine:latest
RUN apk add --no-cache curl jq bash grep pv gzip gawk
COPY star_Wars.sh /
#COPY scrap.sh /
COPY data.sh /
RUN chmod +x star_Wars.sh
#RUN chmod +x scrap.sh
ENTRYPOINT ./star_Wars.sh
