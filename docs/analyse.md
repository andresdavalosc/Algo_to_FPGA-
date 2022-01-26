# **Analyse**

# Multisim 

## Stap 1
Bij de eerste analyse ging het niet zoals gepland. bij het inkijken van de multisim ( dit kun je zien door '.ms14' achteraan ) bestanden via notepad++ zag ik direct dat er code was waarmee ik er niet veel mee was. Om het even te herhalen dacht ik om een script te maken die de poorten en componenten die op multisim zich bevinden te kopieren en een automatische const en top file aan te maken op vivado voor de FPGA. Na dat dit gebeurt is gaan het een bit file aanmaken en uploaden naar de FPGA. 
#### Dit zag ik bij het openen van het ms14 multisim bestand:

<p align="center">
<img img width="900" height="400" src='../../img/analyse1.png'></img><br></p><br>

## Stap 2
Bij de tweede stap heb ik hetzelfde gedaan als stap 1 maar hier heb ik een pld bestand ( dit kun je zien door '.mspc' achteraan ) aangemaakt op multisim. Bij het openen van dit bestand zag ik wat informatie over de type fpga bord en uitgangs voltage. Dit was niet echt wat ik zocht en negeerde dit bestand omdat ik er niet veel mee was. 

#### Pld bestand
<p align="center">
<img img width="900" height="400" src='../../img/analyse2.png'></img><br></p>

## Stap3
Gelijk de vorige stappen gaan we hier naar de bestanden verder kijken. alleen bij deze stap heb ik iets interessat gevonden. Als je naar de map gaat waar multisim geinstalleerd is  ( bij mij stond het hier 'C:\Program Files (x86)\National Instruments\Circuit Design Suite 14.2') kunnen we een map zien dat Circuit Design Suite noemt. Als je hierop klikt en dan op pldconfig dan zie je aantal bestanden met verschillende FPGA borden (digilentBasys , Arty, Nexys4..etc). Omdat ik met de Basys3 werkte heb ik op digilentBasys.xdc geklikt en zag als volgt dit.

#### digilentBasys3.xdc
<p align="center">
<img img width="400" height="500" src='../../img/analyse4.png'></img><br></p>

Nu vraag je u af waarom dit bestand geopend heb.
in vivado ( waar je de FPGA programmeert ) is er een contraint map en hierin kun je de pinnen van de FPGA aanroepen en ze een naam geven. Hieronder zie je een foto de de constraint bestand.

#### contraint bestand
<p align="center">
<img img width="900" height="200" src='../../img/analyse3.png'></img><br></p>

Zie je iets misschien gelijkaardig? De constraint bestand en de digilentbasys3 bestand hebben dezelfde structuur qua aanroepen van de pinnen. 
Dit zou mij of iemand in de toekomst helpen om de conversie te maken multisim naar FPGA. Jammer genoeg roept deze bestand niet aan wat voor component juist aangesloten is en op welke naam de component heeft. 

 * Voorbeeld:
        Beeld je nu in dat je een schakeling maakt in pld en opslaat. 
        hoe kun je via de digilentbasys3.xdc bestand weten wat er juist aangesloten is 
        en waarop het aangesloten is? dat weet je niet. 
        Daarom gebruik ik dit bestand niet omdat er ik er niet veel kan mee doen. 


# Scilab

Als je scilab niet kent of niet weet waarvoor het dient dan leg ik het kort uit. Scilab is een programma die op matlab trek, hiermee kun je wiskundige formules als simulaties aanmaken om de werking ervan te zien. Dit gebruiken we vaak in DSP ( Digital Signal Processing ) projecten. Hiermee kunnen we bv. sinus vorm gaan genereren met ruis en dan met de kracht van scilab filters gaan plaatsen om een betere zicht te hebben hoe juist een filter een ruis signaal wegfilters. Dit is allemaal goed maar is het mogelijk om te implementeren met de fpga om zo een filter mee te kunnen bouwen ? 

#### analyse
Voor mijn analyse heb ik een de stappen gevolgd van de website zelf. Hieronder kun je de link terug vinden en zelf lezen en het begrijpen. 
( link: https://docplayer.net/48630799-Scicos-hdl-user-guide.html )

Voor dat ik verder ga moet ik je wel teleurstellen en zeggen dat het jammer genoeg niet meer mogelijk is om deze conversie naar de FPGA te realiseren. Maar als je toch interesse hebt hoe ik het geanalyseerd heb mag je verder lezen. 


## Stap 1
download scilab en scicos. Daarna heb je de keuze om de stappen te volgen op de link of mijn manier te volgen. Het verschil is dat je bij hun stappen bepaalde mappen in de D drive moeten installeren en gaan plaatsen. 

## Stap 2
Eens dat alles gedownload is moet je scicos openen en zie je dit. 

<p align="center">
<img img width="500" height="500" src='../../img/scilab1.PNG'></img><br></p>

hier klik je op Applications en kies je scicos. Nu opent zich een venster. Hier klikken we op pallette --> palletes en kunnen we blokken gaan kiezen en plaatsen op de consolse. Dit is waar ik vast zat en niet meer verder kon werken om het te implementeren op de FPGA.

<p align="center">
<img img width="400" height="500" src='../../img/scilab2.PNG'></img><br></p>

Als je wilt weten waarom het niet gelukt is dan kun je naar problemen gaan en zie je een gedetaileerd waarom het niet gelukt is. 
