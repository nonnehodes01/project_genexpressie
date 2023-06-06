# Project Genexpressie: RNA-sequencing met de MinION sequencer

In dit project wordt de RNA-sequencing data die gegenereerd is voor MCF7 cellen op het ILC vergeleken met de gepubliceerde data van Chen et al. (2021). Hiervoor wordt een bash-script geschreven dat de verschillende stappen in de workflow combineert, waarbij de inputbestanden (fastq-bestanden) worden bewerkt volgens (een deel van) de methodologie van de gepubliceerde dataset.

## Doel van het project

Het doel van dit project is om de kwaliteit van de RNA-sequencing data te beoordelen door deze te vergelijken met de gepubliceerde dataset. Hierbij worden verschillende visualisaties gebruikt, zoals PCA- en tSNE-plots, scatter plots voor vergelijkingen tussen samples, visualisaties voor kwaliteitscontroles en visualisatie van de reads in de IGV-browser.

## Installatie en gebruik

1. Toegang tot de server: Neem contact op met de beheerder om toegang te krijgen tot de server waarop de fastq-bestanden worden aangeboden.

2. Download de gepubliceerde dataset: Download het artikel en de supplementaire data van Chen et al. (2021) via de gegeven link.

3. Voer het bash-script uit: Gebruik het geschreven bash-script om de verschillende stappen in de workflow uit te voeren en de RNA-sequencing data te vergelijken met de gepubliceerde data.

## Visualisaties

Tijdens het project moeten verschillende visualisaties worden gemaakt om de data te analyseren en te vergelijken. Enkele voorbeelden van relevante visualisaties zijn:

- PCA- en tSNE-plots voor de verschillende samples om de ILC-data te vergelijken met de andere data.
- Scatter plots voor paarsgewijze vergelijkingen tussen samples, bijvoorbeeld tussen een ILC-dataset en een van de gepubliceerde datasets.
- Visualisaties voor kwaliteitscontroles, zoals een grafiek die aangeeft hoeveel procent van de reads uit de fastq-bestanden gemapped kon worden naar het referentiegenoom.
- Visualisatie van de reads in de IGV-browser. Hiervoor moet een workflow worden geschreven of aangepast, zodat de fastq-bestanden uiteindelijk worden omgezet naar bigwig-bestanden die ingelezen kunnen worden door de IGV-browser.

