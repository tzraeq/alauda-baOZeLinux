FROM index.alauda.cn/alauda/ubuntu
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
VOLUME /data
EXPOSE 21 22 80 3306 4443 6800 8005 8009 8080 8888
ENV ROOT_PASS tzraeqww
COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y --force-yes install nano
RUN apt-get -y --force-yes install supervisor
RUN apt-get -y --force-yes install git
RUN apt-get -y --force-yes install golang
RUN apt-get -y --force-yes install gcc automake autoconf libtool make

COPY supervisord.conf /etc/supervisor/supervisord.conf

COPY run.sh /run.sh
RUN chmod 777 run.sh