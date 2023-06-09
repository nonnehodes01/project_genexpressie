# Project Genexpressie: RNA-sequencing met de MinION sequencer

In dit project wordt de RNA-sequencing data die gegenereerd is voor MCF7 cellen op het ILC vergeleken met de gepubliceerde data van Chen et al. (2021). Hiervoor wordt een bash-script geschreven dat de verschillende stappen in de workflow combineert, waarbij de inputbestanden (fastq-bestanden) worden bewerkt volgens (een deel van) de methodologie van de gepubliceerde dataset.

## Doel van het project

Het doel van dit project is om de kwaliteit van de RNA-sequencing data te beoordelen door deze te vergelijken met de gepubliceerde dataset. Hierbij worden verschillende visualisaties gebruikt, zoals PCA- en tSNE-plots, scatter plots voor vergelijkingen tussen samples, visualisaties voor kwaliteitscontroles en visualisatie van de reads in de IGV-browser.

## Installatie en gebruik

Alle functies zijn in de github repo te downloaden onder het kopje "functies", hieraan zijn ook de functies voor het visualiseren te vinden. 

### Functie 1: het aligneren van Fastq-bestanden tegen een Fasta-referentie

Deze functie, align_with_minimap2, is ontworpen om Fastq-bestanden te aligneren tegen een fasta-referentiebestand, dat een genoom of transcriptoom kan vertegenwoordigen. De alignering wordt uitgevoerd met behulp van de minimap2-tool. Hiervoor is een directory vereist met de Fastq-bestanden die je wilt aligneren, het pad naar het fasta-referentiebestand, en informatie over het type data en de gelezen sequenties (DNA of RNA, lange of korte reads). 

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:

- __'data_type_alignment':__ Specificeer het type data dat wordt gealigneerd, "DNA" of "RNA".
- __'read_type_alignment':__ Specificeer het type reads, "long" of "short".
- __'input_dir_alignment':__ Geef het pad naar de directory met de Fastq-bestanden die je wilt aligneren.
- __'reference_path_alignment':__ Specificeer het pad naar het fasta-referentiebestand (genoom of transcriptoom).
- __'outpur_dir_alignment':__ Specificeer het pad naar de uitvoerdirectory waarin de gealigneerde bestanden worden opgeslagen.

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

data_type_alignment <- "RNA"  # of "DNA"
read_type_alignment <- "long"  # of "short"
input_dir_alignment <- "/pad/naar/te/aligneren/bestanden"
reference_path_alignment <- "/pad/naar/referentie/genoom"
output_dir_alignment <- "/pad/naar/uitvoer/map"

align_with_minimap2(data_type_alignment, read_type_alignment, input_dir_alignment, reference_path_alignment, output_dir_alignment)

```
Zorg ervoor dat je de juiste paden en parameterwaarden gebruikt die overeenkomen met jouw specifieke situatie voordat je de functie uitvoert. 

Let op: De functie gaat ervan uit dat de input Fastq-bestanden de extensie ".fastq.gz" hebben. Pas het patroon in de list.files-functie aan als je bestanden een andere extensie hebben. 

Vergeet niet om de paden aan te passen naar de werkelijke locaties van de invoer- en uitvoerdirectories, evenals het referentiebestand.

### Functie 2: Filteren van SAM bestanden op basis van flags

Deze functie, filter_flags_directory, is bedoeld om SAM-bestanden te filteren op basis van specifieke flags. Het vereist een invoerdirectory met SAM-bestanden die je wilt filteren, een uitvoerdirectory waarin de gefilterde bestanden worden opgeslagen, en een lijst met flags waarmee je wilt filteren. 

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:
- __'input_directory_filtering':__ Geef het pad naar de directory met de SAM-bestanden die je wilt filteren. 
- __'output_directory_filtering':__ Geef het pad naar de uitvoerdirectory waarin de gefilterde bestanden worden opgeslagen. 
- __'flags_filtering':__ Geef een vector met de gewenste flags om op te filteren. Bijvoorbeeld: c(0, 16).


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

input_directory_filtering <- "pad/naar/aligned/sam/files"  # Vervang dit door de naam van de map waarin de input SAM-bestanden zich bevinden
output_directory_filtering <- "pad/naar/locatie/voor/opslaan"  # Vervang dit door de naam van de map waarin de gefilterde bestanden moeten worden opgeslagen
flags_to_filter_filtering <- c(1, 2)  # Vervang dit door de gewenste flags om op te filteren

filter_flags_directory(input_directory_filtering, output_directory_filtering, flags_to_filter_filtering)

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

- _'directory_check':_ Geef het pad naar de directory waarin de gefilterde SAM-bestanden zich bevinden. 
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
directory_check <- "pad/naar/output/directory/van/functie/2"  # Vervang dit door het pad naar de directory met de gefilterde SAM-bestanden

noteer_unieke_waarden_sam_directory_terminal(directory_check)

```
Zorg ervoor dat je het juiste pad opgeeft naar de directory met de gefilterde SAM-bestanden voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand in de opgegeven directory controleren. Het zal de unieke waarden en hun frequentie noteren door het uitvoeren van een terminalcommando dat gebruikmaakt van awk, sort en uniq. Het resultaat wordt afgedrukt in de R-console, waarbij elk bestand wordt gevolgd door de unieke waarden en hun frequentie.

