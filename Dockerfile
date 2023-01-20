FROM gcc:latest
RUN apt-get update && apt-get install -y openssh-server && apt-get install -y nano && apt-get install -y sudo && apt-get -y install cron
RUN useradd -m flagman --shell /bin/bash && mkdir /root/priv
RUN echo "flagman:Fl4ggrZ" | chpasswd
RUN echo "flagman ALL=NOPASSWD:/home/flagman/tartynov" >> /etc/sudoers
ADD cron-mv /etc/cron.d
ADD flag.txt /root
ADD tarty.c /root/priv
#ADD payload /root/priv
RUN cd /root/priv && gcc -fno-stack-protector -z execstack -no-pie tarty.c -o tartynov && cp tartynov /home/flagman && rm tarty.c
ENTRYPOINT cron && service ssh start && tail -f /dev/null
