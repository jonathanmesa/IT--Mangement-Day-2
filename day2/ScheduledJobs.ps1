#Start a remote interactive PowerShell session
Register-ScheduledJob -Name myTestJob5 -Trigger (New-JobTrigger -Daily -At 1:00AM) -ScriptBlock {Get-Process}

#Review the scheduled job in task scheduler gui (taskschd.msc)
taskschd.msc
#Run MyTestJob5 in Task scheduled gui multiple times

#Receive the results in the remote interactive session:
Receive-Job myTestJob5

#Review the output folder:
dir C:\Users\emreg\AppData\Local\Microsoft\Windows\PowerShell\ScheduledJobs\myTestJob5\Output

#Close and restart a new ISE and receive;
Receive-Job myTestJob5

#You might need to import SchduledJobModule if the above don’t work and then run again

Import-Module PSScheduledJob 

##########

