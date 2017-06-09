sudo yum -y groupinstall development
sudo yum -y install nano wget

# Python 2.7.13 Install 
mkdir downloads
cd downloads
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
tar xzf Python-2.7.13.tgz
cd Python-2.7.13
./configure
make altinstall

# Python 3.6 Install 
# CentOS 7
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
# For CentOS 6 use this one
# sudo yum -y install https://centos6.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u-3.6.1
sudo yum -y install python36u-devel
sudo yum -y install python-pip
sudo pip install --upgrade pip 
sudo pip install virtualenv

# Clone repo 
cd ~
git clone https://github.com/DevNetSandbox/sbx_nxos
cd sbx_nxos

# Create venv 
virtualenv venv/python2 --python=python2.7
virtualenv venv/python3 --python=python3.6 

# Install some basic requirements into environments 
source venv/python2/bin/activate 
pip install -r sbx-mgmt/requirements.txt 
pip install -r ansible-playbooks/requirements.txt 
deactivate 
source venv/python3/bin/activate 
pip install -r sbx-mgmt/requirements.txt 
pip install -r ansible-playbooks/requirements.txt 
deactivate 