#I should replace this with puppet at some point
sudo apt-get -qq install curl 
sudo apt-get -qq install git
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -qq update
sudo apt-get -qq install jenkins

#sudo sed -i -e 's/HTTP_PORT=8080/HTTP_PORT=80/g' /etc/default/jenkins

