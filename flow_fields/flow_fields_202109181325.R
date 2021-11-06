# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202109181325 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
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
  wield(field_force, angle = field, vel = 0.002, xlim = c(-60, 25), ylim = c(-40, 60)) %>%
  evolve(1000, record)

# Part 2 START
set.seed(138)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181325.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181332 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- sample(1:2000, 1)

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
  wield(field_force, angle = field, vel = 0.004, xlim = c(-60, 25), ylim = c(-40, 60)) %>%
  evolve(1000, record)

set.seed(156)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181332.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181336 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- sample(1:2000, 1)

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
  wield(field_force, angle = field, vel = 0.001, xlim = c(-120, 25), ylim = c(-40, 60)) %>%
  evolve(1000, record)

set.seed(156)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181336.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181347 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- sample(1:2000, 1)

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
  wield(field_force, angle = field, vel = 0.001, xlim = c(-170, 15), ylim = c(-40, 60)) %>%
  evolve(2000, record)

set.seed(156)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181347.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181409 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- sample(1:2000, 1)

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
  wield(field_force, angle = field, vel = 0.001, xlim = c(-170, 15), ylim = c(-40, 60)) %>%
  evolve(1000, record)

set.seed(156)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_point(aes(x, y), shape = 46, size = 0.5, alpha = 0.2) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181409.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)