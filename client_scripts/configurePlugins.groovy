uc = Jenkins.instance.updateCenter
plugin = uc.getPlugin("git")
plugin.deploy()

pm = Jenkins.instance.pluginManager

def deployPlugin(plugin) {
 plugin.getNeededDependencies().each {
   deployPlugin(it)
 }
}

deployPlugin(plugin)
print uc.getJobs()
Jenkins.instance.doSafeRestart(null)
