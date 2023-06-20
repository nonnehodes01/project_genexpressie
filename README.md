# Project Genexpressie: RNA-sequencing met de MinION sequencer

In dit project wordt de RNA-sequencing data die gegenereerd is voor MCF7 cellen op het ILC vergeleken met de gepubliceerde data van Chen et al. (2021). Hiervoor wordt een bash-script geschreven dat de verschillende stappen in de workflow combineert, waarbij de inputbestanden (fastq-bestanden) worden bewerkt volgens (een deel van) de methodologie van de gepubliceerde dataset.

## Doel van het project

Het doel van dit project is om de kwaliteit van de RNA-sequencing data te beoordelen door deze te vergelijken met de gepubliceerde dataset. Hierbij worden verschillende visualisaties gebruikt, zoals PCA- en tSNE-plots, scatter plots voor vergelijkingen tussen samples, visualisaties voor kwaliteitscontroles en visualisatie van de reads in de IGV-browser.

## Installatie en gebruik

### Functie 1: het aligneren van Fastq-bestanden tegen een Fasta-referentie

Deze functie, align_with_minimap2, is ontworpen om Fastq-bestanden te aligneren tegen een fasta-referentiebestand, dat een genoom of transcriptoom kan vertegenwoordigen. De alignering wordt uitgevoerd met behulp van de minimap2-tool. Hiervoor is een directory vereist met de Fastq-bestanden die je wilt aligneren, het pad naar het fasta-referentiebestand, en informatie over het type data en de gelezen sequenties (DNA of RNA, lange of korte reads). 

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:

- __'data_type':__ Specificeer het type data dat wordt gealigneerd, "DNA" of "RNA".
- __'read_type':__ Specificeer het type reads, "long" of "short".
- __'input_dir':__ Geef het pad naar de directory met de Fastq-bestanden die je wilt aligneren.
- __'reference_path':__ Specificeer het pad naar het fasta-referentiebestand (genoom of transcriptoom).
- __'outpur_dir':__ Specificeer het pad naar de uitvoerdirectory waarin de gealigneerde bestanden worden opgeslagen.

#### Uitvoeren van de functie:

Om de functie uit te voeren, dien je deze in de terminal uit te voeren met behulp van het Rscript-commando. 
Volg de onderstaande stappen: 

1) Zorg ervoor dat je een conda-omgeving hebt opgezet met minimap2 en samtools geïnstalleerd.

2) Vul de functieparameters in op basis van je specifieke gebruikssituatie (zie het gedeelte "Voorbeeldgebruik van de functie").

3) Activeer je conda-omgeving in de terminal. Navigeer naar de locatie van dit script met behulp van het cd-commando. 

4) Voer het volgende commando uit in de terminal: 

```r
Rscript functie_alignment.R
```

#### Voorbeeldgebruik van de functie:

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r

data_type <- "RNA"  # of "DNA"
read_type <- "long"  # of "short"
input_dir <- "/pad/naar/te/aligneren/bestanden"
reference_path <- "/pad/naar/referentie/genoom"
output_dir <- "/pad/naar/uitvoer/map"

align_with_minimap2(data_type, read_type, input_dir, reference_path, output_dir)

