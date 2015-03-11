# Dockerising Puppet

How to create and orchestrate Docker containers using Puppet Enterprise

## Docker

The Makefile contains more information about how to work with the container.

 - docker/puppet-all-in-one - Creates a Wordpress application with the following services: apache2, mysql and ssh.
 - docker/puppet.ms.apache - Creates a microservice with apache2
 - docker/puppet.ms.mysql - Creates a microservice with mysql

## Puppet

 - puppet/docker-registry - Creates a basic Docker Registry container
 - puppet/container-wordpress-all-in-one - Pulls a wordpress container from the docker registry
 - puppet/container-wodpress-ms - Pulls a web container (apache2 + wordpress) and a db container (mysql). Uses Microservices approach.
 - puppet/wordpress-all-in-one - wordpress puppet class for MySQL and Apache2
 - puppet/wordpress-apache-ms - wordpress puppet class for apache
 - puppet/wordpress-mysql-ms - wordpress puppet class for mysql
 - puppet/mysql-noinit - Class that installs and starts mysql compatible with containers that does not depend of a valid init process
 - puppet/apache-wordpress - Class that install apache2 and configures it for wordpress
