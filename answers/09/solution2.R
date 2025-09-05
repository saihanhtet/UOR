# Question 9: What is the average persons vaccinated with at least one dose per 100 by WHO region?
# Load required libraries
library(ggplot2)
library(readr)
library(reshape2)

# Read vaccination dataset
vacc <- read_csv("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/dataset/Vaccination-data.csv")

# Compute average vaccinated (1+ dose per 100) grouped by WHO region
avg_vacc <- aggregate(PERSONS_VACCINATED_1PLUS_DOSE_PER100 ~ WHO_REGION,
  data = vacc, FUN = mean, na.rm = TRUE
)

# Reshape data into long format for ggplot
avg_vacc_melt <- melt(avg_vacc, id.vars = "WHO_REGION")

# Create heatmap with values labeled
ggplot(avg_vacc_melt, aes(x = variable, y = WHO_REGION, fill = value)) +
  geom_tile(color = "white") + # colored tiles
  geom_text(aes(label = sprintf("%.1f", value)), color = "white", size = 4) + # show values
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(
    title = "Average Persons Vaccinated with At Least One Dose per 100 by WHO Region (Heatmap)",
    x = "", y = "WHO Region"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_blank()) # hide x labels (only 1 variable)

# Save the plot
ggsave("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/answers/09/Average_Persons_Vaccinated_per_100_WHO_Region_v2.png")
