# escape=` 
# Stage 1: Create a lightweight development image
FROM ubuntu:22.04 AS build

RUN apt update && apt upgrade -y && apt install -y `
    nginx `
    python3 `
    python3-pip

WORKDIR /home/dell/Lessons_16/AppCode

COPY port_48888.py ./

RUN pip3 run build

#COPY ./ /home/dell/Lessons_16/AppCode/multistej

EXPOSE 48888

# Stage 2: Create a lightweight production image
FROM ubuntu:22.04 AS PD

#RUN apt update && apt upgrade -y

WORKDIR /home/dell/Lessons_16/AppCode

COPY --from=build /home/dell/Lessons_16/AppCode .

CMD [ "pip3", "start" ]
