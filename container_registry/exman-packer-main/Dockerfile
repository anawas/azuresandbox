FROM openjdk:16.0.2-slim-buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install supervisor openssh-server nginx bash curl -y

COPY supervisord.conf /etc/supervisord.conf

WORKDIR /
ADD ExManRest.jar ExManRest.jar
ADD load-expeditions.sh load-expeditions.sh
EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
