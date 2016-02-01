# Each line outputs the groovy code needed to set up your LDAP configuration. 
echo import jenkins.model.*
echo import hudson.security.*
echo import org.jenkinsci.plugins.*
echo import hudson.security.FullControlOnceLoggedInAuthorizationStrategy

# enable security & integrate with LDAP

echo String server = \"$server\" 
echo String rootDN = "''" 
echo String userSearchBase = \"$userSearchBase\" 
echo String userSearch = \"$userSearch\"
echo String groupSearchBase = \"$groupSearchBase\"
echo String managerDN = \"$managerDN\"
echo String managerPassword = \"$managerPassword\"
echo boolean inhibitInferRootDN = true

echo "SecurityRealm ldap_realm = new LDAPSecurityRealm(server, rootDN, userSearchBase, userSearch, groupSearchBase, managerDN, managerPassword, inhibitInferRootDN)"
echo "Jenkins.instance.setSecurityRealm(ldap_realm)"
echo "Jenkins.instance.setAuthorizationStrategy(new FullControlOnceLoggedInAuthorizationStrategy())"
echo "Jenkins.instance.save()" 

