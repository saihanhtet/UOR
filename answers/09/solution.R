# Question 9: What is the average persons vaccinated with at least one dose per 100 by WHO region?
# install.packages(c("ggplot2", "readr"))
library(ggplot2)
library(readr)

# Load vaccination dataset
vacc <- read_csv('/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/dataset/Vaccination-data.csv')

# Compute average vaccinations per WHO region
avg_vacc <- aggregate(PERSONS_VACCINATED_1PLUS_DOSE_PER100 ~ WHO_REGION, data = vacc, FUN = mean, na.rm = TRUE)

# Sort in descending order
avg_vacc <- avg_vacc[order(-avg_vacc$PERSONS_VACCINATED_1PLUS_DOSE_PER100), ]

# Create the bar chart
ggplot(avg_vacc, aes(x = reorder(WHO_REGION, -PERSONS_VACCINATED_1PLUS_DOSE_PER100),
                     y = PERSONS_VACCINATED_1PLUS_DOSE_PER100,
                     fill = WHO_REGION)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = sprintf("%.1f", PERSONS_VACCINATED_1PLUS_DOSE_PER100)),
            vjust = -0.5, size = 3.5) +
  labs(title = "Average Persons Vaccinated with At Least One Dose per 100 by WHO Region",
       x = "WHO Region",
       y = "Average Vaccinated per 100") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set2")  # Removed grid()

# Save the plot
ggsave("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/answers/09/Average_Persons_Vaccinated_per_100_WHO_Region.png",
       width = 10, height = 6)