Let op: Deze functie gaat ervan uit dat de gefilterde bestanden de extensie ".sam" hebben. Pas het patroon in de list.files-functie aan als je bestanden een andere extensie hebben.

Vergeet niet om het pad naar de directory met de gefilterde SAM-bestanden aan te passen naar de werkelijke locatie voordat je de functie uitvoert.

### Functie 4: het verwerken van SAM-bestanden met samtools

Deze functie, process_samtools_command, is bedoeld om SAM-bestanden te verwerken met behulp van samtools. Het combineert de header van het gealigneerde bestand (functie 1) met de gefilterde regels (functie 2) en slaat het resultaat op in een nieuw bestand. Deze functie vereist de paden naar de mappen waarin de gealigneerde en gefilterde SAM-bestanden zich bevinden, evenals de map waarin de gecombineerde bestanden moeten worden opgeslagen.

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters:

- __'aligned_directory_add_header':__ Geef het pad naar de map waarin de gealigneerde SAM-bestanden zich bevinden.
- __'filtered_directory_add_header':__ Geef het pad naar de map waarin de gefilterde SAM-bestanden zich bevinden.
- __'output_directory_add_header':__ Geef het pad naar de map waarin de gecombineerde bestanden moeten worden opgeslagen.

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
aligned_directory_add_header <- "pad/naar/output/map/van/functie/1"  # Vervang dit door het pad naar de map met de gealigneerde SAM-bestanden
filtered_directory_add_header <- "pad/naar/output/map/van/functie/2"  # Vervang dit door het pad naar de map met de gefilterde SAM-bestanden
output_directory_add_header <- "pad/naar/locatie/voor/output/files"  # Vervang dit door de naam van de map waarin de gecombineerde bestanden moeten worden opgeslagen

process_samtools_command(aligned_directory_add_header, filtered_directory_add_header, output_directory_add_header)

```

Zorg ervoor dat je de juiste paden opgeeft naar de betreffende mappen voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand combineren met de header van het overeenkomstige gealigneerde bestand. Het gecombineerde bestand wordt opgeslagen in de opgegeven output_directory. Het script maakt automatisch de output_directory aan als deze nog niet bestaat.

Vergeet niet om de paden naar de mappen met de gealigneerde en gefilterde SAM-bestanden en de output_directory aan te passen naar de werkelijke locaties voordat je de functie uitvoert.

### Functie 5: het converteren van SAM-bestanden naar BAM-bestanden

Deze functie, convert_sam_files_to_bam, is bedoeld om gefilterde SAM-bestanden om te zetten naar het BAM-formaat met behulp van het samtools-commando. De functie vereist het pad naar de map met de gefilterde SAM-bestanden en het pad naar de map waarin de resulterende BAM-bestanden moeten worden opgeslagen.

Om deze functie effectief te gebruiken, volg je onderstaande stappen:

#### Functieparameters

- __'input_dir_sam_bam':__ Geef het pad naar de map met de gefilterde SAM-bestanden.
- __'output_dir_sam_bam':__ Geef het pad naar de map waarin de BAM-bestanden moeten worden opgeslagen.

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
input_dir_sam_bam <- "pad/naar/output/directory/van/functie/4"  # Vervang dit door het pad naar de map met de gefilterde SAM-bestanden
output_dir_sam_bam <- "pad/naar/locatie/voor/output/files"  # Vervang dit door het pad naar de map waarin de BAM-bestanden moeten worden opgeslagen

convert_sam_files_to_bam(input_dir_sam_bam, output_dir_sam_bam)

```
Zorg ervoor dat je de juiste paden opgeeft naar de betreffende mappen voordat je de functie uitvoert.

