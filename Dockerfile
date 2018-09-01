FROM ubuntu:18.04

MAINTAINER John Graham "john.graham@virtua-enterprise.co.uk"

# ============================================
# Update repos and install python dependencies
# ============================================
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev && \
    apt-get clean

ENV APP_ROOT=/app
ENV PATH=${PATH}:${APP_ROOT} HOME=${APP_ROOT}

RUN adduser --disabled-password --gecos '' --uid 1001 pyuser

COPY . ${APP_ROOT}

RUN chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

RUN pip install -r ${APP_ROOT}/requirements.txt

USER 1001
WORKDIR ${APP_ROOT}
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
