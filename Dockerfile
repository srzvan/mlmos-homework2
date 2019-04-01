FROM centos:7

RUN yum -y update && yum -y install git yum-utils
RUN yum -y groupinstall development
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u
RUN yum -y install python36u-pip
RUN pip3.6 install --upgrade pip
RUN yum -y install python36u-devel
RUN pip3.6 install butterfly
# COPY ./docker-entrypoint.sh /
COPY ./pywumpus.sh /
#RUN chmod u+x /docker-entrypoint.sh
RUN chmod u+x /pywumpus.sh
WORKDIR /opt
RUN git clone https://github.com/lanhel/pywumpus.git
# WORKDIR /opt/pywumpus/
EXPOSE 57575

#ENTRYPOINT ["/docker-entrypoint.sh"]

ENTRYPOINT ["butterfly.server.py"]
CMD ["--host=0.0.0.0", "--unsecure", "--i_hereby_declare_i_dont_want_any_security_whatsoever", "--shell=/pywumpus.sh"]
