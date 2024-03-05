# ***SYS-Lernpfad DevOps***

> [!NOTE]
> Dieses Projekt dient dazu, einen kurzen Überblick über das Thema DevOps zu bieten. Wir werden hauptsächlich mit Azure von Microsoft arbeiten und werden uns Tools und Konzepte anschauen, um das Verwalten eines Projektes über Git einfacher zu gestalten und das erledigen von Aufgaben zu automatisieren.                              

## DevOps - die Praxis, nicht Azure DevOps die Plattform (CD & CI)

DevOps bezeichnet den Ansatz, Entwicklung (Dev) und IT-Betrieb (Ops) miteinander zu verbinden. Diese Zusammenarbeit verbessert die Kommunikation, automatisiert Prozesse und steigert die Produktivität während der gesamten Softwareentwicklungsphase.

![image](https://github.com/AlexLPlanB/DevOps/assets/159454517/beab6d23-7cd3-411e-86a5-13bd9f1f2820)

- ***Continuous Integration (CI):***
Bei der Continuous Integration werden Codeänderungen von mehreren Beteiligten automatisch in ein gemeinsames Repository integriert. Sie hilft, Integrationsprobleme frühzeitig im Entwicklungsprozess zu erkennen und zu beheben.

- ***Continuous Deployment (CD):***
CD automatisiert die Bereitstellung von Codeänderungen in Test-, Staging- und Produktionsumgebungen. Dadurch wird ein konsistenter und zuverlässiger Release-Prozess gewährleistet und es kann somit effektiver gearbeitet werden.

## IoT - Was bedeutet es und wo kann es eingesetzt werden?

IoT (Internet of Things) ist ein Konzept, bei dem physische Geräte, oft Alltagsgegenstände, mit dem Internet verbunden werden, damit sie Daten sammeln und austauschen können. Diese Geräte können miteinander kommunizieren und eine Verbindung zu zentralen Systemen herstellen. Das Ziel des IoT ist es, ein intelligentes und vernetztes Netzwerk zu schaffen, das die Effizienz aller Geräte im Netzwerk steigert und sie besser zusammenarbeiten können. 

## Bicep - Microsoft-Sprache für Ressourcen
Bicep ist eine domänenspezifische Sprache (DSL), die von Microsoft für die Bereitstellung von Azure-Ressourcen entwickelt wurde. Sie wurde entwickelt, um die Erstellung und Verwaltung von Azure-Ressourcen zu vereinfachen, indem sie im Vergleich zu anderen Sprachen eine besser lesbare Syntax bietet. In einer Bicep-Datei definiert man die Infrastruktur, die man in Azure bereitstellen möchten, und verwenden diese Datei dann während des gesamten Entwicklungslebenszyklus, womit man seine Infrastruktur wiederholt bereitstellen kann. 

Hier ein Beispiel: 

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
> Bei unklarheiten auf folgende Webseite gehen:                                             
>  https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep

## Azure-Subscription, Ressourcengruppen 

- ***Azure Subscription***:
Eine Azure Subscription ist ein Container für Ressourcen in Microsoft Azure. Sie bietet eine Möglichkeit, Ressourcen zu verwalten und zu organisieren und den Zugriff auf Azure-Dienste zu kontrollieren.

- ***Resource Groups***:
Eine Ressourcengruppe ist ein Container für Ressourcen, die in Azure bereitgestellt werden. Sie hilft bei der Organisation und Verwaltung von Ressourcen, der Anwendung einheitlicher Richtlinien und der Vereinfachung des Abrechnungsprozesses. 

## Blob - Speichertyp und was darin gespeichert werden soll 

- ***Blob Storage:***
Azure Blob Storage ist die Objektspeicherlösung von Microsoft für die Cloud. Sie ist für die Speicherung großer Mengen unstrukturierter Daten, wie Text- oder Binärdaten, optimiert.

- ***Nutzen***:
Der Blob Storage eignet sich für die Speicherung großer Dateien, wie Videos und Bilder, Backups und anderer unstrukturierter Daten.

- ***Service Principal - Azure-Bereitstellung:***
   Ein Service Principal in Azure ist eine Sicherheitsidentität, die von Anwendungen, Diensten und Automatisierungstools für den Zugriff auf Azure-Ressourcen verwendet wird. Es bietet eine sichere Möglichkeit für Bereitstellungen und Automatisierungen, mit Azure-Diensten zu interagieren, ohne Benutzeranmeldeinformationen offenlegen zu müssen.


## Git - Source Control  

- ***Pull Request:***
   Ein Pull Request (PR) ist ein Mechanismus in Git, um Änderungen von einem Zweig zu einem anderen vorzuschlagen. Er ermöglicht es den Teammitgliedern, die vorgeschlagenen Änderungen zu überprüfen, zu diskutieren und gemeinsam daran zu arbeiten, bevor sie in den Zielzweig eingefügt werden.

- ***Branch:*** 
   Ein Branch in Git ist eine parallele Version der Codebasis, die es den Entwicklern ermöglicht, unabhängig voneinander an Funktionen oder Fehlerbehebungen zu arbeiten, ohne den Hauptcode zu beeinträchtigen. Branches helfen bei der Organisation und Verwaltung von Entwicklungsabläufen.
   
- ***Commit:***
   Ein Commit in Git ist ein Schnappschuss von Änderungen, die an der Codebasis vorgenommen wurden. Er stellt einen bestimmten Punkt in der Versionsgeschichte dar, und jeder Commit hat einen eindeutigen Bezeichner. Commits helfen dabei, Änderungen zu verfolgen und bei Bedarf rückgängig zu machen.


## GitHub 
GitHub ist eine webbasierte Plattform für das Hosting und die Zusammenarbeit an Git-Repositories. Sie bietet Funktionen wie Issue Tracking, Pull Requests und Workflows zur Verbesserung der Zusammenarbeit zwischen Entwicklern.

- ***Repository:***
   Ein Repository in GitHub ist ein Container für ein Projekt, der Code, Dokumentation und verwandte Ressourcen enthält. Es ermöglicht die Versionskontrolle und

- ***Action:*** 
   GitHub-Actions sind automatisierte Workflows, die durch Ereignisse in einem GitHub-Repository ausgelöst werden. Sie ermöglichen eine kontinuierliche Integration und Bereitstellung, so dass Entwickler Aufgaben wie das Erstellen, Testen und Bereitstellen von Code automatisieren können.


## Voraussetzungen für diesen Lernpfad und die folgenden Aufgaben

1. Visual Studio Code und Bicep als Ressourcenvorlage installieren 
2. Informiere dich über mehr Biceps und versuch es so gut wie möglich zu verstehen 
3. Installiere PowerShell Core mit der Azure-Erweiterung 
- [Powershell Core für Windows](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2) 
- [Azure Az Powershell module](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep)

4. Authentifizieren dich bei Azure für dein Abonnement und deine eigene Ressourcengruppe


## Die ersten Schritte

1. Erstelle dein erstes Template (Vorlage) für deinen Storage Account
   [Microsoft.Storage storageAccounts](https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?pivots=deployment-language-bicep)
2. Das Template sollte ein Parameter für für den Namen des Storage Accounts besitzen
3. Bereitstellen des Templates für deine Ressourcengruppe mit PowerShell
4. Authentifizieren dich mit Azure bei deiner Abonnement- und Ressourcengruppe
