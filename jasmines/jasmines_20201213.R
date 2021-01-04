library(dplyr)
library(ggplot2)
library(jasmines)

memory.limit(size=56000)

# jasmines_tokyo_20201213.png
use_seed(13) %>%
  entity_circle(grain = 300, size = 2) %>%
  unfold_warp(iterations = 100) %>%
  style_ribbon(palette = "tokyo") %>%
  ggsave(filename = "jasmines_tokyo_20201213.png",
         device = "png",
         width = 12,
         height = 12,
         units = "in",
         dpi = 600)