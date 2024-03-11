# SYS-Lernpfad DevOps
## Dokumentation zur Nutzung des Skripts "testIotConnection.ps1"
Dieses Skript und seine Dokumentation dienen dazu, eine Nachricht an einen Azure IoT Hub zu senden und diese Nachricht in einem Blob-Container zu speichern. Anschließend wird die Nachricht als JSON-Datei heruntergeladen und überprüft, ob die Übermittlung erfolgreich war. Die vollständige Datei findest du hier.

Zuerst loggen wir uns in Azure ein:

    az login

    
Danach müssen die notwendigen Eigenschaften definiert werden:

    $iotHubName = "DEIN_IOT_HUB_NAME"
    $storage = "DEIN_STORAGE_NAME"
    $deviceId = "DEIN_DEVICE_NAME"
    $message = "DEINE_NACHRICHT"
    $containerName = "DEIN_CONTAINER_NAME"
    $destinationPath = "Userstorys\two_three\response.json"

    
Nun werden wir die aktuelle Zeit abspeichern, um die Nachricht anschließend nach der Uhrzeit zu benennen. Dies ermöglicht einen besseren Überblick über alle Nachrichten und vermeidet doppelte Benennungen:

    # Ermittlung der Sendezeit
    $date = Get-Date
    $minutes = $date.Minute

    
Daraufhin senden wir ausgehend von unserem Gerät die Nachricht an das IoT Hub:

    # Nachricht senden
    az iot device send-d2c-message --hub-name $iotHubName --device-id $deviceId --data $message

    
Nach dem Senden wollen wir nun kontrollieren, ob die Nachricht in Azure angekommen ist. Dafür laden wir den Inhalt des Blob-Storage herunter, in dem wir die Nachricht gespeichert haben.     Alternativ kann man auch in Azure nachsehen, ob die JSON-Datei angekommen ist:

    # Blob downloaden zu einer Datei
    az storage blob download --account-name $storage --container-name $containerName --name ($minutes.ToString()) --file $destinationPath 
    # Inhalt des Blob-Files erhalten
    $string = Get-Content -Path $destinationPath -Raw 

    
Zuletzt kontrollieren wir, ob die Nachricht in der JSON-Datei vorhanden ist. Es könnte passieren, dass die Nachricht codiert wurde (z.B. zu Base64). Falls ja, muss sie nach dem Auslesen decodiert werden:


    # Kontrollieren, ob das File die Nachricht enthält
    if (!$string.Equals('') -or !$string.Equals($null)){
        if ($string.Contains($message)) {
            Write-Output "Test erfolgreich"
        } else {
            Write-Output "Test fehlgeschlagen"
        }
    }
    
Falls es beim Ausführen des Programms zu Problemen kommt, empfehle ich, das Testen, ob die Datei im Blob-Storage gespeichert wurde, aus dem Code zu entfernen und das Kontrollieren, ob die Message richtig gesendet wurde, manuell zu machen. Das ist das Ende meiner kleinen Dokumentation. Bei Fragen, Feedback, etc. bin ich nicht erreichbar. Wenn du einen Fehler im Code oder inhaltliche Ungenauigkeiten entdeckst, kannst du gerne einen Kommentar verfassen. Vielen Dank für deine Aufmerksamkeit. =)
