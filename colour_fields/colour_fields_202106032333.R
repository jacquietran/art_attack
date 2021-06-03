# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(ambient)
library(magick)

# library(paletteer)
# library(png)
# library(grid)

# Make some noise --------------------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 100),
  seq(0, 1, l = 100)) %>%
  mutate(
    curl = curl_noise(gen_simplex, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 100), yend = (y + curl_y / 100)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106031906_simplex.png"),
       device = "png", width = 8, height = 10, units = "in", dpi = 600)

# Read in as {magick} image
simplex_starter <- image_read(
  here("colour_fields/everything/ambient_trial_202106031906_simplex.png"))
simplex_cropped <- image_crop(simplex_starter, "3840x4800+480+600")
simplex_resized <- image_resize(simplex_cropped, "4800x6000")

image_write(
  simplex_resized,
  here("colour_fields/everything/ambient_trial_202106031906_simplex_cropped.png"),
  format = "png", quality = 100)

# Make noise, part 2 -----------------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 150),
  seq(0, 1, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 100), yend = (y + curl_y / 100)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106032333_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 3 -----------------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 150),
  seq(0, 1, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_cubic, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 100), yend = (y + curl_y / 100)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106032333_cubic.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 4 -----------------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 120),
  seq(0, 1, l = 120)) %>%
  mutate(
    curl = curl_noise(gen_value, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 100), yend = (y + curl_y / 100)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106032333_value.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)