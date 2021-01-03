library(dplyr)
library(ggplot2)
library(jasmines)

# jasmines_delaunay_20210102.png
use_seed(17) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 10) %>%
  style_ribbon(palette = "acton") %>%
  ggsave(filename = "jasmines_delaunay_20210102.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021411.png
use_seed(17) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 15) %>%
  style_ribbon(palette = "acton") %>%
  ggsave(filename = "jasmines_delaunay_202101021411.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021418.png
use_seed(17) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 15) %>%
  unfold_tempest(iterations = 2) %>%
  style_ribbon(palette = "acton") %>%
  ggsave(filename = "jasmines_delaunay_202101021418.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021429.png
use_seed(2021) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 15) %>%
  style_ribbon(palette = "batlow") %>%
  ggsave(filename = "jasmines_delaunay_202101021429.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021441.png
use_seed(6680) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 20) %>%
  style_ribbon(palette = "lapaz") %>%
  ggsave(filename = "jasmines_delaunay_202101021441.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021510.png
use_seed(866) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 20) %>%
  unfold_tempest(iterations = 5, scale = .01) %>%
  style_ribbon(palette = "lapaz") %>%
  ggsave(filename = "jasmines_delaunay_202101021510.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_gridmix_202101021539.png
use_seed(43) %>%
  scene_mix(entity = "circle") %>%
  unfold_warp(iterations = 100) %>%
  style_ribbon(palette = "lapaz") %>%
  ggsave(filename = "jasmines_gridmix_202101021539.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021546.png
use_seed(25) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 15) %>%
  style_ribbon(palette = "lapaz") %>%
  ggsave(filename = "jasmines_delaunay_202101021546.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_delaunay_202101021556.png
use_seed(83) %>%
  scene_delaunay() %>%
  unfold_warp(iterations = 50) %>%
  style_ribbon(palette = "lajolla") %>%
  ggsave(filename = "jasmines_delaunay_202101021556.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_discs_202101021628.png
use_seed(83) %>%
  scene_discs(points = 300, rings = 3, size = 5) %>%
  unfold_meander() %>%
  style_ribbon(palette = "buda") %>%
  ggsave(filename = "jasmines_discs_202101021628.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

# jasmines_discs_202101021649.png
use_seed(83) %>%
  scene_sticks() %>%
  unfold_meander() %>%
  style_ribbon(palette = "buda") %>%
  ggsave(filename = "jasmines_discs_202101021649.png",
         device = "png",
         width = 6,
         height = 6,
         units = "in",
         dpi = 150)

####################

# memory.limit(size=56000)

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