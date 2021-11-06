# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202109180015 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.02, xlim = c(-50, 30), ylim = c(-40, 30)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.3, lineend = "round") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109180015.png"),
       last_plot(), width = 10, height = 8, units = "in", dpi = 300)

# flow_fields_202109180028 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.002, xlim = c(-60, 30), ylim = c(-40, 36)) %>%
  evolve(1000, record)

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
ggsave(here("flow_fields/everything/flow_fields_202109180028.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109180042 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_spheres, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.02, xlim = c(-60, 30), ylim = c(-40, 36)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109180042.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109180051 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_worley, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.1, xlim = c(-80, 30), ylim = c(-40, 36)) %>%
  evolve(200, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.3) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109180051.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109180056 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_white, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.15, xlim = c(-80, 30), ylim = c(-40, 36)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.3) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109180056.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181132 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_spheres, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.02, xlim = c(-60, 30), ylim = c(-40, 36)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), colour = "#000000", size = 1) +
  geom_path(aes(x, y, group = particle), colour = "#FFFFFF", size = 0.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181132.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181134 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_spheres, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.02, xlim = c(-60, 30), ylim = c(-40, 36)) %>%
  evolve(500, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), colour = "#36454F", size = 2) +
  geom_path(aes(x, y, group = particle), colour = "#899499", size = 0.7) +
  geom_path(aes(x, y, group = particle), colour = "#E5E4E2", size = 0.35) +
  geom_path(aes(x, y, group = particle), colour = "#FFFFFF", size = 0.1) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181134.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181139 -----------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000)) %>%
  mutate(noise = gen_simplex(x, y))

# add curl noise
curl <- curl_noise(gen_spheres, x = grid$x, y = grid$y)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_empty(1000) %>%
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.005, xlim = c(-80, 30), ylim = c(-40, 36)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181139.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181143 -----------------------------------------------------

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
ggsave(here("flow_fields/everything/flow_fields_202109181143.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181146 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.002, xlim = c(-60, 50), ylim = c(-40, 35)) %>%
  evolve(1000, record)

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
ggsave(here("flow_fields/everything/flow_fields_202109181146.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181147 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.002, xlim = c(-110, 50), ylim = c(-40, 35)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#000000", "#36454F")
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = sample(colour_vec, 1, replace = TRUE))

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 4) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181147.png"),
       last_plot(), width = 16, height = 16, units = "in", dpi = 300)

# flow_fields_202109181228 -----------------------------------------------------

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

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF")
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
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181228.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181237 -----------------------------------------------------

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

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF")
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
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181237.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181255 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.1, xlim = c(-200, 50), ylim = c(-160, 65)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# for "cropping" the plot
xmin <- min(traces2$x) / 1.5
xmax <- max(traces2$x) / 2.5
ymin <- min(traces2$y) / 1.5
ymax <- max(traces2$y) / 2.5

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF")) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181255.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181301 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.05, xlim = c(-200, 50), ylim = c(-160, 65)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#000000", "#303030", "#FFFFFF", "#FFFFFF", "#FFFFFF",
                "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

# Part 2 START
set.seed(1025)
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
    plot.background = element_rect(fill = "#FFFFFF"))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181301.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181309 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.05, xlim = c(-200, 50), ylim = c(-160, 65)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

colour_vec <- c("#000000", "#303030", "#FFFFFF", "#FFFFFF", "#FFFFFF",
                "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

# Part 2 START
set.seed(1025)
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = sample(colour_vec, 1, replace = TRUE))

# for "cropping" the plot
xmin <- min(traces2$x) / 2.5
xmax <- (max(traces2$x) / 1) * 1.2
ymin <- (min(traces2$y) / 1) * 1.2
ymax <- max(traces2$y) / 1.3

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 2) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF")) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181309.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181319 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.05, xlim = c(-200, 50), ylim = c(-160, 65)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# Part 2 START
# for "cropping" the plot
xmin <- min(traces$x) / 2.5
xmax <- (max(traces$x) / 1) * 1.2
ymin <- (min(traces$y) / 1) * 1.2
ymax <- max(traces$y) / 1.3

# Apply colours
dark_cols_vec <- c("#000000", "#000000", "#303030", "#808080", "#FFFFFF",
                   "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

med_cols_vec <- c("#000000", "#303030", "#303030", "#808080", "#FFFFFF",
                  "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

light_cols_vec <- c("#303030", "#808080", "#808080", "#F8F8F8", "#FFFFFF",
                    "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

set.seed(1025)
traces2 <- traces %>%
  group_by(particle, .drop = "TRUE") %>%
  mutate(
    colour = case_when(
      y < ymin + ((ymax - ymin)/3)   ~ sample(dark_cols_vec, 1, replace = TRUE),
      y < ymin + 2*((ymax - ymin)/3) ~ sample(med_cols_vec, 1, replace = TRUE),
      TRUE                           ~ sample(light_cols_vec, 1, replace = TRUE)))

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, colour = colour), size = 2) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF")) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181319.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)

# flow_fields_202109181325 -----------------------------------------------------

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
  wield(field_force, angle = field, vel = 0.002, xlim = c(-60, 50), ylim = c(-40, 35)) %>%
  evolve(1000, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

# for "cropping" the plot
xmin <- min(traces$x) / 2.5
xmax <- (max(traces$x) / 1) * 1.2
ymin <- (min(traces$y) / 1) * 1.2
ymax <- max(traces$y) / 1.3

# plot particle traces
ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 1.5) +
  theme_void() +
  theme(
    legend.position = 'none',
    plot.background = element_rect(fill = "#FFFFFF")) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202109181325.png"),
       last_plot(), width = 10, height = 10, units = "in", dpi = 300)