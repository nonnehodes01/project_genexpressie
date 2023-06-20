
dir_path <- "/home/data/projecticum/PFAS/raw_data"

# Get the list of .fastq.gz files in the directory
fastq_files <- list.files(dir_path, pattern = "\\.fastq\\.gz$", full.names = TRUE, recursive = FALSE)

outdir <- "~/Nanoplot_data"

# Process each .fastq.gz file with NanoPlot
for (file in fastq_files) {
  # Extract the file name without the extension
  file_name <- tools::file_path_sans_ext(basename(file))
  
  # Create the output file name by adding the file name as a prefix
  output_file <- file.path(outdir, paste0(file_name, "_"))
  
  # Construct the NanoPlot command
  nanoplot_command <- paste0("NanoPlot -t 8 --fastq ", file, " --maxlength 40000 --plots kde --outdir ", outdir, " --prefix ", output_file)
  
  cat("Running NanoPlot for:", file, "\n")
  
  # Execute the NanoPlot command
  system(nanoplot_command)
}