```
Zorg ervoor dat je de juiste paden en parameterwaarden gebruikt die overeenkomen met jouw specifieke situatie voordat je de functie uitvoert. 

Let op: De functie gaat ervan uit dat de input Fastq-bestanden de extensie ".fastq.gz" hebben. Pas het patroon in de list.files-functie aan als je bestanden een andere extensie hebben. 

Vergeet niet om de paden aan te passen naar de werkelijke locaties van de invoer- en uitvoerdirectories, evenals het referentiebestand.

### Functie 2: Filteren van SAM bestanden op basis van flags

Deze functie, filter_flags_directory, is bedoeld om SAM-bestanden te filteren op basis van specifieke flags. Het vereist een invoerdirectory met SAM-bestanden die je wilt filteren, een uitvoerdirectory waarin de gefilterde bestanden worden opgeslagen, en een lijst met flags waarmee je wilt filteren. 

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:
- __'input_directory':__ Geef het pad naar de directory met de SAM-bestanden die je wilt filteren. 
- __'output_directory':__ Geef het pad naar de uitvoerdirectory waarin de gefilterde bestanden worden opgeslagen. 
- __'flags':__ Geef een vector met de gewenste flags om op te filteren. Bijvoorbeeld: c(0, 16).


#### Uitvoeren van de functie 

Om de functie uit te voeren, dien je deze in de terminal uit te voeren met behulp van het Rscript-commando. 
Volg de onderstaande stappen: 

1) Zorg ervoor dat je een conda-omgeving hebt opgezet met minimap2 en samtools geïnstalleerd.

2) Vul de functieparameters in op basis van je specifieke gebruikssituatie (zie het gedeelte "Voorbeeldgebruik van de functie").

3) Activeer je conda-omgeving in de terminal. Navigeer naar de locatie van dit script met behulp van het cd-commando. 

4) Voer het volgende commando uit in de terminal: 

```r
Rscript functie_flags_filtering.R
```

#### Voorbeeldgebruik van de functie

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r

input_directory <- "pad/naar/aligned/sam/files"  # Vervang dit door de naam van de map waarin de input SAM-bestanden zich bevinden
output_directory <- "pad/naar/locatie/voor/opslaan"  # Vervang dit door de naam van de map waarin de gefilterde bestanden moeten worden opgeslagen
flags_to_filter <- c(1, 2)  # Vervang dit door de gewenste flags om op te filteren

filter_flags_directory(input_directory, output_directory, flags_to_filter)

```
Zorg ervoor dat je de juiste paden en flags gebruikt die overeenkomen met jouw specifieke situatie voordat je de functie uitvoert.

De functie zal de SAM-bestanden in de invoerdirectory filteren op basis van de opgegeven flags. De gefilterde bestanden worden opgeslagen in de uitvoerdirectory met de voorvoegsel "gefilterd_" in de bestandsnaam. Een bericht wordt weergegeven in de console voor elk gefilterd bestand met de bijbehorende paden.

Let op: De functie gaat ervan uit dat de inputbestanden de extensie ".sam" hebben. Pas het patroon in de list.files-functie aan als je bestanden een andere extensie hebben.

Let op: De output bestanden van deze functie bevatten __GEEN__ header. deze dien je toe te voegen aan het bestand met behulp van functie 4. 

Vergeet niet om de paden aan te passen naar de werkelijke locaties van de invoer- en uitvoerdirectories voordat je de functie uitvoert.

### Functie 3: het controleren van gefilterde SAM-bestanden

Deze functie, noteer_unieke_waarden_sam_directory_terminal, is bedoeld om de gefilterde SAM-bestanden te controleren en te beoordelen of de flag-filtering correct is uitgevoerd. Het controleert of er nog andere bestanden in de opgegeven directory aanwezig zijn dan de verwachte gefilterde SAM-bestanden. Deze functie is ontworpen om te worden uitgevoerd in een terminalomgeving.

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:

- _'directory':_ Geef het pad naar de directory waarin de gefilterde SAM-bestanden zich bevinden. 
let op: gebruik hier de output directory die gegenereerd is bij functie 2. 

#### Uitvoeren van de functie:

Om de functie uit te voeren, dien je deze in de terminal uit te voeren met behulp van het Rscript-commando. 
Volg de onderstaande stappen: 

1) Zorg ervoor dat je een conda-omgeving hebt opgezet met minimap2 en samtools geïnstalleerd.

2) Vul de functieparameters in op basis van je specifieke gebruikssituatie (zie het gedeelte "Voorbeeldgebruik van de functie").

3) Activeer je conda-omgeving in de terminal. Navigeer naar de locatie van dit script met behulp van het cd-commando. 

4) Voer het volgende commando uit in de terminal: 

```r
Rscript functie_check_filter.R
```

#### Voorbeeldgeberuik van de functie:

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r
directory <- "pad/naar/output/directory/van/functie/2"  # Vervang dit door het pad naar de directory met de gefilterde SAM-bestanden

noteer_unieke_waarden_sam_directory_terminal(directory)

