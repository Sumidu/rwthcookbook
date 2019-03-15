library(tidyverse)
library(rwththeme)
df <- read_rds("data.rds")

rwththeme()
mytheme <- theme_bw()

mytheme <- function(...){
  theme_bw(base_size=12, base_family="Helvetica Neue", ...) + theme(
      panel.background  = element_blank(),
      plot.background = element_blank()
      #panel.border = element_rect(size=0.75)
    )
}


df %>%
  select(age) %>%
  ggplot() +
  aes(age) +
  geom_histogram(bins = 30, fill = rwth.colorpalette()$blue) +
  labs(
    title = "The sample is of a very young age",
    subtitle = "Histogram of the age variable",
    x = "Age",
    y = "Frequency (absolute)",
    caption = "Histogram using 30 bins"
  ) + 
  mytheme() +
  NULL

ggplot2::theme_set(mytheme())

