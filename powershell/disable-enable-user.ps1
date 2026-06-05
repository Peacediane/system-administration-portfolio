param (
    [string]$Username,
    [string]$Action
)

if ($Action -eq "disable") {
    Disable-ADAccount -Identity $Username
    Write-Output "User $Username has been disabled."
}
elseif ($Action -eq "enable") {
    Enable-ADAccount -Identity $Username
    Write-Output "User $Username has been enabled."
}
else {
    Write-Output "Invalid action."
}
