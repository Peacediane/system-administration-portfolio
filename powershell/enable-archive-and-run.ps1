# Author: Peace Diane Ishimwe
# Description: Enables archive mailbox and triggers Managed Folder Assistant

param (
    [string]$UserEmail
)

# Connect to Exchange Online
Connect-ExchangeOnline

# Enable archive mailbox
Enable-Mailbox -Identity $UserEmail -Archive

# Trigger archive processing
Start-ManagedFolderAssistant -Identity $UserEmail

Write-Output "Archive enabled and processing started for $UserEmail"
