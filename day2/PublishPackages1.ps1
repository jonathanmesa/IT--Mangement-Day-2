#Show the creation of a local file share repository
#Create the repository on your local pc
New-Item –Type directory –Path C:\MyRepo
New-SmbShare -Path C:\MyRepo -FullAccess Everyone -Name MyRepo
Register-PSRepository `
-Name MyRepo `
-PackageManagementProvider NuGet `
-SourceLocation \\localhost\MyRepo `
-PublishLocation \\localhost\MyRepo `
-InstallationPolicy Trusted 

#View the new repository is created
Get-PSRepository

#Publish a script into the new created repository
New-ScriptFileInfo `
-Path C:\Temp\MyScript.ps1 `
-Version 1.0 `
-Author "Joe Scripter" `
-Description "My Script" `
-ReleaseNotes @'
Version history 1.0 - Initial release
'@

Test-ScriptFileInfo -Path C:\Temp\MyScript.ps1

Publish-Script `
-Path C:\Temp\MyScript.ps1 `
-Repository MyRepo 

#List all packages in the repository
#Using packagemanagement
Find-Package -ProviderName Powershellget -Type script -Source myrepo

#Using PSGet:
Find-script -Repository myrepo	#	->  You can use –verbose –debug to display the parameter binding that is used on find package it is about 35 lines from the bottum

##########
