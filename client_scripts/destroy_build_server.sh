. ./settings.conf
gcloud compute --quiet firewall-rules delete jenkins-web-port
gcloud compute --quiet instances delete --zone $zone $instancename
