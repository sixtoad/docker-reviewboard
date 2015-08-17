FROM debian:wheezy
MAINTAINER sixto.cantolla@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-pip python-dev python-psycopg2 git subversion mercurial python-svn python-ldap

RUN easy_install \
    -f http://downloads.reviewboard.org/releases/ReviewBoard/2.5/ \
    -U ReviewBoard

RUN pip install -U uwsgi

ADD start.sh /start.sh
ADD uwsgi.ini /uwsgi.ini
ADD shell.sh /shell.sh

RUN chmod +x start.sh shell.sh

VOLUME ["/.ssh", "/media/"]

EXPOSE 8000

CMD /start.sh
