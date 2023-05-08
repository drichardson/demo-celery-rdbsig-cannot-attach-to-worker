# SIGUSR2 does not start RDB on workers

Steps to reproduce:

1. Run `./setup.sh` to create a virtual environment and install requirements.
2. In terminal 1, run `./start_rabbmitmq.sh` (requires docker)
3. In terminal 2, run `./start_celery.sh`

Now, in terminal 3, run:
1. `./list_celery_processes.sh` to get a list celery processing, including the main process and the workers. The worker PIDs will probably be numerically higher, and they will all have the same parent process ID.
2. Run `kill -USR2 PARENT_ID`. This works. You can then `telnet localhost 6899` to access the remote debugger on the main process.
3. At the `pdb` command prompt in `telnet`, run `cont` to have the parent process continue running.
4. Run `kill -USR2 CHILD_PID` where CHILD_PID is any of the child processes of the main process. This terminates the child with an error like:

```
[2023-05-08 16:19:35,234: ERROR/MainProcess] Process 'ForkPoolWorker-9' pid:32410 exited with 'exitcode 70'
```