```
Zorg ervoor dat je het juiste pad opgeeft naar de directory met de gefilterde SAM-bestanden voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand in de opgegeven directory controleren. Het zal de unieke waarden en hun frequentie noteren door het uitvoeren van een terminalcommando dat gebruikmaakt van awk, sort en uniq. Het resultaat wordt afgedrukt in de R-console, waarbij elk bestand wordt gevolgd door de unieke waarden en hun frequentie.

Let op: Deze functie gaat ervan uit dat de gefilterde bestanden de extensie ".sam" hebben. Pas het patroon in de list.files-functie aan als je bestanden een andere extensie hebben.

Vergeet niet om het pad naar de directory met de gefilterde SAM-bestanden aan te passen naar de werkelijke locatie voordat je de functie uitvoert.

### Functie 4: het verwerken van SAM-bestanden met samtools

Deze functie, process_samtools_command, is bedoeld om SAM-bestanden te verwerken met behulp van samtools. Het combineert de header van het gealigneerde bestand (functie 1) met de gefilterde regels (functie 2) en slaat het resultaat op in een nieuw bestand. Deze functie vereist de paden naar de mappen waarin de gealigneerde en gefilterde SAM-bestanden zich bevinden, evenals de map waarin de gecombineerde bestanden moeten worden opgeslagen.

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:

- __'aligned_directory':__ Geef het pad naar de map waarin de gealigneerde SAM-bestanden zich bevinden.
- __'filtered_directory':__ Geef het pad naar de map waarin de gefilterde SAM-bestanden zich bevinden.
- __'output_directory':__ Geef het pad naar de map waarin de gecombineerde bestanden moeten worden opgeslagen.

#### Uitvoeren van de functie:

Om de functie uit te voeren, dien je deze in de terminal uit te voeren met behulp van het Rscript-commando. 
Volg de onderstaande stappen: 

1) Zorg ervoor dat je een conda-omgeving hebt opgezet met minimap2 en samtools geïnstalleerd.

2) Vul de functieparameters in op basis van je specifieke gebruikssituatie (zie het gedeelte "Voorbeeldgebruik van de functie").

3) Activeer je conda-omgeving in de terminal. Navigeer naar de locatie van dit script met behulp van het cd-commando. 

4) Voer het volgende commando uit in de terminal: 

```r
Rscript functie_add_header.R
```

#### Voorbeeldgebruik van de functie

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r
aligned_directory <- "pad/naar/output/map/van/functie/1"  # Vervang dit door het pad naar de map met de gealigneerde SAM-bestanden
filtered_directory <- "pad/naar/output/map/van/functie/2"  # Vervang dit door het pad naar de map met de gefilterde SAM-bestanden
output_directory <- "pad/naar/locatie/voor/output/files"  # Vervang dit door de naam van de map waarin de gecombineerde bestanden moeten worden opgeslagen

process_samtools_command(aligned_directory, filtered_directory, output_directory)

```

Zorg ervoor dat je de juiste paden opgeeft naar de betreffende mappen voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand combineren met de header van het overeenkomstige gealigneerde bestand. Het gecombineerde bestand wordt opgeslagen in de opgegeven output_directory. Het script maakt automatisch de output_directory aan als deze nog niet bestaat.

Vergeet niet om de paden naar de mappen met de gealigneerde en gefilterde SAM-bestanden en de output_directory aan te passen naar de werkelijke locaties voordat je de functie uitvoert.

### Functie 5: het converteren van SAM-bestanden naar BAM-bestanden

Deze functie, convert_sam_files_to_bam, is bedoeld om gefilterde SAM-bestanden om te zetten naar het BAM-formaat met behulp van het samtools-commando. De functie vereist het pad naar de map met de gefilterde SAM-bestanden en het pad naar de map waarin de resulterende BAM-bestanden moeten worden opgeslagen.

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters

- __'input_dir':__ Geef het pad naar de map met de gefilterde SAM-bestanden.
- __'output_dir':__ Geef het pad naar de map waarin de BAM-bestanden moeten worden opgeslagen.

#### Uitvoeren van de functie

Om de functie uit te voeren, dien je deze in de terminal uit te voeren met behulp van het Rscript-commando. 
Volg de onderstaande stappen: 

1) Zorg ervoor dat je een conda-omgeving hebt opgezet met minimap2 en samtools geïnstalleerd.

2) Vul de functieparameters in op basis van je specifieke gebruikssituatie (zie het gedeelte "Voorbeeldgebruik van de functie").

3) Activeer je conda-omgeving in de terminal. Navigeer naar de locatie van dit script met behulp van het cd-commando. 

4) Voer het volgende commando uit in de terminal: 

