FROM ubuntu:22.04

RUN apt update && apt upgrade -y

RUN apt install nginx -y
RUN service nginx start
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]

RUN apt install iputils-ping

RUN apt install net-tools -y
RUN echo "alias nt='netstat -lntu'" >> /etc/bash.bashrc
RUN bash

RUN echo "Bari Luys" > /var/www/html/index.html