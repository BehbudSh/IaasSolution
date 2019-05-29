$password = "B123456b!" 
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
$additionalParameters = New-Object -TypeName hashtable
$additionalParameters['vmAdminPassword'] = $securePassword