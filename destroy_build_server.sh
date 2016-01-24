gcloud compute --quiet firewall-rules delete jenkins-web-port
gcloud compute --quiet instances delete --zone europe-west1-d electric-jenkins-1
