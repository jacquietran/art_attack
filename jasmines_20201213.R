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

# jasmines_acton_20201213.png
use_seed(1) %>%
  entity_circle(grain = 1000, size = 2) %>%
  unfold_warp(iterations = 100) %>%
  style_ribbon(palette = "acton") %>%
  ggsave(filename = "jasmines_acton_20201213.png",
         device = "png",
         width = 12,
         height = 12,
         units = "in",
         dpi = 600)

# jasmines_delaunay_20201213.png
use_seed(17) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 100) %>%
  unfold_tempest(iterations = 100) %>%
  style_ribbon(palette = "acton") %>%
  ggsave(filename = "jasmines_delaunay_20201213.png",
         device = "png",
         width = 12,
         height = 12,
         units = "in",
         dpi = 600)

use_seed(1) %>%
  scene_discs(
    rings = 3, points = 5000, size = 5
  ) %>%
  mutate(ind = 1:n()) %>%
  unfold_warp(
    iterations = 1,
    scale = .5, 
    output = "layer" 
  ) %>%
  unfold_tempest(
    iterations = 20,
    scale = .01
  ) %>%
  style_ribbon(
    palette = palette_named("vik"),
    colour = "ind",
    alpha = c(.1,.1),
    background = "oldlace"
  )