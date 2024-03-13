$iotHubName = "alexslsiotHub5vapktontszz6"
$storage = "alexslsiot5vapktontszz6"
$deviceId = "AlexsDevice"
$message = "C:\Users\Alexander.Lindel\OneDrive - PlanB. GmbH\DevOps\DevOps\Userstorys\two_three\message.json"
$containerName = "alexsiotblob"
$destinationPath = "response.json"


function SendAndTestMessageToAzure {
    az login
    Set-Content -Path $destinationPath -Value ""

    #Message senden
    Write-Host "Sending Message to Environment"
    az iot device send-d2c-message -n $iotHubName -d $deviceId --props '$.ct=application/json;$.ce=utf-8' --data-file-path $message

    #File Pfad mithilfe der UTC-Zeit ermitteln
    $DateTime = Get-Date
    $utcTime = $DateTime.ToUniversalTime()
    $year = $utcTime.Year.ToString("0000")
    $month = $utcTime.Month.ToString("00")
    $day = $utcTime.Day.ToString("00")
    $hour = $utcTime.Hour.ToString("00")
    $minute = $utcTime.Minute.ToString("00")
    $utcString = "$year/$month/$day/$hour/$minute"
    $filePath = "${iotHubName}/03/${utcString}.JSON" #Wenn es hier zu einem Fehler kommt kann die 3 zu einer beliebigen Partitionsnummer geändert werden
    Write-Host $filePath

    Start-Sleep -Seconds 140

    #Blob downloaden zu einem File
    Write-Host "Testing if Message was Delivered Successfully"
    az storage blob download --account-name $storage --container-name $containerName --name $filePath --file $destinationPath

    #Content des Blob Files bekommen
    $fileContent = Get-Content -Path $destinationPath -Raw 
    $msg = Get-Content -Path $message 


    #Kontrollieren ob das File die Nachricht enthält
    if ($fileContent.Contains($msg)){
        Write-Output "Test Successfull"
    }
    else {
        Write-Output "Test Unsuccessful"
    }
}

# Function aufrufen
SendAndTestMessageToAzure