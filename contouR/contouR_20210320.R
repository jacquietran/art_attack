# Load libraries ---------------------------------------------------------------

library(contouR)
library(ggplot2)
library(paletteer)

# countouR_202103201144 --------------------------------------------------------

# Create data
setup = contour_grid(
  grid_size = 50,
  point_dist = .25,
  z_method = "rpois",
  z = 100,
  z_span = 5) %>%
  contour_shape(
    radius = 13.2,
    x_center = 10,
    y_center = 10,
    ring_system = "multiple",
    num_rings = 3)

# Build plot
contour_plot(
  setup$grid_shape,
  setup$rings,
  background_col = paletteer_d("awtools::a_palette")[4],
  line_col = paletteer_d("awtools::a_palette")[6]) +
  xlim(1, 30) +
  ylim(1, 30)

# Export to PNG
ggsave("contouR/everything/contouR_202103201144.png",
       device = "png", width = 6, height = 6, units = "in", dpi = 600)