#FROM ubuntu:focal
#
#MAINTAINER Ruslan
#
#ENV TZ=Europe/Kiev
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#
#RUN apt-get -yqq update
#RUN apt-get -yqq install python3.8
#RUN apt-get -yqq install python3-pip
#
#RUN apt-get update && apt-get install -y software-properties-common postgresql-12 postgresql-client-12 postgresql-contrib-12
#USER postgres
#
#RUN    /etc/init.d/postgresql start &&\
#    psql --command "CREATE USER flaskuser WITH SUPERUSER PASSWORD 'pass';" &&\
#    createdb -O flaskuser flaskdb
#
#RUN echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf
#RUN service postgresql restart
#
#RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/12/main/pg_hba.conf
#
#RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf
#
#
#ENV PROJECT_DIR /app
#
#WORKDIR ${PROJECT_DIR}
#
#COPY requirements.txt ${PROJECT_DIR}/
#
#RUN pip install -r requirements.txt
#
#COPY . ${PROJECT_DIR}
#
#EXPOSE 5000
#
#ENTRYPOINT ["python3"]
#
#CMD ["wsgi.py"]
#CMD ["/usr/lib/postgresql/12/bin/postgres", "-D", "/var/lib/postgresql/12/main", "-c", "config_file=/etc/postgresql/12/main/postgresql.conf"]


FROM python:3.8-alpine

RUN apk add --no-cache gcc musl-dev linux-headers
RUN apk add build-base
RUN apk add postgresql-dev gcc

ENV PROJECT_DIR /app

WORKDIR ${PROJECT_DIR}

COPY requirements.txt ${PROJECT_DIR}/

RUN pip3 install -r requirements.txt

COPY . ${PROJECT_DIR}

EXPOSE 5000

CMD ["python3", "wsgi.py", "--host", "0.0.0.0"]