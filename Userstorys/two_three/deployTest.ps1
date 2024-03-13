param (
    [string]$environment
)
 
function DeployTestToDev {
    Write-Host "Deploying to Dev environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\one\dev.json --confirm-with-what-if
}
 
function DeployTestToTest {
    Write-Host "Deploying to Test environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\one\test.json --confirm-with-what-if
}
 
function DeployTestToMain {
    Write-Host "Deploying to Prod environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\one\main.json --confirm-with-what-if
}
 
if ($environment -eq 'dev') {
    DeployTestToDev
}
elseif ($environment -eq 'test') {
    DeployTestToTest
}
elseif ($environment -eq 'main') {
    DeployTestToMain
}
else {
    Write-Host "Invalid environment parameter. Please use 'dev', 'test', or 'main'."
}
