#!/bin/bash
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
set -e

echo $ENV
# [ $ENV = 'UNIT' ]スペースはちゃんと取らないと認識してくれない。。！

if [ $ENV = 'DEV' ]; then
    echo "Running Development Server"
    exec python "identidock.py"
elif [ $ENV = 'UNIT' ]; then
    echo "Running Unit tests."
    exec python "tests.py"
else
    echo "Running Production server."
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
     --callable app --stats 0.0.0.0:9191
fi
