# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202109242331 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 13 # change to mix things up
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
  evolve(1000, record)

set.seed(seed)
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
ggsave(here("flow_fields/everything/flow_fields_202109242331.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109242338 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 347 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
set.seed(seed)
curl <- curl_noise(gen_perlin, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
num_lines <- 3 # change this to modify number of lines
set.seed(seed)
sim <- create_empty(num_lines) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.02, xlim = c(-90, 25), ylim = c(-83, 33)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:num_lines, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109242338.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109242347 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 347 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
set.seed(seed)
curl <- curl_noise(gen_value, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
num_lines <- 30 # change this to modify number of lines
set.seed(seed)
sim <- create_empty(num_lines) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.006, xlim = c(-90, 25), ylim = c(-83, 33)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:num_lines, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109242347.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109242355 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 37 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
set.seed(seed)
curl <- curl_noise(gen_waves, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
num_lines <- 8 # change this to modify number of lines
set.seed(seed)
sim <- create_empty(num_lines) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.006, xlim = c(-90, 25), ylim = c(-83, 33)) %>%
  evolve(2000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:num_lines, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109242355.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109242357 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 37 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
set.seed(seed)
curl <- curl_noise(gen_checkerboard, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
num_lines <- 8 # change this to modify number of lines
set.seed(seed)
sim <- create_empty(num_lines) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.006, xlim = c(-90, 25), ylim = c(-83, 33)) %>%
  evolve(2000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:num_lines, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109242357.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109242358 -----------------------------------------------------

# Run in 2 parts

# Part 1 START
# create noise field
seed <- 92 # change to mix things up
set.seed(seed)
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
set.seed(seed)
curl <- curl_noise(gen_value, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# Part 2 START
# particle simulation
num_lines <- 10 # change this to modify number of lines
set.seed(seed)
sim <- create_empty(num_lines) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.008, xlim = c(-80, 25), ylim = c(-83, 33)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:num_lines, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109242358.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)