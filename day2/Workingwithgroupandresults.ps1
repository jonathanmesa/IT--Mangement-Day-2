#By default $matches shows the full match as group 0 as long as the input is a single string. 
"The ip address 40.68.221.249 is also known as ??.in-addr.arpa" -match "\d+\.\d+\.\d+\.\d+“
$matches  #  -> Shows just group 0 

#If we start to group this $matches will show all the capture groups
"The ip address 40.68.221.249 is also known as ??.in-addr.arpa" -match “(\d+)\.(\d+)\.(\d+)\.(\d+)“
$matches   # -> Shows all 4 octets of the IP address and the full match group 0

#Using Replace we can use this to our advantage to resequencing matches or text
"The ip address 40.68.221.249 is also known as ??.in-addr.arpa" -replace "(\d+)\.(\d+)\.(\d+)\.(\d+) is also known as \?\?.in-addr.arpa",'40.68.221.249 is also known as $4.$3.$2.$1.in-addr.arpa’

#We can also add a name to each group for reference with $matches
"The ip address 40.68.221.249 is also known as ??.in-addr.arpa" -match “(?<Octet1>\d+)\.(?<Octet2>\d+)\.(?<Octet3>\d+)\.(?<Octet4>\d+)“
$matches    # ->  This will now show all named groups and group 0 showing the full match

#Using Replace we can now create a simpler replace command
"The ip address 40.68.221.249 is also known as ??.in-addr.arpa" -replace "\?\?","$($matches.octet4).$($matches.octet3).$($matches.octet2).$($matches.octet1)"

##########
