# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202109172245------------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_perlin, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.01, xlim = c(-180, 40), ylim = c(-180, 40)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.8, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109172245.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109172359------------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_perlin, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.025, xlim = c(-70, 30), ylim = c(-80, 30)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.06, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109172359.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)