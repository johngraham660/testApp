#! /usr/bin/env/python

import socket
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():

    hostname = socket.gethostname()

    message = "<h1>FlaskApp - (c) Virtua Enterprise Limited</h1> \
               FlaskApp, running in Container \
               <BR> \
               Hostname: %s" % hostname

    return message


if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')

