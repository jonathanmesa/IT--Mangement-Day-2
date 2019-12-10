#Finding all set commands from a configuration file:
netsh dump | Select-String -Pattern "^set"

#Show all interfaces using netsh
netsh trace show interfaces | Select-String -Pattern "^\s+Description“

#Show all interfaces using netsh and use alternation to add the index
netsh trace show interfaces | Select-String -Pattern "^\s+Description|index“

#Mixing it all together: replace the description using capture groups
(netsh trace show interfaces | Select-String -Pattern "^\s+Description|index") 
(netsh trace show interfaces | Select-String -Pattern "^\s+Description|index") -replace "(\sDescription):\s+(Microsoft)(.*)",' My $2 device$1 is $3'
