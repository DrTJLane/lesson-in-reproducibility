# Analysis script for my awesome project
library("tidyverse")

# read data
apples <- read_csv("data/apples_data.csv")

# process data
apples <- apples %>% 
  mutate(log_weight = log(weight))


# graphing
ggplot(apples, aes(weight)) + 
  geom_histogram(fill = "blue") + 
  see::theme_abyss()

ggsave("figs/hist.png", 
       last_plot())

png("figs/hist_apple_weight.png")
hist(apples$weight)
dev.off()
# print image




ggplot(apples, aes(no_apples, log_weight)) + 
  geom_line(colour = "blue") + 
  geom_line(data = apples, 
            mapping = aes(no_apples, weight), 
            colour = "red") + 
  ylim(0, 10)
