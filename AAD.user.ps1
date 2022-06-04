#---- Add O365 user in AAD for Sync -----# 
$userlist = "Bob", "Steve", "Mary", "Peter", "John", "Annie" 
$Password =  "Password1" 
$Encryptedpassword=$Password | ConvertTo-SecureString -Force -AsPlainText 

$userlist |foreach-object { 
$UserPrincipalName = "$_@$orgName.onMicrosoft.com" 
New-ADUser -Name "$_" -GivenName "$_" -Surname "" -SamAccountName "$_" -UserPrincipalName "$_@$Domainname" -Path "OU=O365,$ou" -AccountPassword($Encryptedpassword) -Enabled $true 
} 
#New-AzureADUser -DisplayName "New User" -PasswordProfile $PasswordProfile  -UserPrincipalName "newuser2@guestxthoutlook.onmicrosoft.com" -AccountEnabled $true -MailNickName "newuser2"


#---- Create a Azure Dynamic Group -----#
New-AzureADMSGroup -DisplayName "Dynamic Group 01" -Description "Dynamic group created from PS" -MailEnabled $False -MailNickName "group" -SecurityEnabled $True -GroupTypes "DynamicMembership" -MembershipRule "(user.department -contains ""Marketing"")" -MembershipRuleProcessingState "On"


#---- Prepare a non-routable domain for directory synchronization -----#
$orgName="emceuc1"
$Domainname=(Get-ADDomain).DNSroot
Get-ADForest | Format-List UPNSuffixes
Get-ADForest | Set-ADForest -UPNSuffixes @{add="$orgName.onMicrosoft.com"}


#---- Add O365 user in AD for Sync -----#
$userlist = "Bob", "Steve", "Mary", "Peter", "John", "Annie"
$Password =  "Password1"
$Encryptedpassword=$Password | ConvertTo-SecureString -Force -AsPlainText
$userlist |foreach-object {
$UserPrincipalName = "$_@$orgName.onMicrosoft.com"
New-ADUser -Name "$_" -GivenName "$_" -Surname "" -SamAccountName "$_" -UserPrincipalName "$_@$Domainname" -Path "OU=O365,$ou" -AccountPassword($Encryptedpassword) -Enabled $true
}


#---- Change UPN suffix for AAD O365 -----#
$O365Users= Get-ADUser -Filter * -SearchBase "OU=O365,$ou"
$O365Users | foreach {$newUpn = $_.UserPrincipalName.Replace("@$Domainname","@$orgName.onMicrosoft.com"); $_ | Set-ADUser -UserPrincipalName $newUpn}



#---- Assing O365 license @ AAD -----#


