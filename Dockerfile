FROM eclipse-temurin:17-jre

ADD https://downloads.sourceforge.net/project/davmail/davmail/6.2.2/davmail-6.2.2-3546.zip /tmp/davmail.zip

RUN useradd davmail && \
  mkdir /usr/local/davmail && \
  apt update && apt install -y unzip && \
  unzip -q /tmp/davmail.zip -d /usr/local/davmail && \
  rm /tmp/davmail.zip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

VOLUME        /etc/davmail
VOLUME        /var/log/davmail

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD ["/usr/local/davmail/davmail", "/etc/davmail/davmail.properties"]
