FROM ubuntu:22.04

WORKDIR /app-code

RUN apt update && apt upgrade -y && apt install python3 -y

COPY ./app-code/ /app-code/

CMD [ "python3", "port_48888.py" ]