De functie zal elk gefilterd SAM-bestand converteren naar het BAM-formaat met behulp van het samtools-commando. Het geconverteerde BAM-bestand wordt opgeslagen in de opgegeven output_dir. Het script maakt automatisch de output_dir aan als deze nog niet bestaat.

Vergeet niet om de paden naar de mappen met de gefilterde SAM-bestanden en de output_dir aan te passen naar de werkelijke locaties voordat je de functie uitvoert.

### functie 6: De volledige pipeline

Deze pipeline is ontwikkeld om verschillende functies voor genexpressie data verwerking uit te voeren. Het script voert de functies in de juiste volgorde uit om genexpressiegegevens te verwerken en te transformeren voor verdere analyse.

#### functies in de pipeline:

De volgende functies worden gebruikt in deze pipeline:

1) functie_alignment.R: Deze functie voert een aligner uit op de genexpressiegegevens.

2) functie_flags_filtering.R: Deze functie filtert de gealigneerde gegevens op basis van specifieke vlaggen.

3) functie_check_filter.R: Deze functie controleert de gefilterde gegevens om de kwaliteit ervan te verifiëren.

4) functie_add_header.R: Deze functie voegt een header toe aan de gefilterde gegevens.

5) functie_sam_to_bam.R: Deze functie converteert de gefilterde gegevens van het SAM-formaat naar het BAM-formaat.

#### Gebruiksinstructies

1) Volg deze stappen om de genexpressie data verwerkingspipeline uit te voeren:

2) Zorg ervoor dat de functiebestanden beschikbaar zijn in de opgegeven paden.

3) Pas indien nodig de parameters aan binnen elke functie in de pipeline om ze af te stemmen op jouw specifieke dataset.

4) Voer het script uit om de pipeline uit te voeren:

```r
run_pipeline()

```
Opmerking: Zorg ervoor dat je de bestandspaden en parameters aanpast aan jouw specifieke projectvereisten voordat je de pipeline uitvoert.

#### Voorbeeldgebruik

Hier is een voorbeeld van hoe je de genexpressie data verwerkingspipeline kunt gebruiken:


```r
# Importeer de pipeline functie
source("pad/naar/pipeline/script")

# Uitvoeren van de pipeline
run_pipeline()

```

Dit voorbeeld gaat ervan uit dat je de pipeline-bestanden hebt geplaatst in de juiste directory en dat je de functiepaden en parameters hebt aangepast aan jouw specifieke projectvereisten. De functies worden vervolgens uitgevoerd in de juiste volgorde om de genexpressiegegevens te verwerken.

## Data processing

De data moet gecorntrolleert worden op de kwaliteit, daarvoor gebruiken we nanoplot. 

### Nanoplot

NanoPlot is een krachtige softwaretool voor visualisatie en kwaliteitscontrole van nanopore-sequencinggegevens. Het stelt onderzoekers in staat om snel inzicht te krijgen in de karakteristieken van hun sequentiegegevens, waaronder lengtedistributie, kwaliteitsprofielen en GC-inhoud. Met een intuïtieve interface en diverse plotopties biedt NanoPlot waardevolle visualisaties voor de analyse en optimalisatie van nanopore-sequencingexperimenten.

#### instalatie en vereisten:

Voor het gebruik van dit script zijn de volgende vereisten nodig:

- R geïnstalleerd op je systeem.
- NanoPlot-software correct geïnstalleerd en toegankelijk via het systeempad.

#### Gebruiksinstructies:

Volg deze stappen om het script te gebruiken:

1) Clone de repository naar jouw lokale omgeving:

```r
git clone https://github.com/jouw-gebruikersnaam/project.git
``` 

2) Navigeer naar de directory van het script:

```r
cd project
```

3) Pas de scriptvariabelen aan naar jouw specifieke vereisten:

```r
dir_path <- "/pad/naar/jouw/raw_data"
outdir <- "/pad/naar/jouw/uitvoermap"
```

4) Zorg ervoor dat de NanoPlot-software correct is geïnstalleerd en toegankelijk is via het systeempad.