```r
Rscript functie_sam_to_bam.R
```

#### Voorbeeldgebruik van de functie

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r
input_dir <- "pad/naar/output/directory/van/functie/4"  # Vervang dit door het pad naar de map met de gefilterde SAM-bestanden
output_dir <- "pad/naar/locatie/voor/output/files"  # Vervang dit door het pad naar de map waarin de BAM-bestanden moeten worden opgeslagen

convert_sam_files_to_bam(input_dir, output_dir)

```
Zorg ervoor dat je de juiste paden opgeeft naar de betreffende mappen voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand converteren naar het BAM-formaat met behulp van het samtools-commando. Het geconverteerde BAM-bestand wordt opgeslagen in de opgegeven output_dir. Het script maakt automatisch de output_dir aan als deze nog niet bestaat.

Vergeet niet om de paden naar de mappen met de gefilterde SAM-bestanden en de output_dir aan te passen naar de werkelijke locaties voordat je de functie uitvoert.

## Visualisaties

Dit project richt zich ook op het gebruik van visualisaties en een PCA-analyse om inzicht te krijgen in genomische gegevens. Visualisaties stellen onderzoekers in staat om de complexe patronen en relaties in de gegevens te begrijpen, terwijl PCA-analyse helpt bij het identificeren van belangrijke variabiliteit en het ontdekken van verborgen structuren.

### IGV-Browser voor Genomische Visualisaties

De IGV-Browser (Integrative Genomics Viewer) is een veelgebruikte tool voor het visualiseren en verkennen van genoomgebieden en bijbehorende genetische informatie. Met IGV-Browser kunnen we de expressie van genen, varianten, epigenetische modificaties en andere genomische kenmerken in context bekijken. We kunnen bladeren door het genoom, inzoomen op specifieke regio's, annotaties toevoegen en verschillende lagen van gegevens overlappen om een beter begrip te krijgen van de biologische processen die plaatsvinden.

De IGV browser gebruikt bigwig bestanden, omdat er tot nu toe alleen nog sam en bam bestanden gemaakt zijn, zijn er eerst een paar functies geschreven voor het omzetten van sam bestanden naar bigwig. 

#### Functie 1: Sam naar Bed

Dit script bevat een functie om het script "SamtoBed.sh" uit te voeren voor elk SAM-bestand in een opgegeven map.

##### Gebruiksinstructies:

1) Zorg ervoor dat de benodigde bestanden aanwezig zijn. Plaats het script "SamtoBed.sh" en het R-script in dezelfde map.

2) Pas de variabelen sam_dir en toBed_file aan in het R-script:
- __'sam_dir':__ Het pad naar de map waarin de SAM-bestanden zich bevinden.

3) Open een terminal en navigeer naar de map waarin het R-script zich bevindt.

4) Voer het R-script uit met behulp van het commando: 

```r
Rscript functie_sam_to_bed.R
```

5) De functie zal het script "SamtoBed.sh" aanroepen voor elk bestand. Het uitvoerresultaat zal worden weergegeven in de terminal.

##### Voorbeeldgebruik:

```r
sam_dir <- "/pad/naar/sam/bestanden" #verander dit naar het gewenste pad

process_sam_files(sam_dir, toBed_file)
```

#### Functie 2: bed naar bigwig

Dit script bevat een functie om het script "auto_wigtobigwig_hg38.sh" aan te roepen voor elk BED-bestand in een opgegeven map.

##### Gebruiksinstructies:

1) Zorg ervoor dat de benodigde bestanden aanwezig zijn. Plaats het script "auto_wigtobigwig_hg38.sh" en het R-script in dezelfde map.

2) Pas de variabele bed_dir aan in het R-script:

- __'bed_dir':__ Het pad naar de map waarin de BED-bestanden zich bevinden.

3) Open een terminal en navigeer naar de map waarin het R-script zich bevindt.

4)  Voer het R-script uit met behulp van het commando:

```r
Rscript functie_bed_to_bw.R
```

5) De functie zal het script "auto_wigtobigwig_hg38.sh" aanroepen voor elk bestand. Het uitvoerresultaat zal worden weergegeven in de terminal.

##### Voorbeeldgebruik:

```r
bed_dir <- "/pad/naar/bed/bestanden" #verander dit naar het gewenste pad
  
process_bed_files(bed_dir)
```
