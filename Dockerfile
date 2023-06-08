FROM ubuntu:22.04 AS stage_1

WORKDIR /home/dell/Lessons_16/app-code

RUN apt-get update && apt upgrade -y && apt install python3 -y

COPY port_48888.py ./

CMD [ "python3", "port_48888.py" ]