FROM debian:buster

RUN apt-get update && apt-get install -y curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor --silent

RUN chmod +x /usr/bin/cadvisor

ENTRYPOINT cadvisor -logtostderr --port=2000