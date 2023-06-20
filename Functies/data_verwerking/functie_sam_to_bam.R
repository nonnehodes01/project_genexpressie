# Dit is een functie om de gefilterde SAM files om te zetten naar het BAM formaat. 
# Je hebt om deze functie te gebruiken een directorry nodig met gefilterde SAM bestanden (zoals de output_dir uit de flags_filter functie).
# Deze functie is gebouwd om gerund te worden in de terminal, je zal het script dus moeten uitvoeren in terminal. 

convert_sam_files_to_bam <- function(input_dir_sam_bam, output_dir_sam_bam) {
  if (!dir.exists(output_dir_sam_bam)) {
    dir.create(output_dir_sam_bam)
  }
  
  input_files <- list.files(input_dir_sam_bam, pattern = "*.sam$", full.names = TRUE)
  
  for (input_file in input_files) {
    output_file <- file.path(output_dir_sam_bam, gsub("\\.sam$", ".bam", basename(input_file)))
    
    samtools_cmd <- paste0("samtools view -bS ", input_file, " -o ", output_file)
    system(samtools_cmd)
    
    cat("SAM-bestand succesvol geconverteerd naar BAM-bestand:", output_file, "\n")
  }
  
  cat("Alle SAM-bestanden zijn succesvol geconverteerd naar BAM-bestanden in de directory:", output_dir_sam_bam, "\n")
}



# voorbeeldgebruik van de functie
input_dir_sam_bam <- "~/project_genexpressie/headered_sam_files"
output_dir_sam_bam <- "~/project_genexpressie/bam_files"
convert_sam_files_to_bam(input_dir_sam_bam, output_dir_sam_bam)

# Hoe te runnen in een conda-environment:
# 1) zorg dat je een conda-environment hebt waarin minimap2 en samtools geinstalleerd is
# 2) vul de data in --> zie "voorbeeld gebruik van de functie", vul deze in met de data van toepassing
# 3) activeer je conda-environment
# 4) ga in de terminal naar de locatie van dit script
# 5) run in de terminal de volgende command: Rscript functie_sam_to_bam.R

