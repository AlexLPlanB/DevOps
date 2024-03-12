# ***SYS-Lernpfad DevOps***

<p>



                



      
</p>

> [!NOTE]
> Dieses Projekt dient dazu, einen kurzen Überblick über das Thema DevOps zu bieten. Wir werden hauptsächlich mit Azure von Microsoft arbeiten und werden uns Tools und Konzepte anschauen, um das Verwalten eines Projektes über Git einfacher zu gestalten und das erledigen von Aufgaben zu automatisieren. Keine Garantie auf Richtigkeit!                           

## DevOps - die Praxis, nicht Azure DevOps die Plattform (CD & CI)

DevOps bezeichnet den Ansatz, Entwicklung (Dev) und IT-Betrieb (Ops) miteinander zu verbinden. Diese Zusammenarbeit verbessert die Kommunikation, automatisiert Prozesse und steigert die Produktivität während der gesamten Softwareentwicklungsphase.

![image](https://github.com/AlexLPlanB/DevOps/assets/159454517/beab6d23-7cd3-411e-86a5-13bd9f1f2820)

- ***Continuous Integration (CI):***
Bei der Continuous Integration werden Codeänderungen von mehreren Beteiligten automatisch in ein gemeinsames Repository integriert. Sie hilft, Integrationsprobleme frühzeitig im Entwicklungsprozess zu erkennen und zu beheben.

- ***Continuous Deployment (CD):***
CD automatisiert die Bereitstellung von Codeänderungen in Test-, Staging- und Produktionsumgebungen. Dadurch wird ein konsistenter und zuverlässiger Release-Prozess gewährleistet und es kann somit effektiver gearbeitet werden.

## IoT - Was bedeutet es und wo kann es eingesetzt werden?

IoT (Internet of Things) ist ein Konzept, bei dem physische Geräte, oft Alltagsgegenstände, mit dem Internet verbunden werden, damit sie Daten sammeln und austauschen können. Diese Geräte können miteinander kommunizieren und eine Verbindung zu zentralen Systemen herstellen. Das Ziel des IoT ist es, ein intelligentes und vernetztes Netzwerk zu schaffen, das die Effizienz aller Geräte im Netzwerk steigert und sie besser zusammenarbeiten können. 

![kisspng-internet-of-things-narrowband-iot-technology-lpwan-5b37c647570a03 6535281315303818953565](https://github.com/AlexLPlanB/DevOps/assets/159454517/66526ed0-2e81-40c0-b5de-62d32407ec8b)


## Bicep - Microsoft-Sprache für Ressourcen
Bicep ist eine domänenspezifische Sprache (DSL), die von Microsoft für die Bereitstellung von Azure-Ressourcen entwickelt wurde. Sie wurde entwickelt, um die Erstellung und Verwaltung von Azure-Ressourcen zu vereinfachen, indem sie im Vergleich zu anderen Sprachen eine besser lesbare Syntax bietet. In einer Bicep-Datei definiert man die Infrastruktur, die man in Azure bereitstellen möchten, und verwenden diese Datei dann während des gesamten Entwicklungslebenszyklus, womit man seine Infrastruktur wiederholt bereitstellen kann. 

Hier ein Beispiel wie man einen Storage-Account deployed: 

      param location string = resourceGroup().location
      param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'

      resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
        name: storageAccountName
        location: location
        sku: {
          name: 'Standard_LRS'
        }
        kind: 'StorageV2'
        properties: {
          accessTier: 'Hot'
        }
      }

> [!TIP]
> Bei Unklarheiten und für weitere Informationen auf [diese Webseite](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI) gehen.                                    

## Azure-Subscription, Ressourcengruppen 

- ***Azure Subscription:***
Eine Azure Subscription ist ein Container für Ressourcen in Microsoft Azure. Sie bietet eine Möglichkeit, Ressourcen zu verwalten und zu organisieren und den Zugriff auf Azure-Dienste zu kontrollieren.

- ***Resource Groups:***
Eine Ressourcengruppe ist ein Container für Ressourcen, die in Azure bereitgestellt werden. Sie hilft bei der Organisation und Verwaltung von Ressourcen, der Anwendung einheitlicher Richtlinien und der Vereinfachung des Abrechnungsprozesses. 

## Blob - Speichertyp und was darin gespeichert werden soll 

- ***Blob Storage:***
Azure Blob Storage ist die Objektspeicherlösung von Microsoft für die Cloud. Sie ist für die Speicherung großer Mengen unstrukturierter Daten, wie Text- oder Binärdaten da.

- ***Nutzen***:
Der Blob Storage eignet sich für die Speicherung großer Dateien, wie Videos und Bilder, Backups wichtiger Dateien und anderer unstrukturierter Daten.

- ***Service Principal - Azure-Bereitstellung:***
   Ein Azure-Service Principal ist eine Identität, die zur Verwendung mit Anwendungen, gehosteten Diensten und automatisierten Tools für den Zugriff auf Azure-Ressourcen erstellt wird. Durch die dem Service Principal zugewiesenen Rollen wird dieser Zugriff eingeschränkt, sodass du steuern kannst, welche Ebene auf welche Ressourcen zugegreifen kann.


## Git - Source Control  

- ***Pull Request:***
   Ein Pull Request (auch Merge Request) ist ein Ereignis, das auftritt, wenn ein Entwickler eine Anfrage schickt, um Code-Änderungen aus einem Branch mit dem Hauptprojekt-Repository zu verschmelzen. Wenn ein Pull Request akzeptiert wird, spricht man von einem Merge. Wenn er geschlossen wird, spricht man von einem Close.
   

- ***Branch:***
   Ein Branch in Git ist eine parallele Version des Codes, die es den Entwicklern ermöglicht, unabhängig voneinander an Funktionen oder Fehlerbehebungen zu arbeiten, ohne den Hauptcode zu beeinträchtigen. Branches helfen bei der Organisation und Verwaltung von Entwicklungsabläufen.
   
- ***Commit:***
   Als Commit in Git bezeichnet man den Vorgang des Einspielens von neuem oder geändertem Quelltext und anderen Dateien in das Versionsverwaltungssystem.
  Wenn ein Entwickler Änderungen an seinem Code vornimmt und diese für andere zugänglich machen will, erstellt er einen Commit.
  Ein Commit ist eine Art Screenshot des Projekts zu einem bestimmten Zeitpunkt. Es speichert den aktuellen Zustand der Dateien und Änderungen.
  Die Änderungen werden dann im Repository festgehalten, welche dann von anderen Entwicklerngenutzt werden können.


## GitHub 
GitHub ist eine Plattform für das Hosting und die Zusammenarbeit an Git-Repositories. Sie bietet Funktionen wie Issue Tracking, Pull Requests und Workflows zur Verbesserung der Zusammenarbeit zwischen Entwicklern.

- ***Repository:***
   Ein Repository (kurz Repo) in GitHub ist ein verwalteter Container für ein Projekt, der Code, Dokumentationen und andere Ressourcen enthält. Entwickler können damit Änderungen einshen, bearbeiten und wieder einsenden mit deren Veränderungen und Protokollen.

- ***Action:*** 
   GitHub Actions ist eine Plattform für Continuous Integration und Continuous Delivery (CI & CD). Mit GitHub Actions kannst du Builds, Tests und Bereitstellungen automatisieren.
Du kannst Workflows erstellen, die Aufgaben wie das Testen und Erstellen von Pull Requests oder das Bereitstellen von gemergten Pull Requests für die Produktion ausführen können.

***_____________________________________________________________________________________________________________________________***

## Voraussetzungen für diesen Lernpfad und die folgenden Aufgaben

1. Visual Studio Code und Bicep als Ressourcenvorlage installieren 
2. Informiere dich über mehr Biceps und versuch es so gut wie möglich zu verstehen 
3. Installiere PowerShell Core mit der Azure-Erweiterung 
      - [Powershell Core für Windows](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2) 
      - [Azure Az Powershell module](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep)

4. Authentifizieren dich bei Azure für dein Abonnement und deine eigene Ressourcengruppe


## Die ersten Schritte

1. Erstelle dein erstes Template (Vorlage) für deinen Storage Account

2. Das Template sollte ein Parameter für für den Namen des Storage Accounts besitzen
3. Bereitstellen des Templates für deine Ressourcengruppe mit PowerShell
4. Authentifizieren dich mit Azure bei deiner Abonnement- und Ressourcengruppe

> [!TIP]
> [Diese Webseite](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/) kann der Erstellung des ersten Templates helfen:                                                                                       
                                                                                                                        

## Eine kurze Dokumentation über die Ressourcen in Azure, die genutzt werden können um Web Apps zu erstellen:

- ***Azure App Service***

  Der Azure App Service ist eine vollständig verwaltete Plattform für das Erstellen, Bereitstellen und Skalieren von Webanwendungen. Entwickler können verschiedene App-Typen hosten, einschließlich Web-Apps, mobile Apps 
  und APIs. Der App Service bietet automatische Skalierung, kontinuierliche Bereitstellung und integrierte Überwachung.

- ***Containers in Azure***

  Azure bietet umfassende Unterstützung für Container mit Azure Kubernetes Service (AKS) und Azure Container Instances (ACI). Entwickler können Container für ihre Webanwendungen verwenden, um konsistente Bereitstellungen und
  Skalierbarkeit zu gewährleisten.

- ***Azure Functions***

  Azure Functions ermöglichen die serverlose Ausführung von Code in Reaktion auf Ereignisse. Entwickler können Funktionen erstellen, die automatisch auf HTTP-Anforderungen, Datenänderungen oder zeitgesteuerte Ereignisse reagieren.

> [!TIP]
> Wenn du eine Web-App hosten willst würde ich Azure Service App empfehlen. Sie erfüllt alle notwendigen Anforderungen und die Automatisierung mit GitHub vereinfacht den Arbeitsablauf erheblich.
Für eine einfache Dokumentation, wie man eine Website einrichtet, ist [dieses Tutorial](https://medium.com/@farzam_m/getting-started-with-azure-bicep-deploying-a-hello-world-web-application-ae144535749d) hilfreich.

# Aufgaben

> [!NOTE]
> Die Dokus der einzlenen Aufgaben befinden können in den Userstory Ordnern gefunden werden. 
