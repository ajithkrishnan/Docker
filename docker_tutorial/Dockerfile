FROM ros:kinetic
MAINTAINER Ajith Krishnan <ajithkrishnanbm@gmail.com>

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y vim  


RUN  mkdir -p myapp/
WORKDIR myapp/
COPY . .

RUN apt-get install -y python python-setuptools python-pip
# RUN pip install -r requirements.txt

# CMD python app.py

RUN mkdir myvol/
RUN touch text.txt
RUN mv text.txt ./myvol/ 
# VOLUME /home/mark_one/Docker:/home/myapp/myvol


