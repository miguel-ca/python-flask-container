FROM python:3.11

LABEL maintainer="Gabriel Cerioni <gacerioni@gmail.com>"

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

RUN flask --app flaskr init-db

CMD [ "waitress-serve", "--call" , "flaskr:create_app"]
