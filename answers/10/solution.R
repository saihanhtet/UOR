# Question 10: What is the distribution of the number of vaccine types used by countries?

# Install and load required packages
# install.packages(c("ggplot2", "readr", "RColorBrewer"))
library(ggplot2)
library(readr)
library(RColorBrewer)

# Load vaccination dataset
vacc <- read_csv("/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/dataset/Vaccination-data.csv")

# Count the number of countries by vaccine types used
types_dist <- as.data.frame(table(vacc$NUMBER_VACCINES_TYPES_USED, useNA = "no"))

# Create bar chart with multiple colors
ggplot(types_dist, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Freq), vjust = -0.5, size = 3.5) +
  labs(
    title = "Distribution of Number of Vaccine Types Used by Countries",
    x = "Number of Vaccine Types",
    y = "Number of Countries"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") # multi-color palette

# Save the plot
ggsave(
  "/Users/m2air/Documents/UOR/DataAnalysis/Assignment_1/answers/10/Distribution of Number of Vaccine Types Used by Countries.png",
  width = 10,
  height = 6
)
