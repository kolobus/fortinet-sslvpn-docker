FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget tar ppp expect openssh-client sshpass

RUN wget http://cdn.software-mirrors.com/forticlientsslvpn_linux_4.4.2328.tar.gz
RUN tar -xzvf forticlientsslvpn_linux_4.4.2328.tar.gz

WORKDIR /
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
