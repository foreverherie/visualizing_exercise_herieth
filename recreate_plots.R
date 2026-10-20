getwd()
install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

file2 <- read.csv("File2_Pf_6_samples.txt", sep = "\t")
file3 <- read.csv("File3_Pf_6_fws.txt", sep = "\t")

#dictionary<- read.csv("File8_Pf_6_README_20191010.txt", sep = "")
head(file2)
head(file3)
## S3 method for class 'data.frame'
joined_data <- merge(file3, file2, by = "Sample", all.x = TRUE, no.dups = TRUE) |> filter(QC.pass=="True")

joined_data$Population <- factor(joined_data$Population,
                       levels = c("SAM","WAF","CAF","EAF", "SAS","WSEA" ,"ESEA", "OCE" ),ordered = TRUE)

# Define a named color mapping for each factor level
color_map <- c(
  "SAM" = "lightgreen",  # Red
  "WAF" = "red",  # Blue
  "CAF" = "orange" ,
  "EAF" = "yellow",  # Red
  "SAS" = "purple",  # Blue
  "WSEA" = "lightblue" ,
  "ESEA" = "royalblue",  # Red
  "OCE" = "pink" # Blue
)
ggplot()+
  geom_boxplot(data=joined_data, mapping = aes(x = Population, y=Fws, fill = Population),outlier.shape = NA)+
  scale_fill_manual(values=color_map)
  
