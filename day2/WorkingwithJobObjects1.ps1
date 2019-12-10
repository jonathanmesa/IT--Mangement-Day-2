#Run the following commands and show the resultant get-job output. Focus on the states and job types. 

#Start a background job which will fail;
$myJob4 = Start-Job –ScriptBlock {Get-ChildItem HKLM:\SAM}

#Review the properties of the job object
$myJob4 | format-list

#List the ChildJobs
Get-Job  -ID $myJob4.Id –IncludeChildJob 

#Run Each of the following to review the error details :
  (Get-Job -Id $myJob4.Id -IncludeChildJob).Error | Get-Member
  (Get-Job -Id $myJob4.Id -IncludeChildJob).Error.Exception 
  (Get-Job -Id $myJob4.Id -IncludeChildJob).Error.Targetobject 
  (Get-Job -Id $myJob4.Id -IncludeChildJob).Error.FullyQualifiedErrorId 
  (Get-Job -Id $myJob4.Id -IncludeChildJob).Error.Exception.SerializedRemoteInvocationInfo

##########
