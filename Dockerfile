FROM ubuntu
LABEL Robert Jonczy (robert.jonczy@gmail.com)

RUN apt-get update && apt-get install vim iputils-ping snmp less dnsutils net-tools wget -y

ADD sim.sh /sim.sh
CMD ["/sim.sh"]
