$iotHubName = "YOUR_IOT_HUB_NAME"
$storage = "YOUR_STORAGE_NAME"
$deviceId = "YOUR_DEVICE_NAME"
$message = "YOUR_MESSAGE"
$containerName = "YOUR_CONTAINER_NAME"

$destinationPath = "Userstorys\two_three\response.json"


function SendAndTestMessageToAzure {
    az login 
    Write-Host "Sending Message to Dev environment"

    #Ermittlung der Sendezeit
    $date = Get-Date
    $minutes = $date.Minute

    #Message senden
    az iot device send-d2c-message --hub-name $iotHubName --device-id $deviceId --data $message

    Write-Host "Testing if Message was Delivered Successfully"
    #Testen ob die Nachricht erfolgreich angekommen ist

    #Blob downloaden zu einem File
    az storage blob download --account-name $storage --container-name $containerName --name ($minutes.ToString()) --file $destinationPath 

    #Content des Blob Files bekommen
    $string = Get-Content -Path $destinationPath -Raw 

    #Kontrollieren ob das File die Nachricht enthält
    if (!$string.Equals('') -or !$string.Equals($null)){
        if ($string.Contains($message)) {
            Write-Output "Test Successfull"
        } else {
            Write-Output "Test Unsuccessful"
        }
    }
}

# Function aufrufen
SendAndTestMessageToDev
