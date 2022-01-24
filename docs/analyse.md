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
