# SYS-lernpfad DevOps

## Dokumentation über das nutzen des Scriptes "testIotConnection.ps1"

Dieses Script und dessen Doku dient dazu, eine Nachricht an eine Azure Iot hub zu senden und diese Nachricht in einem Blob-Container zu speichern. Danach soll die Nachricht als ein JSON File heruntergeladen werden und es wird Kontrolliert, ob die Nachricht erfolgreich übermittelt wurde. 


Zuerst müssen die notwendigen Eigenschaften definiert werden: 

    $iotHubName = "DEIN_IOT_HUB_NAME"
    $storage = "DEIN_STORAGE_NAME"
    $deviceId = "DEIN_DEVICE_NAME"
    $message = "DEINE_NACHRICHT"
    $containerName = "DEIN_CONTAINER_NAME"
    $destinationPath = "Userstorys\two_three\response.json"

Nun werden wir die Aktuelle Zeit abspeichern um 
