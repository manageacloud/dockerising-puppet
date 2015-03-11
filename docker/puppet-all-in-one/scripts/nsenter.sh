#!/bin/bash
PID=$(sudo docker inspect --format {{.State.Pid}} puppet_wordpress_all_in_one_run )
sudo /tmp/nsenter --target $PID --mount --uts --ipc --net --pid

