FROM python:2.7-slim
LABEL maintainer="joeclark@someemail.com"

ENV INSTALL_PATH /socialApp
RUN mkdir -p $INSTALL_PATH

WORKDIR ${INSTALL_PATH}

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "socialApp.app:create_app()"
