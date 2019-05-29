### Define Deployment Variables

$resourceGrouplocation = 'West Europe'
$resourceGroupName = 'contoso-IaaS'
$resourceDeploymentName = 'contoso-IaaS-deployment'
$templatePath = 'C:\Users\Behbuds\Desktop'
$templateFile = 'contosoIaaS.json'
$template = $templatePath + '\' + $templateFile
$password = "B123456b!" 
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force


### Create Resource Group

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $resourcegrouplocation `
    -Verbose -Force


### Deploy Resources

$additionalParameters = New-Object -TypeName hashtable
$additionalParameters['vmAdminPassword'] = $securePassword
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    @additionalParameters `
    -Verbose -Force