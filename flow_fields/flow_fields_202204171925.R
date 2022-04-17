# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202204171925 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 15781 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_perlin, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.002, xlim = c(-60, 25), ylim = c(-70, 75)) %>%
  impose(polygon_constraint, polygon = cbind(c(-100, -100, 100, 100), c(-100, 100, 100, -100))) %>%
  evolve(1000, record)

set.seed(seed)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# Subset of traces data
set.seed(seed)
traces_subset <- traces |>
  dplyr::mutate(temp_var = sample(1:400, dplyr::n(), replace = TRUE)) |>
  dplyr::filter(temp_var == 5)

# plot particles as points
p <- ggplot() +
  geom_point(
    data = traces_subset,
    aes(x, y, group = particle),
    size = 0.001, shape = 46) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202204171925.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)