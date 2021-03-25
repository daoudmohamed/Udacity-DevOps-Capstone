FROM python:3.8-slim-buster 

WORKDIR /app

COPY app .

RUN pip install -r requirements.txt 

ARG version

ENV BUILD_VERSION=$version

RUN echo $version

RUN echo $CIRCLE_SHA1

Expose 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]