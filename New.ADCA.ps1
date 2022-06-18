Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Install-AdcsCertificationAuthority -CAType EnterpriseRootCa -CryptoProviderName "ECDSA_P256#Microsoft Software Key Storage Provider" -KeyLength 256 -HashAlgorithmName SHA256

# Install-ADcsCertificationAuthority –Credential (Get-Credential) -CAType EnterpriseRootCa –CACommonName“domain-Host1-CA-1” –CADistinguishedNameSuffix “DC=lab,DC=local” –CryptoProviderName“RSA#Microsoft Software Key Storage Provider” -KeyLength 2048 –HashAlgorithmName SHA1 –ValidityPeriod Years –ValidityPeriodUnits3 –DatabaseDirectory “C:\windows\system32\certLog” –LogDirectory “c:\windows\system32\CertLog” –Force

#https://docs.microsoft.com/en-us/powershell/module/adcsdeployment/install-adcscertificationauthority?view=windowsserver2022-ps
#https://social.technet.microsoft.com/wiki/contents/articles/15037.ad-cs-step-by-step-guide-two-tier-pki-hierarchy-deployment.aspx

#https://blog.wiztechtalk.com/2019/04/03/microsoft-powershell-install-and-configure-ad-certificate-services-windows-server-2016/


#https://docs.microsoft.com/en-us/archive/blogs/russellt/custom-ldap-certs
