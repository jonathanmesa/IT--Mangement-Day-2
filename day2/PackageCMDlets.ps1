#Consider demoing the following:

#Find zoomit in chocolatey
Find-Package -Source chocolatey -Name zoomit # 	-> Won`t work because we renamed chocolatey into puurchocolate last demo
Find-Package -Source Puurchocolate -Name zoomit

#Save the package for inspection before you install it
Save-Package –name zoomit –Source chocolatey  –path c:\temp   #	-> Won`t work because we renamed chocolatey into puurchocolate last demo
Save-Package –name zoomit –Source Puurchocolate   –path c:\temp

#Install a package from your save location
Install-Package –InputObject c:\temp\zoomit.4.50.0.20160210.nupkg	#-> note there is no message saying that the repository is untrusted as we set puurchocolate repo to a trusted repo

#Install a package direct from the repository
Install-Package -Source chocolatey -Name zoomit  #	-> Won`t work because we renamed chocolatey into puurchocolate last demo
Install-Package -Source Puurchocolate -Name zoomit #	-> note there is no message saying that the repository is untrusted as we set puurchocolate repo to a trusted repo


#Install from a GUI
Find-Package -ProviderName Puurchocolate | Out-GridView -PassThru | Install-Package

#Not all content is OK especially older content has its source broken:
Install-Package snake-jave 	#-> Zip File aint downloaded due to redirect on soundforce
Install-Package mspacman	#-> download does not exist

#Inspect all the installed packages 

#Look at packages that have been installed anywhere within the scope of packagemanger
$all = Get-Package

##Inspect the output:
$all | group-object –property ProviderName
$all | where-object -FilterScript {$_.Providername -eq "msu"}
$all | where-object -FilterScript {$_.Providername -eq “msi"
$all | where-object -FilterScript {$_.Providername -eq “Chocolatey"}

#If you have a MSI program that can be uninstalled show uninstall from a msi program works
Uninstall-Package -name "Google Talk Plugin"


##########
