# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(ambient)
library(patchwork)

# Make noise: Top left ---------------------------------------------------------

grid <- long_grid(
  seq(0, 0.9, l = 80),
  seq(0, 0.9, l = 80)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 150), yend = (y + curl_y / 150)),
  curvature = -0.4)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
top_left <- p

# Make noise: Top centre -------------------------------------------------------

grid <- long_grid(
  seq(0, 0.9, l = 50),
  seq(0, 0.9, l = 50)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 80), yend = (y + curl_y / 80)),
  curvature = 0.2)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
top_centre <- p

# Make noise: Top right --------------------------------------------------------

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
top_right <- p

# Make noise: Middle left ------------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 150),
  seq(0, 1, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 300), yend = (y + curl_y / 300)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
middle_left <- p

# Make noise: Middle centre ----------------------------------------------------

grid <- long_grid(
  seq(0, 1, l = 150),
  seq(0, 1, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 200), yend = (y + curl_y / 200)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
middle_centre <- p

# Make noise: Middle right -----------------------------------------------------

grid <- long_grid(
  seq(0, 1.2, l = 200),
  seq(0, 1.2, l = 200)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 250), yend = (y + curl_y / 250)),
  curvature = -0.2)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
middle_right <- p

# Make noise: Bottom left ------------------------------------------------------

grid <- long_grid(
  seq(0, 1.2, l = 150),
  seq(0, 1.2, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 250), yend = (y + curl_y / 250)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
bottom_left <- p

# Make noise: Bottom centre ----------------------------------------------------

grid <- long_grid(
  seq(0, 0.8, l = 150),
  seq(0, 0.8, l = 150)) %>%
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
bottom_centre <- p

# Make noise: Bottom right -----------------------------------------------------

grid <- long_grid(
  seq(0, 0.6, l = 150),
  seq(0, 0.6, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_perlin, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

p <- ggplot(grid, aes(x = x, y = y))
p <- p + geom_curve(
  aes(x = x, y = y, xend = (x + curl_x / 50), yend = (y + curl_y / 50)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())
bottom_right <- p

# Stitch the patches together --------------------------------------------------

perlin_quilt <- (top_left | top_centre | top_right) / (middle_left | middle_centre | middle_right) / (bottom_left | bottom_centre | bottom_right)

# Export to file
ggsave(here("colour_fields/everything/perlin_quilt_20210604.png"),
       device = "png", width = 24, height = 24, units = "in", dpi = 600)