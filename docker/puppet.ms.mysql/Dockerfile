FROM ubuntu
MAINTAINER Ruben Rubio Rey  "ruben.rubio@manageacloud.com"

# Activate AU mirrors
COPY files/sources.list.au /etc/apt/sources.list

# Install CURL
RUN apt-get update && apt-get install -y curl

# Install puppet client
RUN curl -k https://puppet.manageacloud.com.au:8140/packages/current/install.bash | bash

# Configure puppet client
COPY files/puppet.conf /etc/puppetlabs/puppet/puppet.conf

# Apply puppet changes
RUN puppet agent --debug --verbose --no-daemonize --onetime --certname ms-mysql-image-`date +%s | sha256sum | head -c 3; echo `

# Expose MySQL to Docker network
EXPOSE 3306

