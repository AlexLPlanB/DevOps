# SYS-lernpfad DevOps

## Dokumentation über das nutzen des Scriptes "testIotConnection.ps1"

Dieses Script und dessen Doku dient dazu, eine Nachricht an eine Azure Iot hub zu senden und diese Nachricht in einem Blob-Container zu speichern. Danach soll die Nachricht als ein JSON File heruntergeladen werden und es wird Kontrolliert, ob die Nachricht erfolgreich übermittelt wurde. 

Zuerst loggen wir uns in Azure ein:

    az login

Danach müssen die notwendigen Eigenschaften definiert werden: 

    $iotHubName = "DEIN_IOT_HUB_NAME"
    $storage = "DEIN_STORAGE_NAME"
    $deviceId = "DEIN_DEVICE_NAME"
    $message = "DEINE_NACHRICHT"
    $containerName = "DEIN_CONTAINER_NAME"
    $destinationPath = "Userstorys\two_three\response.json"

Nun werden wir die Aktuelle Zeit abspeichern um die Nachricht anschließend nach der Uhrzeit zu bennenen, um einen besseren Überblick über alle Messenges zu erhalten und um doppelte Bennenungen zu vermeiden: 

    #Ermittlung der Sendezeit
    $date = Get-Date
    $minutes = $date.Minute


Daraufhin senden wir ausgehend von unserem Device die Nachricht an das Iot Hub:

    #Message senden
    az iot device send-d2c-message --hub-name $iotHubName --device-id $deviceId --data $message


Nach dem senden wollen wir nun kontrollieren, ob die Nachricht in Azure angekommen ist. Dafür downloaden wir den inhalt des Blob-Storage, in dem wir die Nachricht gespeichert haben. (Alternativ kann man auch in Azure nachsehen, ob die JSON-Datei angekommen ist):

    #Blob downloaden zu einem File
    az storage blob download --account-name $storage --container-name $containerName --name ($minutes.ToString()) --file $destinationPath 

    #Content des Blob Files bekommen
    $string = Get-Content -Path $destinationPath -Raw 

Zuletzt kontrollieren wir, ob die Nachricht in der JSON-Datei vorhanden ist. (Es könnte passieren, das die Nachricht codiert wurde (z.B. zu Base64. Falls ja, muss sie nach dem auslesen decodiert werden):

    #Kontrollieren ob das File die Nachricht enthält
    if (!$string.Equals('') -or !$string.Equals($null)){
        if ($string.Contains($message)) {
            Write-Output "Test Successfull"
        } else {
            Write-Output "Test Unsuccessful"
        }
    }


Falls es beim ausführen des Programms zu Problemen kommt empfehle ich, das testen ob die Datei im Blob-Storage gespeichert wurde aus dem Code zu entfernen und das kontrollieren, ob die Message richtig gesendet wurde manuel zu machen. das ist das Ende meiner kleinen Dokumentation. Bei Fragen, Feedback, etc. bin ich unter alexander.lindel@gmx.de zu erreichen. Wenn du einen Fehler im Code oder inhaltliche ungenauigkeiten entdeckst, kannst du gern ein Issue Kommentar befassen. 
Vielen Dank für deine Aufmerksamkeit. =)







