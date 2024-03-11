param (
    [string]$environment
)
 
function DeployTestToDev {
    Write-Host "Deploying to Dev environment..."
    az deployment group create --resource rg-alexander-lindel --template-file C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\iotsetup.bicep --parameters C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\main.json --confirm-with-what-if
}
 
function DeployTestToTest {
    Write-Host "Deploying to Test environment..."
    az deployment group create --resource rg-alexander-lindel --template-file C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\iotsetup.bicep --parameters C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\test.json --confirm-with-what-if
}
 
function DeployTestToMain {
    Write-Host "Deploying to Prod environment..."
    az deployment group create --resource rg-alexander-lindel --template-file C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\iotsetup.bicep --parameters C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\main.json --confirm-with-what-if
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