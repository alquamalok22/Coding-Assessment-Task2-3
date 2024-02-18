# Install and load required packages
install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)

# Load the necessary data
file_path <- "Homo_sapiens.gene_info.gz"
gene_info <- read.table(file_path, header = TRUE, sep = "\t", stringsAsFactors = FALSE,fill=TRUE)

# Data wrangling with dplyr
gene_info_subset <- gene_info %>% select(3, 7) %>%
                    filter(!grepl("\\|", .[[2]])) %>%
                   group_by(.[[2]]) %>%
                  summarize(gene_count = n())
View(gene_info_subset)


plot <- ggplot(gene_info_subset, aes(x = Chromosome, y = gene_count)) +
       geom_bar(stat = "identity") +
       labs(title = "Number of Genes per Chromosome in Human Genomes", +
            x = "Chromosome", +
            y = "Number of Genes") +
       theme_minimal() +
       theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(plot)
# Save the plot to a PDF file
ggsave("genes_per_chromosome_plot.pdf", plot = plot, width = 10, height = 6)