library(tidyverse)
murders <- read_csv("data/murders.csv")
murders <-murders %>% mutate(region = factor(region),
                             rate = total / population * 10^5)
save(murders, file = "rdas/murders.rda")
head(murders)
summary(murders)
murders <- murders %>%
  mutate(rate = total / population * 100000)
murders %>%
  arrange(desc(rate)) %>%
  head(10)
library(ggplot2)

ggplot(murders, aes(x = population, y = total, color = region)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  labs(title = "Murders vs Population by State")
