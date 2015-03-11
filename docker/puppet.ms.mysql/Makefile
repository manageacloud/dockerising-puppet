build_container:
	sudo docker build -t puppet_ms_mysql .

bash:
	sudo docker run --name db -p 3306:3306 -t -i puppet_ms_mysql /bin/bash

bash_phusion:
	sudo docker run -t -i phusion/baseimage /bin/bash

delete_container:
	sudo docker rm db

ssh:
	ssh root@localhost -o "StrictHostKeyChecking no" -p 2200 -i ssh-insecure-key

create_nsenter:
	sudo docker run --rm jpetazzo/nsenter cat /nsenter > /tmp/nsenter && chmod +x /tmp/nsenter

nsenter: 
	bash scripts/nsenter.sh

remove_all_containers:
	bash scripts/remove_all_containers.sh

remove_all_images:
	bash scripts/remove_all_images.sh

run_ms_mysql:
	sudo docker run --name db -p 3306 -d puppet_ms_mysql /usr/sbin/mysqld --bind-address=0.0.0.0

push:
	sudo docker tag puppet_ms_mysql registry.manageacloud.com.au:5000/puppet_ms_mysql
	sudo docker push registry.manageacloud.com.au:5000/puppet_ms_mysql
