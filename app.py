#! /usr/bin/env/python

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
  return "<h1>FlaskApp - (c) Virtua Enterprise Limited</h1>" \
  "FlaskApp, running in a Docker Container! :-)"


if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')

