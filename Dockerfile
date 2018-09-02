FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev && \
    apt-get clean

ENV APP_ROOT=/app
ENV PATH=${PATH}:${APP_ROOT}

COPY requirements.txt ${APP_ROOT}/requirements.txt
RUN pip install -r ${APP_ROOT}/requirements.txt

COPY . ${APP_ROOT}

RUN chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

RUN adduser --disabled-password --gecos 'Python App User' --uid 1001 pyuser

USER 1001
WORKDIR ${APP_ROOT}
ENTRYPOINT [ "uid_entrypoint" ]


