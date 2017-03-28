# Family Services Affirmative Action - Visualization of Results
# Made by Tyler Hamashima, 2/17/2017


# Load required packages
library(ggplot2)
library(tidyverse)
library(ggthemes)
library(RColorBrewer)

# Parameters for graph output
w <- 4000
h <- 2400
r <- 300
un <- "px"
fs <- 20

# Change to TRUE if you want to export the graphs
export_graphs <- TRUE

# Create table of job groups and related statistics
AAdata <-
  read_csv(
    "Job Group, NWlower, NWupper, Flower, Fupper, NWactual, Factual
    Executive/Senior Level, 7.3, 15.3, 50.1, 61.9, 0.0, 50.0
    First/Mid Level, 7.2, 16.3, 43.9, 57.8, 15.8, 94.7
    Professionals, 9.1, 18.4, 75.0, 85.8, 28.0, 87.1
    Administrative Support, 12.1, 13.6, 50.3, 52.3, 30.2, 97.7
    Service Workers, 13.3, 15.4, 16.4, 26.2, 70.0, 30.0"
  )
# Order job group for correct order 
AAdata$`Job Group` = factor(AAdata$`Job Group`, levels=unique(AAdata$`Job Group`))

# Graph non-white 95% confidence range against actual non-white point
if (export_graphs == TRUE) {
  png(
    '/path/to/save/file/AAnonwhite.png',
    width = w,
    height = h,
    units = un,
    res = r
  )
}
ggplot(data = AAdata, aes(x = `Job Group`, y = NWactual)) +
  geom_errorbar(width = 0.2, size = 1.5, aes(ymin = NWlower, ymax = NWupper), col = "red") +
  geom_point(size = 9, fill = "black", shape = "x") +
  labs(title = "Non-white Incumbency and Availability",
       x = "Job Group", 
       y = "Proportion of Non-Whites (%)",
       subtitle = "Red bars denote 95% confidence interval for available workers in the area. \nBlack X's are Family Services' statistics.") +
  theme_bw(base_size=fs)
if (export_graphs == TRUE) {
  dev.off()
}

# Graph female 95% confidence range against actual female point
if (export_graphs == TRUE) {
  png(
    '/path/to/save/file/AAfemale.png',
    width = w,
    height = h,
    units = un,
    res = r)
}
ggplot(data = AAdata, aes(x = `Job Group`, y = Factual)) +
  geom_errorbar(width = 0.2, size = 1.5, aes(ymin = Flower, ymax = Fupper), col = "red") +
  geom_point(size = 9, fill = "black", shape = "x") +
  labs(title = "Female Incumbency and Availability",
       x = "Job Group", 
       y = "Proportion of Females (%)",
       subtitle = "Red bars denote 95% confidence interval for available workers in the area. \nBlack X's are Family Services' statistics.") +
  theme_bw(base_size = fs)
if (export_graphs == TRUE) {
  dev.off()
}


# General sum stats of workers at Family Services
emp <- read.table('/path/to/file/EEO.csv',
                  header = TRUE,
                  sep = ",")

emp$EEOC = factor(emp$EEOC, levels=unique(emp$EEOC))


# Plot of ethnic composition of job groups by gender
if (export_graphs == TRUE) {
  png(
    '/path/to/save/file/AA_comp_eth_gen.png',
    width = w,
    height = h,
    units = un,
    res = r)
}
ggplot(data = emp, aes(x = factor(Group), fill = EEO)) +
  geom_bar(position = "fill") +
  scale_fill_pander() +
  labs(title = "Ethnic composition of EEO-1 job groups, by gender.",
       x = "Job Group", 
       y = "Proportion",
       fill = "Ethnicity") +
  facet_grid(Gender ~.) +
  theme_classic(base_size = fs) +
  coord_flip()
if (export_graphs == TRUE) {
  dev.off()
}

if (export_graphs == TRUE) {
  png(
    '/path/to/save/file/AA_comp_eth.png',
    width = w,
    height = h,
    units = un,
    res = r)
}
ggplot(data = emp, aes(x = factor(Group), fill = EEO)) +
  geom_bar(position = "fill") +
  scale_fill_pander() +
  labs(title = "Ethnic composition of EEO-1 job groups.",
       x = "Job Group", 
       y = "Proportion",
       fill = "Ethnicity") +
  theme_classic(base_size = fs) +
  coord_flip()
if (export_graphs == TRUE) {
  dev.off()
}

# Plot of composition of gender by job group
if (export_graphs == TRUE) {
  png(
    '/path/to/save/file/AA_comp_gen.png',
    width = w,
    height = h,
    units = un,
    res = r)
}
ggplot(data = emp, aes(x = factor(Group), fill = Gender)) +
  geom_bar(position = "fill") +
  scale_fill_wsj() +
  labs(title = "Sex composition of job groups",
       x = "Job Group", 
       y = "Proportion",
       fill = "Ethnicity") +
  theme_classic(base_size = fs) +
  coord_flip()
if (export_graphs == TRUE) {
  dev.off()
}
