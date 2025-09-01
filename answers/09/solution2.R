# install.packages(c("ggplot2", "readr", "reshape2"))
library(ggplot2)
library(readr)
library(reshape2)

vacc <- read_csv('/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/dataset/Vaccination-data.csv')

avg_vacc <- aggregate(PERSONS_VACCINATED_1PLUS_DOSE_PER100 ~ WHO_REGION, data = vacc, FUN = mean, na.rm = TRUE)
avg_vacc_melt <- melt(avg_vacc, id.vars = "WHO_REGION")

ggplot(avg_vacc_melt, aes(x = variable, y = WHO_REGION, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.1f", value)), color = "white", size = 4) +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(title = "Average Persons Vaccinated with At Least One Dose per 100 by WHO Region (Heatmap)", x = "", y = "WHO Region") +
  theme_minimal() +
  theme(axis.text.x = element_blank())

ggsave("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/answers/09/alt_plot9.png")
