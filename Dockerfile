FROM ubuntu:22.04

RUN apt update && apt upgrade -y

RUN apt install python3 -y

RUN apt install net-tools -y
RUN echo "alias nt='netstat -lntu'" >> /etc/bash.bashrc
RUN echo "alias uu='apt update && apt upgrade -y'" >> /etc/bash.bashrc
RUN echo "alias uf='apt --fix-broken install -y'" >> /etc/bash.bashrc
RUN echo "alias uc='apt autoclean -y'" >> /etc/bash.bashrc
RUN echo "alias ur='apt autoremove -y'" >> /etc/bash.bashrc
RUN echo "alias c='clear'" >> /etc/bash.bashrc
RUN bash

RUN apt update && apt upgrade -y
RUN apt --fix-broken install -y
RUN apt autoclean -y
RUN apt autoremove -y