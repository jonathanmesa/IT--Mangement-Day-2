

#In previeus demos we installed the PowerShellGet repository so the module should be available
#Validate the module is loaded
Get-module	#-> you should see the powershellget module if not you could old fasion load it     import-module –name powershellget   

#Show all commands in the module
Get-command -module powershellget

#Show the difference between the package management commands and PowerShellGet commands:
#Package management 
Get-PackageSource
#VS
#PowerShellGet
Get-PSRepository	#	-> Only shows Psget resources


#Package management 
Find-Package –Name AZ	
#VS
#PowerShellGet
Find-Module –Name AZ 	-> Note Repository VS Source

#You can mostly combine the commands in the Pipe
Find-Package -Name az | Install-Module

I#nstall-module uses install package under the hood
find-package -Name ACMESharp | Install-Module #		- Will trow an error that the package name is not found while running install-package

#Uninstall the module again:
Uninstall-Module –name ACMESharp	#	-> Will trow a error as you have the module actively loaded need to remove first

#Unload the module
Remove-Module –name ACMESharp

Uninstall the module again:
Uninstall-Module –name ACMESharp

#Install a module in the local user scope
Install-Module –name ACMESharp –scope “currentuser”


##########
