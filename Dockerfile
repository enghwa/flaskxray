FROM python:3-alpine
MAINTAINER Eng-Hwa <enghwa@>

ARG BUILD_DATE
ARG VCS_REF

# Set labels (see https://microbadger.com/labels)
#LABEL org.label-schema.build-date=$BUILD_DATE \
#      org.label-schema.vcs-ref=$VCS_REF \
#      org.label-schema.vcs-url="https://github.com/nikos/python3-alpine-flask-docker"


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

# Expose the Flask port
EXPOSE 5000
ENV AWS_XRAY_DAEMON_ADDRESS=172.17.0.1:2000
ENV AWS_XRAY_CONTEXT_MISSING=LOG_ERROR
CMD [ "python", "./app.py" ]
