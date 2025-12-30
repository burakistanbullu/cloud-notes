#!/bin/bash
set -e

docker pull burakistanbullu/simple-python-flask-app:latest

docker run -d --name simple-python-flask-app -p 5000:5000 burakistanbullu/simple-python-flask-app:latest
