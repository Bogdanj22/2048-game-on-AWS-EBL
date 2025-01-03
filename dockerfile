FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]