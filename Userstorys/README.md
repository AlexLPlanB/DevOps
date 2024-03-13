# SYS-Lernpfad DevOps
## Dokumentation zur Nutzung des Skripts "testIotConnection.ps1"
Dieses Skript und seine Dokumentation dienen dazu, eine Nachricht an einen Azure IoT Hub zu senden und diese Nachricht in einem Blob-Container zu speichern. Anschließend wird die Nachricht als JSON-Datei heruntergeladen und überprüft, ob die Übermittlung erfolgreich war. Die vollständige Datei findest du [hier](https://github.com/AlexanderLPB/DevOps/blob/main/Userstorys/two_three/testIotConnection.ps1) oder im Ordner two_three.

Zuerst müssen die notwendigen Eigenschaften definiert werden:

    $iotHubName = "DEIN_IOT_HUB_NAME"
    $storage = "DEIN_STORAGE_NAME"
    $deviceId = "DEIN_DEVICE_NAME"
    $message = "DEINE_NACHRICHT"
    $containerName = "DEIN_CONTAINER_NAME"
    $destinationPath = "Userstorys\two_three\response.json"

Danach loggen wir uns in Azure ein und löschen den Inhalt der response.json Datei:

    az login
    Set-Content -Path $destinationPath -Value ""

Daraufhin senden wir ausgehend von unserem Gerät die Nachricht an das IoT Hub:

    # Nachricht senden
    az iot device send-d2c-message --hub-name $iotHubName --device-id $deviceId --data $message

    
Nun werden wir die aktuelle Zeit abspeichern, da die Nachricht in unserem Blob nach der Aktuellen Zeit bennant wird und wir sie so leicht finden können:

    #File Pfad mithilfe der UTC-Zeit ermitteln
    $DateTime = Get-Date
    $utcTime = $DateTime.ToUniversalTime()
    $year = $utcTime.Year.ToString("0000")
    $month = $utcTime.Month.ToString("00")
    $day = $utcTime.Day.ToString("00")
    $hour = $utcTime.Hour.ToString("00")
    $minute = $utcTime.Minute.ToString("00")
    $utcString = "$year/$month/$day/$hour/$minute"
    $filePath = "${iotHubName}/03/${utcString}.JSON"

    
Nach dem Senden wollen wir nun kontrollieren, ob die Nachricht in Azure angekommen ist. Dafür laden wir den Inhalt des Blob-Storage herunter, in dem wir die Nachricht gespeichert haben. Alternativ kann man auch in Azure nachsehen, ob die JSON-Datei angekommen ist:

    #Blob downloaden zu einem File
    Write-Host "Testing if Message was Delivered Successfully"
    az storage blob download --account-name $storage --container-name $containerName --name $filePath --file $destinationPath

    #Content des Blob Files bekommen
    $fileContent = Get-Content -Path $destinationPath -Raw 
    $msg = Get-Content -Path $message 

    
Zuletzt kontrollieren wir, ob die Nachricht in der JSON-Datei vorhanden ist. Es könnte passieren, dass die Nachricht codiert wurde (z.B. zu Base64). Falls ja, muss sie nach dem Auslesen decodiert werden:


    #Kontrollieren ob das File die Nachricht enthält
    if ($fileContent.Contains($msg)){
        Write-Output "Test Successfull"
    }
    else {
        Write-Output "Test Unsuccessful"
    }

Das Script kann dann mit dem befehl "./testIotConnection.ps1" ausgeführt werden. 

> [!NOTE]
>Falls es beim Ausführen des Programms zu Problemen kommt, empfehle ich, das Testen, ob die Datei im Blob-Storage gespeichert wurde, aus dem Code zu entfernen und das Kontrollieren, ob die Message richtig gesendet wurde, manuell zu machen. Das ist das Ende meiner kleinen Dokumentation, wenn du einen Fehler im Code oder inhaltliche Ungenauigkeiten entdeckst, kannst du gerne einen Kommentar verfassen. Vielen Dank fürs lesen.
