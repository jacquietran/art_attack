# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(ambient)
library(particles)
library(tidygraph)
library(here)

# flow_fields_202105201022------------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <-
  long_grid(x = seq(0, 10, length.out = 1000),
            y = seq(0, 10, length.out = 1000)) %>%
  mutate(
    x1 = x + gen_perlin(x = x, y = y, frequency = 2, seed = seed),
    y1 = y + gen_perlin(x = x, y = y, frequency = 0.5, seed = seed)
  )

# add curl noise
curl <- curl_noise(gen_perlin, seed = seed, x = grid$x1, y = grid$y1)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_ring(10000) %>%
  simulate(alpha_decay = 0, setup = petridish_genesis(vel_max = 0, max_radius = 1)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.12, xlim = c(-40, 25), ylim = c(-40, 25)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:10000, 100)

bl_yl <- c('#6e747a', '#53575c')
bl_yl_bg <- '#EEEEEE'

traces2 <-
  traces %>%
  group_by(particle) %>%
  mutate(color = sample(bl_yl, 1, replace = TRUE))

# for "cropping" the plot
xmin <- min(traces2$x) / 6
xmax <- max(traces2$x) / 6
ymin <- min(traces2$y) / 6
ymax <- max(traces2$y) / 6

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, color = color), size = 0.015, alpha = 0.3) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(legend.position = 'none', panel.background = element_rect(fill = bl_yl_bg)) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202105201022.png"),
       last_plot(), width = 12, height = 12, units = "in", dpi = 300)

# flow_fields_202105201135 ------------------------------------------------------

# create noise field
seed <- sample(1:2000, 1)

grid <-
  long_grid(x = seq(0, 10, length.out = 1000),
            y = seq(0, 10, length.out = 1000)) %>%
  mutate(
    x1 = x + gen_perlin(x = x, y = y, frequency = 2, seed = seed),
    y1 = y + gen_perlin(x = x, y = y, frequency = 0.5, seed = seed)
  )

# add curl noise
curl <- curl_noise(gen_perlin, seed = seed, x = grid$x1, y = grid$y1)

grid$angle <- atan2(curl$y, curl$x) - atan2(grid$y, grid$x)

# convert noise values to a matrix of angles
field <- as.matrix(grid, x, value = angle)

# particle simulation
sim <- create_ring(10000) %>%
  simulate(alpha_decay = 0, setup = petridish_genesis(vel_max = 0, max_radius = 1)) %>%
  wield(reset_force, xvel = 0, yvel = 0) %>%
  wield(field_force, angle = field, vel = 0.12, xlim = c(-80, 25), ylim = c(-80, 25)) %>%
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:10000, 100)

bl_yl <- c('#6e747a', '#53575c', '#38577a')
bl_yl_bg <- '#EEEEEE'

traces2 <-
  traces %>%
  group_by(particle) %>%
  mutate(color = sample(bl_yl, 1, replace = TRUE))

# for "cropping" the plot
xmin <- min(traces2$x) / 2.5
xmax <- max(traces2$x) / 2.5
ymin <- min(traces2$y) / 2.5
ymax <- max(traces2$y) / 2.5

# plot particle traces
ggplot(traces2) +
  geom_path(aes(x, y, group = particle, color = color, linetype = "dashed"),
            size = 0.025, alpha = 0.4) +
  scale_color_identity(guide = "none") +
  theme_void() +
  theme(legend.position = 'none', panel.background = element_rect(fill = bl_yl_bg)) +
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# export to file
ggsave(here("flow_fields/everything/flow_fields_202105201135.png"),
       last_plot(), width = 12, height = 12, units = "in", dpi = 300)