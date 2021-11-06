# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202109181434 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.05, xlim = c(-200, 50), ylim = c(-160, 85)) %>%
  evolve(100, record)

set.seed(103)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#D077A4", "#D077A4", "#D077A4",
                "#DC94C5", "#DC94C5", "#DC94C5",
                "#E9BCE4", "#E9BCE4", "#E9BCE4",
                "#A497AD",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5",
                "#f5f5f5", "#f5f5f5", "#f5f5f5")

set.seed(103)
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = sample(colour_vec, 1, replace = TRUE))

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 2) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#f5f5f5"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181434.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181444 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.05, xlim = c(-200, 50), ylim = c(-160, 35)) %>%
  evolve(100, record)

set.seed(103)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#552A4B", "#552A4B", "#552A4B", "#552A4B",
                "#654182", "#654182",
                "#965FA0", "#965FA0", "#965FA0",
                "#B85331", "#B85331",
                "#F9D28E",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a",
                "#08070a", "#08070a", "#08070a")

set.seed(103)
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = sample(colour_vec, 1, replace = TRUE))

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 2, lineend = "round") +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#08070a"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181444.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181451 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.06, xlim = c(-200, 70), ylim = c(-160, 27)) %>%
  evolve(100, record)

set.seed(103)
traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c(rep("#5C7F8D", 4),
                rep("#A5A3A8", 2),
                rep("#A87769", 2),
                "#A39290",
                "#B96E47",
                rep("#fff7eb", 5),
                rep("#fff4e3", 5),
                rep("#fffaf7", 10))

set.seed(13)
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = sample(colour_vec, 1, replace = TRUE))

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 3, lineend = "round") +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#fffaf7"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181451.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)