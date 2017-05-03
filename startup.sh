#!/bin/bash
set -e
python createconfig.py

jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='/notebooks'
exec "$@"