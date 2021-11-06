# Load libraries ---------------------------------------------------------------

library(here)
library(tidyr)
library(dplyr)
library(ggplot2)
library(png)
library(magick)
library(paletteer)

# Make noise
# library(ambient)

# Add colour
# library(EBImage)

# Plot on top of colour field
# library(Rcpp)
# library(purrr)
# library(grid)

# Make polygons: colour_study_20210911_1925 ------------------------------------

polygon_layer_1 <- tibble(
  x = c(8.35, 10, 10, 8.35),
  y = c(0, 0, 8, 8))

polygon_layer_2 <- tibble(
  x = c(0, 10, 8, 10),
  y = c(0, 0, 8, 8))
  
polygon_layer_3 <- tibble(
  x = c(0, 2, 8.35, 8.35, 0),
  y = c(0, 0, 6.65, 8, 8))

ggplot() +
  geom_polygon(
    data = polygon_layer_1,
    aes(x = x, y = y),
    fill = paletteer_d("awtools::a_palette")[4], alpha = 0.2) +
  geom_polygon(
    data = polygon_layer_3,
    aes(x = x, y = y),
    fill = paletteer_d("awtools::mpalette")[2]) +
  geom_polygon(
    data = polygon_layer_2,
    aes(x = x, y = y),
    fill = paletteer_d("ggsci::pink_material")[3]) +
  geom_polygon(
    data = polygon_layer_3,
    aes(x = x, y = y),
    fill = paletteer_d("awtools::mpalette")[2], alpha = 0.5) +
  theme_void() +
  theme(
    legend.position = "none")

# Export plot to PNG
ggsave(here("colour_fields/everything/colour_study_20210911_1925.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make polygons: colour_study_20210911_1930 ------------------------------------

polygon_layer_1 <- tibble(
  x = c(0, 8, 8, 0),
  y = c(0, 0, 8, 8))

polygon_layer_2 <- tibble(
  x = c(0, 2, 3, 0),
  y = c(4, 0, 8, 8))

polygon_layer_3 <- tibble(
  x = c(2, 2.2, 3.4, 3),
  y = c(0, 0, 8, 8))

polygon_layer_4 <- tibble(
  x = c(3, 1, 8, 7, 8),
  y = c(4, 1, 2, 4, 7))

ggplot() +
  geom_polygon(
    data = polygon_layer_1,
    aes(x = x, y = y),
    fill = paletteer_d("ggsci::blue_grey_material")[1]) +
  geom_polygon(
    data = polygon_layer_2,
    aes(x = x, y = y),
    fill = paletteer_d("grDevices::blues9")[8]) +
  geom_polygon(
    data = polygon_layer_3,
    aes(x = x, y = y),
    fill = paletteer_d("LaCroixColoR::PassionFruit")[1], alpha = 0.8) +
  geom_polygon(
    data = polygon_layer_4,
    aes(x = x, y = y),
    fill = paletteer_d("grDevices::blues9")[6]) +
  theme_void() +
  theme(
    legend.position = "none")

# Export plot to PNG
ggsave(here("colour_fields/everything/colour_study_20210911_1930.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)