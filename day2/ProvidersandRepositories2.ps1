
#Show all needed cmdlets are in the packagemanagement module:
Get-Command -Module PackageManagement

#Install additional package providers
#Show the default installed providers and what is available if it is not open in your session anymore
Get-PackageProvider
Find-PackageProvider

#Update the Nuget provider
Install-PackageProvider -name nuget
Install the chocolatey provider
Install-PackageProvider -name chocolatey

#Show the providers have been installed
Get-PackageProvider      #   		-> Note the version numbers
Get-PackageProvider –ListAvailable   #	-> Will show all providers and their versions if multiple are available

#Show the repositories that are now available:
Get-packagesource

#Show that Psget has his own cmdlet for this:
Get-PSRepository

#Rename chocolatey and set it trusted
Set-packagesource -name chocolatey -NewName "Puurchocolate" -Trusted

#Show it is now trusted and has the new name
Get-packagesource 

#Show All properties
Get-packagesource  | fl


##########
