gcloud compute instances create electric-jenkins-1 --metadata-from-file startup-script=install_jenkins.sh --image "ubuntu-15-10" --machine-type "n1-standard-1" --zone "europe-west1-d"

gcloud compute firewall-rules create jenkins-web-port --allow tcp:8080


