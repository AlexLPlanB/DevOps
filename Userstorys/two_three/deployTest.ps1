param (
    [string]$environment
)
 
function DeployTestToDev {
    Write-Host "Deploying to Dev environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\two_three\dev.json --confirm-with-what-if
} # Die Pfade müssen eventuell angepasst werden
 
function DeployTestToTest {
    Write-Host "Deploying to Test environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\two_three\test.json --confirm-with-what-if
} # Die Pfade müssen eventuell angepasst werden
 
function DeployTestToMain {
    Write-Host "Deploying to Prod environment..."
    az deployment group create --resource NAME_OF_YOUR_RESSOURCE_GROUP --template-file Userstorys\two_three\iotsetup.bicep --parameters Userstorys\two_three\main.json --confirm-with-what-if
} # Die Pfade müssen eventuell angepasst werden
 
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

// Zum ausführen des Projekts benutze:
// .\deployTest.ps1 Environment dev
// dev, test oder main als Environment möglich