5) Voer het script uit:

```r
Rscript nanoplot_script.R
```

5) Controleer de uitvoer in de console en het gegenereerde NanoPlot-bestand in de opgegeven uitvoermap.

#### VOorbeeldgebruik

Hier is een voorbeeld van hoe je het script kunt gebruiken:

```r
# Stel de directory in waar de ruwe databestanden zich bevinden
dir_path <- "/home/gebruiker/project/raw_data"

# Stel de uitvoermap in voor NanoPlot-gegevens
outdir <- "/home/gebruiker/project/nanoplot_output"

# Voer het script uit
Rscript nanoplot_script.R

```

Dit voorbeeld gaat ervan uit dat je het script hebt gekopieerd naar je home directory, de scriptvariabelen hebt aangepast aan jouw specifieke paden en de NanoPlot-software correct is geïnstalleerd op jouw systeem. De uitvoer wordt weergegeven in de console en het NanoPlot-bestand wordt gegenereerd in de opgegeven uitvoermap.


## Visualisaties

Dit project richt zich ook op het gebruik van visualisaties en een PCA-analyse om inzicht te krijgen in genomische gegevens. Visualisaties stellen onderzoekers in staat om de complexe patronen en relaties in de gegevens te begrijpen, terwijl PCA-analyse helpt bij het identificeren van belangrijke variabiliteit en het ontdekken van verborgen structuren.

### IGV-Browser voor Genomische Visualisaties

De IGV-Browser (Integrative Genomics Viewer) is een veelgebruikte tool voor het visualiseren en verkennen van genoomgebieden en bijbehorende genetische informatie. Met IGV-Browser kunnen we de expressie van genen, varianten, epigenetische modificaties en andere genomische kenmerken in context bekijken. We kunnen bladeren door het genoom, inzoomen op specifieke regio's, annotaties toevoegen en verschillende lagen van gegevens overlappen om een beter begrip te krijgen van de biologische processen die plaatsvinden.

De IGV browser gebruikt bigwig bestanden, omdat er tot nu toe alleen nog sam en bam bestanden gemaakt zijn, zijn er eerst een paar functies geschreven voor het omzetten van sam bestanden naar bigwig. 

De verkregen .bw bestanden kunnen gebruikt worden in de igv browser. 

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

### PCA-analyse en Heatmap-visualisatie

In genexpressie-onderzoek is het begrijpen van patronen en relaties tussen genen en monsters van cruciaal belang. Twee veelgebruikte technieken om dit te bereiken zijn Principal Component Analysis (PCA) en Heatmap-visualisatie. Beide methoden bieden waardevolle inzichten in de genexpressiepatronen en kunnen helpen bij het identificeren van biologisch relevante clusters of trends.

PCA is een statistische techniek die wordt gebruikt om de variabiliteit in een dataset te begrijpen en te visualiseren. Het doel is om de hoge-dimensionale gegevens te verminderen tot een lager aantal dimensies (principale componenten) zonder al te veel informatie te verliezen. Deze principale componenten zijn lineaire combinaties van de oorspronkelijke variabelen en worden gerangschikt op basis van hun bijdrage aan de totale variabiliteit.

Een heatmap is een visuele representatie van gegevens waarbij kleur wordt gebruikt om de relatieve waarden van een matrix weer te geven. In het geval van genexpressiegegevens, kan een heatmap worden gebruikt om de relatieve expressieniveaus van genen in verschillende monsters weer te geven. Door genexpressiegegevens in een heatmap weer te geven, kunnen patronen en clusters van genen en monsters duidelijk worden gevisualiseerd.

Om de PCA en de heatmap te maken is er een functie geschreven die gebruik maakt van bambu. Bambu is een R-pakket dat speciaal is ontworpen voor het analyseren en visualiseren van genexpressiedata. Het biedt verschillende functies en tools. 

#### Functie voor Heatmap en Principal Component Analysis (PCA):

De functie runBambuAnalysis voert de Bambu-analyse uit en genereert zowel de PCA-plot als de heatmap-plot voor visualisatie.

##### Installatie en vereisten: 

Voordat je de pipeline kunt uitvoeren, moet je ervoor zorgen dat het Bambu-pakket en de GenomicFeatures-bibliotheek zijn geïnstalleerd en geladen. Je kunt ze installeren met behulp van de volgende commando's:

