# escape=` 
# Stage 1: Create a lightweight development image
FROM python:3.9-slim AS stage_1

WORKDIR /home/dell/Lessons_16/app-code

COPY port_48888.py ./
COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 48888

# Stage 2: Create a lightweight production image
FROM python:3.9-slim AS stage_2

WORKDIR /home/dell/Lessons_16/app-code

COPY --from=stage_1 /home/dell/Lessons_16/app-code ./

CMD [ "python3", "port_48888.py" ]
