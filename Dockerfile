FROM anapsix/alpine-java

ENV JAVA_ARGS="-Xmx3G -Xms2G"
ENV SERVER_OP=""

RUN apk add unzip
RUN apk add wget

RUN mkdir /minecraft
RUN wget -O /tmp/tekkit.zip http://servers.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.9g-2.zip
RUN unzip /tmp/tekkit.zip -d /minecraft/

ADD ./launch.sh /minecraft/launch.sh
RUN chmod +x /minecraft/launch.sh

EXPOSE 25565

WORKDIR /minecraft
ENTRYPOINT ["/minecraft/launch.sh"]
