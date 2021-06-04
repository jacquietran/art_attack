# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(ambient)
library(magick)

# Make some noise --------------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041335_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

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
  aes(x = x, y = y, xend = (x + curl_x / 300), yend = (y + curl_y / 300)),
  curvature = -0.1)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041336_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 3 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041337_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 4 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041338_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 5 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041339_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 6 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041340_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 7 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041341_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Make noise, part 8 -----------------------------------------------------------

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

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_202106041346_perlin.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)