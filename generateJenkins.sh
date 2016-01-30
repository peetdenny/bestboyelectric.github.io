. ./settings.conf
mkdir $tmpdir
cd client_scripts
./generateCustomLDAPScript.sh > $tmpdir/configure_ldap.groovy
echo "Building server on Google Cloud, this may  take a few moments..."
./create_build_server.sh
echo reticulating splines....
gcloud compute copy-files $tmpdir/configure_ldap.groovy  electric-jenkins-1:~/.  --zone europe-west1-d
echo copied groovy script over to remote server
echo waiting for server instance to come up
sleep 60
echo executing script to configure security
gcloud compute ssh $instancename --zone $zone --command 'curl --data-urlencode "script@./configure_ldap.groovy" http://localhost:8080/scriptText'

echo ran script to connect to LDAP
echo =========New Server Details Below=======
gcloud compute instances describe --zone $zone  $instancename | grep natIP
rm -Rf $tmpdir

