#Start a remote interactive PowerShell session
Enter-PSSession -ComputerName ms

#In the Remote Session start the job and review the properties.
$job = start-job -ScriptBlock {get-eventlog "Windows PowerShell"} 
$job

#Receive the results in the remote interactive session:
Receive-Job $job

#Run Remote Background job on multiple computers
$Jobs = Invoke-Command –ComputerName DC, MS, WIN10 –ScriptBlock {Get-WinEvent –LogName System –MaxEvents 1000} -AsJob

#List the Remote Background Jobs and review the states.
$Jobs | Get-Job –IncludeChildJob

##########

