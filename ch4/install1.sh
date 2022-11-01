# Installation instructions for RHEL/CentOS 7.x running as the root user
# This example will be written in Ansible yaml script.
# Install EPEL repo.
yum install epel-release

# Import Remi GPG key.
wget https://rpms.remirepo.et/RPM-GPG-KEY-remi -O /etc/pki/rpm-gpg/RPM-GPG-KEY-remi
rpm -Uvh --quiet https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install Node.js (npm plus all its dependencies)
yum --enablerepo=epel -y install npm
