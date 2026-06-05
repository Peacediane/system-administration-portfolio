# Author: Peace Diane Ishimwe
# Description: Displays metadata of an Active Directory object

param (
    [string]$Username,
    [string]$DomainName
)

$dn = (Get-ADUser $Username).DistinguishedName

repadmin /showobjmeta $DomainName $dn
