#Any message that has error in it:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "error"}


#Any message that has restart in it:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "restart"}
#Any message that has stop in it:

Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "stop"}

#Using wildcard matching with “.”:
#Any message that contains ProgramData on any driveletter:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "...ProgramData"} | select-object -first 5

#Any message that refferances an event ID with 1 character or digit in qoutes:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "Event ID '.'"} | select-object -first 5

#Using escape “\” character:
#Any message that references an exe file:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match ".\.exe"} | select-object -first 5
#Mixing regex symbols:

#Any message that contains search database related messages:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "\(\d\d\d\d,\w,\d\d\)"} | select-object -first 5

#Any defined or undefined multiplication of a symbol:
#	Anything that looks like a stop code:
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "0x\d+"} | select-object -first 5

#Atleast 2 slashes so a fileshare or absolute path
Get-EventLog -LogName application | where-object -FilterScript {$_.message -match "\\{2,}"} | select-object -first 5
#Split takes regex as a input to act on:
#View gateway information from route command:
(route print 0*) -split "\s" -match “\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}“
#use –match ,  -replace and -split  all with regex to extract the lost packages from a ping
(ping 8.8.8.8 -n 1) -match "lost" -replace "Packets: Sent = \d+, Received = \d+," -split "\(\d+% loss\),"
