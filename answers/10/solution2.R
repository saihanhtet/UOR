# install.packages(c("ggplot2", "readr"))
library(ggplot2)
library(readr)

vacc <- read_csv('/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/dataset/Vaccination-data.csv')

types_dist <- as.data.frame(table(vacc$NUMBER_VACCINES_TYPES_USED, useNA = "no"))
types_dist$Percent <- types_dist$Freq / sum(types_dist$Freq) * 100

ggplot(types_dist, aes(x = "", y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(Freq, " (", sprintf("%.1f%%", Percent), ")")), position = position_stack(vjust = 0.5)) +
  labs(title = "Distribution of Number of Vaccine Types Used by Countries (Pie Chart)", fill = "Number of Types") +
  theme_void() +
  scale_fill_brewer(palette = "Set3")

ggsave("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/answers/09/alt_plot10.png")
