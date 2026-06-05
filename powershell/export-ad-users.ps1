# Author: Peace Diane Ishimwe
# Description: Export active AD users to CSV

$SearchBase = "OU=OUname Staff,DC=domain,DC=domain,DC=com"
$Server = "domain-server-fqdn"
$OutputFile = "C:\Users\peace.ishimwe\Desktop\RWANDA_STAFF.csv"

Get-ADUser -ResultSetSize 20000 `
    -Filter {ObjectClass -eq 'User' -and Enabled -eq $True} `
    -SearchBase $SearchBase `
    -Server $Server `
    -Properties Name, GivenName, Surname, SamAccountName, Mail, Office, LastLogonDate |
    
Select-Object Name, GivenName, Surname, SamAccountName, Mail, Office, LastLogonDate |
Export-Csv $OutputFile -NoTypeInformation

Write-Output "Export completed: $OutputFile"