```r
install.packages("bambu")
install.packages("GenomicFeatures")
install.packages("ggplot2")
install.packages("BiocParallel")
install.packages("ComplexHeatmap")

```

Zorg ervoor dat je ook de BAM-bestanden, annotatiebestand en genoombestand hebt voorbereid en de juiste bestandspaden hebt ingesteld in de pipelinecode.

##### Gebruiksinstructies:

1) Plaats de BAM-bestanden in de opgegeven map bam.folder. Zorg ervoor dat de BAM-bestanden correct gealigneerde RNA-seq-gegevens bevatten.

2) Zorg ervoor dat het annotatiebestand in GTF-formaat correct is opgegeven in annotation.file. Dit bestand bevat de genoomannotaties die nodig zijn voor de analyse.

3) Specificeer het genoombestand in FASTA-formaat in genome.file. Dit bestand bevat het genoomreferentiesequentie dat nodig is voor de analyse.

4) Voer de R-code uit om de functie runBambuAnalysis te definiëren.

5) Roep de functie runBambuAnalysis aan en geef de juiste argumenten: bam.folder, annotation.file en genome.file.

6) De functie voert de Bambu-analyse uit, genereert de PCA-plot en de heatmap-plot, en slaat het resulterende GTF-bestand op in de map "~/project_genexpressie/bambu/".

7) Bekijk de gegenereerde visualisaties en analyseer de resultaten.


##### Voorbeeldgebruik:

Hier is een voorbeeld van hoe je de functie kunt gebruiken:

```r 
bam.folder <- "/pad/naar/BAM-bestanden"
annotation.file <- "/pad/naar/annotatiebestand.gtf.gz"
genome.file <- "/pad/naar/genoombestand.fna.gz"
output.folder <- "/pad/naar/uitvoermap"

# Run the Bambu pipeline
runBambuAnalysis(bam.folder, annotation.file, genome.file)

``` 
Pas de bestands- en mapnamen aan volgens de specifieke locatie en bestandsnamen op uw systeem. Voer de bovenstaande code uit om de Bambu-analyse uit te voeren en de PCA-plot en de heatmap-plot te genereren.

### Deseq visualisatie

Deze functie is ontworpen om een DESeq-analyse uit te voeren en de resultaten visueel weer te geven met behulp van de DESeq2-pakket in R. Het biedt een eenvoudige manier om differentieel tot expressie gebrachte genen te identificeren en de log2 vouwveranderingen in een MA-plot te visualiseren.

#### Installatie en vereisten:

Om deze functie te gebruiken, moeten de volgende R-pakketten zijn geïnstalleerd:

- DESeq2
- apeglm

Deze pakketten kunnen worden geïnstalleerd met behulp van de volgende code:

```r
install.packages("DESeq2")
install.packages("apeglm")
```

#### Gebruiksinstructies:

1) Zorg ervoor dat de benodigde gegevens aanwezig zijn en correct zijn geformatteerd. Deze functie vereist twee gegevensobjecten: seGene.multiSample en se.multiSample. Deze objecten moeten de vereiste gegevens bevatten voor de DESeq-analyse, zoals genexpressiewaarden en bijbehorende metadata.

2) Laad de functie runDESeqAnalysis in je R-omgeving door de functiecode in je script of R-console te kopiëren.

3) Roep de functie aan met de juiste argumenten: seGene.multiSample en se.multiSample. Zorg ervoor dat deze objecten correct zijn toegewezen voordat je de functie aanroept.

```r
runDESeqAnalysis(seGene.multiSample, se.multiSample)

```

4) De functie voert de DESeq-analyse uit en geeft een overzicht van de resultaten. Het zal ook een MA-plot genereren om de log2 vouwveranderingen weer te geven.

#### Voorbeeldgebruik:

Hier is een voorbeeld van hoe je de functie kunt gebruiken met fictieve gegevens:

```r

# Definieer seGene.multiSample en se.multiSample met je eigen gegevens
seGene.multiSample <- ...
se.multiSample <- ...

# Functie aanroep
runDESeqAnalysis(seGene.multiSample, se.multiSample)

```

Zorg ervoor dat je de juiste gegevens toewijst aan de seGene.multiSample en se.multiSample variabelen voordat je de functie aanroept. Deze variabelen moeten de vereiste gegevens bevatten die nodig zijn voor de DESeq-analyse.
