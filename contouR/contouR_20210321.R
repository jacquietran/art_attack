# Load libraries ---------------------------------------------------------------

library(contouR)
library(ggplot2)
library(paletteer)

# contouR_202103211020 ---------------------------------------------------------

# Create data
setup = contour_grid(
  grid_size = 20,
  point_dist = .15,
  z_method = "runif",
  z = 130,
  z_span = 15) %>%
  contour_shape(
    radius = 17,
    x_center = 7,
    y_center = 17)

# Build plot
contour_plot(
  setup$grid_shape,
  background_col = paletteer_d("ggpomological::pomological_base")[6],
  line_col = paletteer_d("ggpomological::pomological_palette")[3]) +
  xlim(1, 30) +
  ylim(1, 30)

# Export to PNG
ggsave("contouR/everything/contouR_202103211020.png",
       device = "png", width = 6, height = 6, units = "in", dpi = 600)

# contouR_202103211036 ---------------------------------------------------------

# Create data
setup = contour_grid(
  grid_size = 100,
  point_dist = 0.4,
  z_method = "rnorm",
  z = 10,
  z_span = 10) %>%
  contour_shape(
    radius = 12,
    x_center = 15,
    y_center = 15)

# Build plot
contour_plot(
  setup$grid_shape,
  background_col = paletteer_d("ggpomological::pomological_base")[3],
  line_col = paletteer_d("ggpomological::pomological_base")[6]) +
  xlim(1, 30) +
  ylim(1, 30)

# Export to PNG
ggsave("contouR/everything/contouR_202103211036.png",
       device = "png", width = 6, height = 6, units = "in", dpi = 600)

# contouR_202103211050 ---------------------------------------------------------

# Create data
setup = contour_grid(
  grid_size = 50,
  point_dist = 1,
  z_method = "rpois",
  z = 40,
  z_span = 20) %>%
  contour_shape(
    radius = 20,
    x_center = 15,
    y_center = 15)

# Build plot
contour_plot(
  setup$grid_shape,
  background_col = paletteer_d("NineteenEightyR::sunset2")[5],
  line_col = paletteer_d("jcolors::pal5")[5]) +
  xlim(1, 30) +
  ylim(1, 30)

# Export to PNG
ggsave("contouR/everything/contouR_202103211050.png",
       device = "png", width = 6, height = 6, units = "in", dpi = 600)