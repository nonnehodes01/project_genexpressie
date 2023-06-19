# Dit is een fucntie als aansluiting op de flag filter functie, in deze functie kan je de output_dir die ontstaan is bij het filteren van de flags als imput geven om te controlleren of de filterstap goed verlopen is. 
# Deze functie zal aangeven of de flags correct gefilterd zijn door na te kijken of er nog andere bestanden in de functie zitten dan dat er gevraagd wordt. 
# Deze functie is gebouwd om gerund te worden in de terminal, je zal het script dus moeten uitvoeren in terminal. 

noteer_unieke_waarden_sam_directory_terminal <- function(directory) {
  # Lijst van SAM-bestanden in de opgegeven directory
  sam_bestanden <- list.files(directory, pattern = "\\.sam$", full.names = TRUE)
  
  # Loop over elk SAM-bestand
  for (bestandsnaam in sam_bestanden) {
    cat("Bestand:", bestandsnaam, "\n")
    
    # Genereer het commando voor het ophalen van unieke waarden en frequentie, met overslaan van de header
    commando <- paste("awk 'NR>1{print $2}' FS='\t' ", bestandsnaam, "| sort | uniq -c", sep=" ")
    
    # Voer het commando uit in de terminal en druk de resultaten af
    resultaten <- system(commando, intern = TRUE)
    
    # Print het resultaat 
    cat(resultaten, "\n")
    cat("---\n")
  }
}


directory <- "~/project_genexpressie/test_output"
noteer_unieke_waarden_sam_directory_terminal(directory)




# voorbeeldgebruik van de functie
# output_dir <- "/pad/naar/uitvoer/filtered_sam" !!!ZELFDE output_dir ALS BIJ move_headered_sam_files in functie_final_sam!!!
# keep_flags <- c(flags, die, je, wil, houden) of "none" !!!ZELFDE FLAGS ALS BIJ FLAGS FILTERING!!!
# remove_flags <- c(flags, die, je, wil, verwijderen) of "none" !!!ZELFDE FLAGS ALS BIJ FLAGS FILTERING!!!

# Hoe te runnen in een conda-environment:
# 1) zorg dat je een conda-environment hebt waarin minimap2 en samtools geinstalleerd is
# 2) vul de data in --> zie "voorbeeld gebruik van de functie", vul deze in met de data van toepassing
# 3) activeer je conda-environment
# 4) ga in de terminal naar de locatie van dit script
# 5) run in de terminal de volgende command: Rscript functie_check_filter.R

