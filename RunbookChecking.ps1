Connect-AzureAD
$admins = Get-AzureADUser -Filter "startswith(UserPrincipalName,'a_')" | Select-Object *,@{label="Manager";expression={(Get-AzureADUserManager -ObjectId $_.ObjectID).UserPrincipalName}} | Where {($_.manager -eq $null) -and ($_.AccountEnabled -eq $true)} |select UserPRincipalName, displayname, Objectid


 

Foreach($admin in $admins)
{Set-AzureADUser -ObjectID $admins.ObjectID -AccountEnabled $false}
