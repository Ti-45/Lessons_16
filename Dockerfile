# escape=` 
FROM python:3.10.6

WORKDIR /AppCod

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 48888

ENV FLASK_APP=port_48888.py
 
COPY port_48888.py ./
