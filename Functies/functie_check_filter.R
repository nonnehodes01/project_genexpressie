check_flags_in_sam_files <- function(remove_flags, keep_flags, output_dir) {
  #functie om de unieke flags in een SAM-bestand op te halen
  get_unique_flags <- function(file) {
    flags <- system(paste0("cut -f 2 ", file), intern = TRUE)
    unique_flags <- unique(flags)
    return(unique_flags)
  }
  
  #functie om te controleren of de verwijderde flags correct zijn
  check_remove_flags <- function(file, remove_flags) {
    unique_flags <- get_unique_flags(file)
    
    if (!is.null(remove_flags) && !is.character(remove_flags) && remove_flags != "none") {
      remove_flags <- as.character(remove_flags)
    }
    
    if (remove_flags != "none") {
      flags_to_remove <- strsplit(remove_flags, ",")[[1]]
      mismatched_flags <- setdiff(unique_flags, flags_to_remove)
      
      if (length(mismatched_flags) > 0) {
        cat("Onverwachte verwijderde flags in bestand:", file, "\n")
        cat(mismatched_flags, "\n")
      } else {
        cat("Verwijderde flags zijn correct in bestand:", file, "\n")
      }
    } else {
      cat("Verwijderde flags zijn correct in bestand:", file, "\n")
    }
  }
  
  #functie om te controleren of de behouden flags correct zijn
  check_keep_flags <- function(file, keep_flags) {
    unique_flags <- get_unique_flags(file)
    
    if (!is.null(keep_flags) && !is.character(keep_flags) && keep_flags != "none") {
      keep_flags <- as.character(keep_flags)
    }
    
    if (length(keep_flags) > 0 && keep_flags != "none") {
      flags_to_keep <- strsplit(keep_flags, ",")[[1]]
      missing_flags <- setdiff(flags_to_keep, unique_flags)
      
      if (length(missing_flags) > 0) {
        cat("Ontbrekende behouden flags in bestand:", file, "\n")
        cat(missing_flags, "\n")
      } else {
        cat("Behouden flags zijn correct in bestand:", file, "\n")
      }
    } else {
      cat("Behouden flags zijn correct in bestand:", file, "\n")
    }
  }
  
  #loop over elk SAM-bestand in de opgegeven output_dir
  sam_files <- list.files(output_dir, pattern = "\\.sam$", full.names = TRUE)
  
  for (file in sam_files) {
    cat("Bestand:", file, "\n")
    
    suppressWarnings(check_remove_flags(file, remove_flags))
    suppressWarnings(check_keep_flags(file, keep_flags))
    
    cat("---\n")
  }
}

# voorbeeldgebruik van de functie
# output_dir <- "/pad/naar/uitvoer/filtered_sam" !!!ZELFDE FLAGS ALS BIJ FLAGS FILTERING!!!
# keep_flags <- c(flags, die, je, wil, houden) of "none" !!!ZELFDE FLAGS ALS BIJ FLAGS FILTERING!!!
# remove_flags <- c(flags, die, je, wil, verwijderen) of "none" !!!ZELFDE FLAGS ALS BIJ FLAGS FILTERING!!!

check_flags_in_sam_files(remove_flags, keep_flags, output_dir)
