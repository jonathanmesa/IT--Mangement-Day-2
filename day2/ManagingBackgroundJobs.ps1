#Start a background job and wait for the job to finish. ;
Start-Job –Name MyWaitingJob –ScriptBlock {Get-WinEvent –LogName Application –MaxEvents 1000} | wait-job

#Receive the results:
Get-job –Name MyWaitingJob | Receive-Job

#Try to receive again; 
Get-job –Name MyWaitingJob | Receive-Job

#Start a background job but don’t wait it to finish:
Start-Job –Name MyWaitingJob –ScriptBlock {Get-WinEvent –LogName Application –MaxEvents 5000 }

#Run the following line multiple times over and over:
(Get-job –Name MyWaitingJob | Receive-Job –Keep).Count

##########


