#Run the following commands and show the resultant get-job output. Focus on the –asjob parameters , states and job types. 

#Please note that in order to run these commands on a Windows 10 Operating System it required to enable Remoting;
Enable-PsRemoting

#Background Job:
Start-Job {Get-Service Spooler} | Out-Null

#WmiJob :
Get-WMiObject –Class Win32_Service –Filter “Name=‘Spooler’” –AsJob | Out-Null

#RemoteJob: 
Invoke-Command -ScriptBlock {Get-Service Spooler -ComputerName dc} -AsJob -Session (New-PSSession) | Out-Null

#Workflow Job:
Workflow Test {}; Test –AsJob | Out-Null

#Scheduled Jobs:
Register-ScheduledJob -ScriptBlock {Get-ChildItem} -Name Test -RunNow

#List the Jobs:
Get-Job

##########

