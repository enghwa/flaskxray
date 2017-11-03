FROM python:3-alpine
MAINTAINER Eng-Hwa <enghwa@>

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
