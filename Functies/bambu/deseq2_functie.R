runDESeqAnalysis <- function(seGene.multiSample, se.multiSample) {
  library(DESeq2)
  library(apeglm)
  
  dds <- DESeqDataSetFromMatrix(round(assays(seGene.multiSample)$counts),
                                colData = colData(se.multiSample),
                                design = ~ condition)
  
  # Assign conditions based on sample names
  dds$condition <- ifelse(grepl("HepG2", sampleData$name), "HepG2", "MCF7")
  
  # Check the unique values in the condition column
  unique_conditions <- unique(dds$condition)
  print(unique_conditions)
  
  # Convert condition to factor
  dds$condition <- factor(dds$condition)
  
  # Run DESeq
  dds.deseq <- DESeq(dds)
  
  deGeneRes <- DESeq2::results(dds.deseq, independentFiltering = FALSE)
  
  summary(deGeneRes)
  
  resLFC <- lfcShrink(dds.deseq, coef = "condition_MCF7_vs_HepG2", type = "apeglm")
  plotMA(resLFC, ylim = c(-3, 3))
}
