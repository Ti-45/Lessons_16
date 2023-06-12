FROM ubuntu:22.04

WORKDIR /home/dell/Lessons_16/app-code

RUN apt update && apt upgrade -y && apt install python3 -y

COPY port_48888.py ./

CMD [ "python3", "port_48888.py" ]