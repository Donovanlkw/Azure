#----- Declare variables -----#  
$orgName="Domain"  
$Userid = "xxxx"  
$User= "$Userid@$orgName.onMicrosoft.com"  
$SharepointadminURL="https://$orgName-admin.sharepoint.com"  
$Password =  "Passw0rd1"  
$Encryptedpassword=$Password | ConvertTo-SecureString -Force -AsPlainText  
$credential=New-Object PSCredential($User, $Encryptedpassword)  


# ----- Connect to azure AD ----- #  
Connect-AzAccount  
$tenantId = (Get-AzContext).Tenant.Id  
Connect-AzureAD -TenantId $tenantId  


# ----- Connect to O365 services ----- #  
Connect-AzureAD -Credential $credential  
Connect-MsolService -Credential $credential  
Connect-MicrosoftTeams  -Credential $credential  
Connect-SPOService -Url $SharepointadminURL -Credential $credential  
Connect-MicrosoftTeams  -Credential $credential  


# ----- Connect to sfb ----- #  
$sfbSession = New-CsOnlineSession -Credential $Credential  
Import-PSSession $sfbSession  


# ----- Connect to exchange online ----- #
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking
Connect-ExchangeOnline -Credential $credential -ShowProgress $true


# ----- Connect to the Security & Compliance Center.
$SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $SccSession -Prefix cc


# -----     ----- #
Set-ExecutionPolicy RemoteSigned


# ----- Connect to exchange online ----- # 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credential -Authentication Basic -AllowRedirection 
Import-PSSession $Session -DisableNameChecking 
Connect-ExchangeOnline -Credential $credential -ShowProgress $true 
  

# ----- Connect to the Security & Compliance Center. 
$SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication "Basic" -AllowRedirection 
Import-PSSession $SccSession -Prefix cc 


# -----     ----- # 

Set-ExecutionPolicy RemoteSigned




