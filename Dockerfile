FROM openjdk:13-jdk-alpine

LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigodantas.91@gmail.com"
LABEL web="napalm23zero.github.io"

# Update image and install needed packages
RUN apk add --update 
RUN apk add --no-cache git python

RUN mkdir /app

CMD tail -f /dev/null

EXPOSE 8080