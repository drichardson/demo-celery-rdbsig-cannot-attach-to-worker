#!/bin/bash

source venv/bin/activate

# RDB example taken from https://docs.celeryq.dev/en/stable/userguide/debugging.html#enabling-the-break-point-signal
CELERY_RDBSIG=1 celery worker -l INFO
