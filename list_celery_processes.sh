#!/bin/bash

echo PID, PARENT PID, COMMAND
ps -wo pid,ppid,command|grep celery|grep -v grep|grep -v start_celery

