# electric-build

Provisions a Google Cloud Ubuntu instance, installs Jenkins, activates security and then connects Jenkins to your LDAP server. 

To get up and running with your own Jenkins instance in 15 mins, do these things!

  * Create a gcloud account here https://cloud.google.com/. It's free to use for 60 days (and really cheap after that)
  * Download and install the gcloud SDK https://cloud.google.com/sdk/
  * Create a copy of client_scripts/settings.conf.example in the project root directory called settings.conf
  * Configure your server instance name, zone of choice and the details of your LDAP system 
  * run ./generateJenkins.sh

**That's it!**

##Don't have your own LDAP?
Then you have a few options
* You can manually setup security yourself (slightly defeating the glory of having the whole thing immutable, but you still get a jenkins in 15 mins. Run client_scripts/create_build_server.sh instead
* Leave security off (not recommended :) ) (Run the same script as above)
* Set up a free directory as a service LDAP at https://jumpcloud.com/. (recommended)


Got any questions? Give me a ping!

