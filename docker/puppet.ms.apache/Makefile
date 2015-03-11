build_container:
	sudo docker build -t puppet_ms_apache .

bash:
	sudo docker run --name web -p 1800:80 -t -i --link db:db puppet_ms_apache /bin/bash

delete_container:
	sudo docker rm web

create_nsenter:
	sudo docker run --rm jpetazzo/nsenter cat /nsenter > /tmp/nsenter && chmod +x /tmp/nsenter

nsenter: 
	bash scripts/nsenter.sh

remove_all_containers:
	bash scripts/remove_all_containers.sh

remove_all_images:
	bash scripts/remove_all_images.sh

run_env:
	sudo docker run --name web -p 1800:80 --link db:db puppet_ms_apache env

run_ms_apache:
	sudo docker run --name web -d -p 1800:80 --link db:db puppet_ms_apache /usr/sbin/apache2ctl -D FOREGROUND

push:
	sudo docker tag puppet_ms_apache registry.manageacloud.com.au:5000/puppet_ms_apache
	sudo docker push registry.manageacloud.com.au:5000/puppet_ms_apache

