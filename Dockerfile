# escape=` 
FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y `
    net-tools `
    python3 `
    curl 
# python 3.10.6

COPY port_48888.py /

RUN apt --fix-broken install -y
RUN apt update && apt upgrade -y
RUN apt autoclean -y
RUN apt autoremove -y

RUN echo "alias nt='netstat -lntu'" >> /etc/bash.bashrc
RUN echo "alias uu='apt update && apt upgrade -y'" >> /etc/bash.bashrc
RUN echo "alias uf='apt --fix-broken install -y'" >> /etc/bash.bashrc
RUN echo "alias uc='apt autoclean -y'" >> /etc/bash.bashrc
RUN echo "alias ur='apt autoremove -y'" >> /etc/bash.bashrc
RUN echo "alias c='clear'" >> /etc/bash.bashrc
RUN echo "alias pp='python3 port_48888.py'" >> /etc/bash.bashrc
