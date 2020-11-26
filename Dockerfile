FROM ubuntu:18.04

LABEL DESCRIPTION="API Flask"
# Application files
WORKDIR /app
COPY . /app

# OS specific updates
RUN apt-get -q update --fix-missing
RUN apt-get -q install -y apt-utils net-tools iputils-ping 
RUN apt-get -q install -y python3 python3-dev python3-pip nginx

# Python specific updates
RUN pip3 install --upgrade pip
RUN pip3 install uwsgi
RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD flask run --host=0.0.0.0 --port=5000