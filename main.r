library(readr)
library(dplyr)
library(ggplot2)

# Function to load dataset
by_tag_year <- read_csv("by_tag_year.csv")

#Add the fraction collumn in the dataframe
by_tag_year_fraction <- by_tag_year %>%
  mutate(fraction = number / year_total)


# Filter for R tags
r_over_time <- by_tag_year_fraction %>%
  filter(tag == "r")

# Print the new table
print(r_over_time)

# Creating a line plot of R over time
ggplot(r_over_time, aes(x = year, y = fraction)) + geom_line()

# creating a line plot of R, and some of its libraries
selected_tags <- c("r", "dplyr", "ggplot2")

# Filter for those tags
selected_tags_over_time <- by_tag_year_fraction %>%
  filter(tag %in% selected_tags)

# Plot tags over time on a line plot using color to represent tag
ggplot(selected_tags_over_time, aes(x = year, y = fraction, 
color= tag)) + geom_line()

# Find total number of questions for each tag
sorted_tags <- by_tag_year %>%
  group_by(tag) %>%
  summarize(tag_total = sum(number)) %>%
  arrange(desc(tag_total))
# .... YOUR CODE FOR TASK 6 ....

# Print the new table
# .... YOUR CODE FOR TASK 6
print(sorted_tags)

# Get the six largest tags
highest_tags <- head(sorted_tags$tag)

# Filter for the six largest tags
by_tag_subset <- by_tag_year_fraction %>%
    filter(tag %in% highest_tags)

#plotting into a fcuntion
ggplot(by_tag_subset, aes(x = year, y = fraction, color = tag)) + geom_line()


