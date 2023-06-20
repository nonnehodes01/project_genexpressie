filter_flags_directory <- function(input_directory_filtering, output_directory_filtering, flags_filtering) {
  input_files <- list.files(input_directory_filtering, pattern = "\\.sam$", full.names = TRUE)
  if (!dir.exists(output_directory_filtering)) {
    dir.create(output_directory_filtering, recursive = TRUE)
  }
  for (input_file in input_files) {
    output_file <- file.path(output_directory_filtering, paste0("gefilterd_", basename(input_file)))
    con_in <- file(input_file, "r")
    con_out <- file(output_file, "w")
    while (length(line <- readLines(con_in, n = 1, warn = FALSE)) > 0) {
      if (!startsWith(line, "@")) {
        columns <- strsplit(line, "\t")[[1]]
        flag <- as.integer(columns[2])
        if (flag %in% flags_filtering) {
          writeLines(line, con_out)
        }
      }
    }
    close(con_in)
    close(con_out)
    cat("Bestand", input_file, "is gefilterd en opgeslagen als", output_file, "\n")
  }
}

# Voorbeeldgebruik:
input_directory_filtering <- "~/project_genexpressie/aligned_SAM_files"  # Vervang dit door de naam van de map waarin de input SAM-bestanden zich bevinden
output_directory_filtering <- "~/project_genexpressie/filtered_SAM_files"  # Vervang dit door de naam van de map waarin de gefilterde bestanden moeten worden opgeslagen
flags__filtering <- c(0, 16)  # Vervang dit door de gewenste flags om op te filteren
filter_flags_directory(input_directory_filtering, output_directory_filtering, flags_filtering)


