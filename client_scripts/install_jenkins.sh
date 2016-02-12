#I should replace this with puppet at some point
sudo dpkg --configure -a
sudo apt-get update
sudo apt-get -qq install curl 

sudo apt-get -qq install python-pip
sudo apt-get -qq install awscli

sudo apt-get -qq install git
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -qq update
sudo apt-get -qq install jenkins


