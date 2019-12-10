#We can extract an IP address using .NET framework regex class System.Text.RegularExpressions.Regex with short class name is [regex]. The overload match returns the first hit
[regex]::match((ipconfig.exe),"\d+\.\d+\.\d+\.\d+")

#The overload matches will return all results found 
[regex]::matches((ipconfig.exe),"\d+\.\d+\.\d+\.\d+")

#You can view the values direct by using dotted notation
([regex]::matches((ipconfig.exe),"\d+\.\d+\.\d+\.\d+")).value

#The object returned is a regex group just like $matches system variable
$result = [regex]::matches((ipconfig.exe),"\d+\.\d+\.\d+\.\d+")
$result[0].gettype()

Y#ou can also use the grouping with this static method
$result = [regex]::matches((ipconfig.exe),“(\d+)\.(\d+)\.(?<One>\d+)\.(?<Two>\d+)")
$result.groups | ft

#As ipconfig is an array of strings trying to match multiple lines with ^ and $ won`t work 
[regex]::Matches((ipconfig.exe),"(?m)^\s+IPv.*")

#We need to convert the output of Ipconfig from array to a string with line formatting
[string]$ipconfigstring = ipconfig.exe | foreach-object –process {"$_`n"}
[regex]::Matches(($ipconfigstring),"(?m)^\s+IPv.*") #       	-> start with IPv ignore white space show whole line
[regex]::Matches(($ipconfigstring),"(?m).*(\.0)$")	#	-> ending ip on 0  show whole line
[regex]::Matches(($ipconfigstring),"(?m)^\s+IPv.*|.*(\.0)$")	#-> start with IPv or ending ip on 0 ignore white space show whole line
