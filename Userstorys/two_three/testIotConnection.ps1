$iotHubName = "YOUR_IOT_HUB_NAME"
$storage = "YOUR_STORAGE_NAME"
$deviceId = "YOUR_DEVICE_NAME"
$message = "YOUR_MESSAGE"
$containerName = "YOUR_CONTAINER_NAME"

$destinationPath = "Userstorys\two_three\response.json"


function SendAndTestMessageToAzure {
    az login
    Set-Content -Path $destinationPath -Value ""
    Write-Host "Sending Message to Environment"

    #Message senden
    az iot device send-d2c-message --hub-name $iotHubName --device-id $deviceId
    Write-Host "Testing if Message was Delivered Successfully"


    #Testen/Warten ob die Nachricht erfolgreich angekommen ist
    Start-Sleep -Seconds 150
    $date = Get-Date
    $date = $date.ToUniversalTime() 
    $minutes = $date.Minute - 2
    $hours = $date.Hour
    $filePath = "($iotHubName)/03/2024/0$($date.Month)/$($date.Day)/$hours/$minutes.json.JSON"

    #Blob downloaden zu einem File
    az storage blob download --account-name $storage --container-name $containerName --name $filePath --file $destinationPath 

    #Content des Blob Files bekommen
    $fileContent = Get-Content -Path $destinationPath -Raw 

    #Kontrollieren ob das File die Nachricht enthält
    if (!$fileContent.Equals('')){
        Write-Output "Test Successfull"
    }
    else {
        Write-Output "Test Unsuccessful"
    }
}

# Function aufrufen
SendAndTestMessageToAzure
