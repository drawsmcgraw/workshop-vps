#!bin/bash

# Create student accounts and set their password.
for user in user-01\
            user-02\
            user-03\
            user-04\
            user-05\
            user-06\
            user-07\
            user-08\
            user-09\
            user-10 ; do
  useradd -m -s /bin/bash ${user}
  echo ${user}:thecloudrocksmysocks | chpasswd
done

# Minimal images don't even have wget
yum install -y wget

# configure the Cloud Foundry Foundation package repository
sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo

# Install packages
yum install -y java-1.8.0-openjdk \
               java-1.8.0-openjdk-devel \
               wget \
               vim \
               cf-cli

# Ensure password auth is enabled for sshd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd
