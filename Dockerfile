FROM python:3.9 

WORKDIR app

COPY app .

RUN pip install -r requirements.txt 

ARG FLASK_APP=app.py
ARG BUILD_VERSION=1.0

Expose 5000

ENTRYPOINT [ flask, run, --host=0.0.0.0 ]