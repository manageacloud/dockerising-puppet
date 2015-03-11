#!/bin/bash
PID=$(sudo docker inspect --format {{.State.Pid}} web )
sudo /tmp/nsenter --target $PID --mount --uts --ipc --net --pid

