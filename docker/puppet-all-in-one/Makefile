build_container:
	sudo docker build -t puppet_wordpress_all_in_one .

bash:
	sudo docker run -t -i puppet_wordpress_all_in_one /bin/bash

bash_phusion:
	sudo docker run -t -i phusion/baseimage /bin/bash

run_container:
	sudo docker run --name puppet_wordpress_all_in_one_run -p 2200:22 -p 1800:80 puppet_wordpress_all_in_one /sbin/my_init --enable-insecure-key

delete_container:
	sudo docker rm puppet_wordpress_all_in_one_run 

ssh:
	ssh root@localhost -o "StrictHostKeyChecking no" -p 2200 -i ssh-insecure-key

build_nsenter:
	sudo docker run --rm jpetazzo/nsenter cat /nsenter > /tmp/nsenter && chmod +x /tmp/nsenter

nsenter: 
	bash scripts/nsenter.sh

remove_all_containers:
	bash scripts/remove_all_containers.sh

remove_all_images:
	bash scripts/remove_all_images.sh

push:
	sudo docker tag puppet_wordpress_all_in_one registry.manageacloud.com.au:5000/puppet_wordpress_all_in_one
	sudo docker push registry.manageacloud.com.au:5000/puppet_wordpress_all_in_one

