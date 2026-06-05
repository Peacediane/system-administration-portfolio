# Author: Peace Diane Ishimwe
# Description: Bulk creation of Active Directory users from CSV file

param (
    [string]$CsvPath = "C:\Users\peace.ishimwe\Desktop\NewUsers.csv"
)

Import-Csv $CsvPath | ForEach-Object {

    $SecurePassword = ConvertTo-SecureString $_.Password -AsPlainText -Force

    New-ADUser `
        -Name $_.Name `
        -DisplayName $_.Name `
        -GivenName $_.GivenName `
        -Initials $_.Initials `
        -Surname $_.Surname `
        -SamAccountName $_.SamAccountName `
        -UserPrincipalName $_.UPN `
        -Path "OU=Business,OU=Guest User Accounts,DC=domain,DC=com" `
        -AccountPassword $SecurePassword `
        -Enabled $true `
        -AccountExpirationDate "2022-01-01" `
        -Description "Contractor Account" `
        -Company "External Partner" `
        -ChangePasswordAtLogon $true `
        -WhatIf

    Write-Output "Processed user: $($_.SamAccountName)"
}
