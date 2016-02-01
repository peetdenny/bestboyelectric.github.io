. ./settings.conf
mkdir $tmpdir
cd client_scripts
# Jenkins will need to be configured to work with your specific LDAP provider. 
# Here, we generate a groovy script to make those changes. This script will then be uploaded to the provisioned VM and run
./generateCustomLDAPScript.sh > $tmpdir/configure_ldap.groovy
cp *.groovy $tmpdir
echo "Building server on Google Cloud, this may  take a few moments..."
./create_build_server.sh
echo reticulating splines....
gcloud compute copy-files $tmpdir/*.groovy  $instancename:~/.  --zone $zone
echo copied groovy scripts over to remote server
echo waiting for server instance to come up
# Give Jenkins a minute to start up. I'll replace this with a loop at some point, or maybe leave that as an exercise for the reader!
sleep 60
echo configuring security
gcloud compute ssh $instancename --zone $zone --command 'curl --data-urlencode "script@./configure_ldap.groovy" http://localhost:8080/scriptText'

echo "installing plugins (this will restart Jenkins)"
gcloud compute ssh $instancename --zone $zone --command "curl --data-urlencode 'script@./configurePlugins.groovy' -u${managerUser}:${managerPassword} http://localhost:8080/scriptText"


echo Executed script to connect Jenkins to LDAP
echo ===========================================
echo
echo
echo 
rm -Rf $tmpdir
echo "Ok, that's all done, I've just tidied up around here. Have a nice day :) - BestBoyElectric.io"
gcloud compute instances describe --zone $zone  $instancename | grep natIP | awk '{print "Your new Jenkins server is running at http://" $2 ":8080"}'

