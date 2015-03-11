FROM phusion/baseimage
MAINTAINER Ruben Rubio Rey  "ruben.rubio@manageacloud.com"

# Activate AU mirrors
COPY files/sources.list.au /etc/apt/sources.list

# Install puppet client
RUN curl -k https://puppet.manageacloud.com.au:8140/packages/current/install.bash | bash

# Configure puppet client
COPY files/puppet.conf /etc/puppetlabs/puppet/puppet.conf

# Apply puppet changes
RUN puppet agent --debug --verbose --no-daemonize --onetime --certname wordpress-image-`date +%s | sha256sum | head -c 3; echo `

# Enable SSH
RUN rm -f /etc/service/sshd/down
#
# # Change root password
RUN echo "root:mypassword" | chpasswd

COPY files/init /etc/my_init.d/10_init_services
RUN chmod +x /etc/my_init.d/10_init_services

