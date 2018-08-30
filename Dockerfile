FROM ubuntu:18.04

MAINTAINER John Graham "john.graham@virtua-enterprise.co.uk"

# ============================================
# Update repos and install python dependencies
# ============================================
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# ============================================= 
# Copy requirements.txt file into the container
# ============================================= 
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]


