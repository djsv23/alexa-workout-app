FROM python:3.6

LABEL maintainer "Daniel Steiner <djsteiner93@gmail.com>"

RUN apt-get update && pip install pip==9.0.3

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_ENV="docker"

EXPOSE 5000
