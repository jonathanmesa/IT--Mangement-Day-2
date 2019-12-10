
#Create the command line action:
$Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-ExecutionPolicy Bypass -File" "C:\Pshell\Get-JobEvent.ps1"

#Use localystem as the username:
$UserName = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

#Create a basic trigger:
$Trigger  = New-ScheduledTaskTrigger –AtStartup

#Bring together and create the task object:
$Task = New-ScheduledTask -Action $Action -Principal $TaskUserName -Trigger $Trigger –Settings

#Register the task in task scheduler and then review:
Register-ScheduledTask DemoTask -InputObject $Task –Force
