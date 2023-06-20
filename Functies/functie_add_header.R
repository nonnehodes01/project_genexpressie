process_samtools_command <- function(aligned_directory_add_header, filtered_directory_add_header, output_directory_add_header) {
  if (!dir.exists(output_directory_add_header)) {
    dir.create(output_directory_add_header, recursive = TRUE)
  }
  
  aligned_files <- list.files(aligned_directory_add_header, pattern = "\\.sam$", full.names = TRUE)
  filtered_files <- list.files(filtered_directory_add_header, pattern = "\\.sam$", full.names = TRUE)
  
  for (i in seq_along(filtered_files)) {
    aligned_file <- aligned_files[i]
    filtered_file <- filtered_files[i]
    
    output_file <- file.path(output_directory_add_header, paste0("headered_", basename(filtered_file)))
    header_file <- file.path(output_directory_add_header, paste0("header_", gsub("\\.sam$", ".txt", basename(filtered_file))))
    
    # Commando om de header van het gealigneerde bestand naar een apart bestand te kopiëren
    header_command <- paste("samtools view -H", aligned_file, ">", header_file)
    system(header_command)
    
    # Commando om de header en de gefilterde regels te combineren in het uitvoerbestand
    combine_command <- paste("cat", header_file, filtered_file, ">", output_file)
    system(combine_command)
    
    cat("Gecombineerd bestand is opgeslagen in:", output_file, "\n")
  }
}

# Voorbeeldgebruik:
aligned_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"  # Vervang dit door de naam van de map waarin de gealigneerde SAM-bestanden zich bevinden
filtered_directory_add_header <- "~/project_genexpressie/filtered_SAM_files"  # Vervang dit door de naam van de map waarin de gefilterde SAM-bestanden zich bevinden
output_directory_add_header <- "headered_sam_files"  # Vervang dit door de naam van de map waarin de gecombineerde bestanden moeten worden opgeslagen

process_samtools_command(aligned_directory_add_header, filtered_directory_add_header, output_directory_add_header)
