# Dit is een fucntie als aansluiting op de flag filter functie, in deze functie kan je de output_dir die ontstaan is bij het filteren van de flags als imput geven om te controlleren of de filterstap goed verlopen is. 
# Deze functie zal aangeven of de flags correct gefilterd zijn door na te kijken of er nog andere bestanden in de functie zitten dan dat er gevraagd wordt. 
# Deze functie is gebouwd om gerund te worden in de terminal, je zal het script dus moeten uitvoeren in terminal. 

noteer_unieke_waarden_sam_directory_terminal <- function(directory_check) {
  # Lijst van SAM-bestanden in de opgegeven directory
  sam_bestanden <- list.files(directory_check, pattern = "\\.sam$", full.names = TRUE)
  
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


directory_check <- "~/project_genexpressie/filtered_SAM_files"
noteer_unieke_waarden_sam_directory_terminal(directory_check)


