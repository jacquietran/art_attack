# Load libraries ---------------------------------------------------------------

# Make noise
library(here)
library(ambient)
library(dplyr)

# Image manip
library(magick)

# Add colour
library(EBImage)
library(paletteer)

# For masking
library(ggfx)

# Plot on top of colour field
library(Rcpp)
library(purrr)
library(ggplot2)
library(png)
library(grid)

# Make some noise --------------------------------------------------------------

# Left side
png(here("colour_fields/everything/ambient_trial_20210603_01.png"),
    width = 8, height = 8, units = "in", res = 600)

long_grid(x = seq(0, 80, length.out = 1000), 
          y = seq(0, 80, length.out = 1000)) %>% 
  mutate(
    x1 = x + gen_simplex(x, y) / 3, 
    y1 = y + gen_simplex(x, y) / 5,
    worley = gen_worley(x, y, value = 'distance', seed = 50),
    worley_frac = fracture(gen_worley, ridged, octaves = 8, x = x, y = y, 
                           value = 'distance', seed = 5),
    full = blend(normalise(worley), normalise(worley_frac), gen_spheres(x1, y1))
  ) %>%
  plot(full)

dev.off()

# Right side
png(here("colour_fields/everything/ambient_trial_20210603_02.png"),
    width = 8, height = 8, units = "in", res = 600)

long_grid(x = seq(0, 5, length.out = 1000), 
          y = seq(0, 5, length.out = 1000)) %>% 
  mutate(
    x1 = x + gen_simplex(x, y) / 3, 
    y1 = y + gen_simplex(x, y) / 8,
    perlin = gen_perlin(x, y),
    perlin_frac = fracture(gen_perlin, fbm, octaves = 8, x = x, y = y, 
                           value = 'distance', seed = 1)
  ) %>%
  plot(perlin_frac)

dev.off()

# Merge noise blocks -----------------------------------------------------------

# Left side
left <- image_read(here("colour_fields/everything/ambient_trial_20210603_01.png"))
left_cropped <- image_crop(left, "2400x4800")

# Right side
right <- image_read(here("colour_fields/everything/ambient_trial_20210603_02.png"))
right_cropped <- image_crop(right, "1200x4800+2400")

# Append left and right noise blocks
noise_blocks <- c(left_cropped, right_cropped)
noise_blocks_appended <- image_append(noise_blocks)

# Export to file
image_write(
  noise_blocks_appended,
  here("colour_fields/everything/ambient_trial_20210603_noise_blocks.png"),
  format = "png", quality = 100)

# Make a mask ------------------------------------------------------------------

# Create data
set.seed(10720)
mask_data <- tibble(
  x = sample.int(6, 40, replace = TRUE),
  y = sample.int(8, 40, replace = TRUE))

# Build plot
p <- ggplot()
p <- p + geom_point(
  data = mask_data, aes(x = x, y = y),
  shape = 15, size = 28)
p <- p + scale_x_continuous(limits = c(0.75,6.25))
p <- p + scale_y_continuous(limits = c(0.75,8.25))
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_20210603_mask.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Create colour layer ----------------------------------------------------------

# Assign colours based on coordinates
colour_data <- mask_data %>%
  mutate(
    colours = case_when(
      x < 5 & y == 1  ~ "greyblue",
      x == 4 & y == 6 ~ "orange",
      x < 5 & y > 5   ~ "greyblue",
      x < 5 & y < 7   ~ "orange",
      x > 4 & y == 1  ~ "lightbrown",
      TRUE            ~ "dustyblue"))

colour_vector <- c(
  "orange"     = paletteer_d("ochRe::williams_pilbara")[1],
  "greyblue"   = paletteer_d("ochRe::williams_pilbara")[4],
  "lightbrown" = paletteer_d("ochRe::olsen_qual")[1],
  "dustyblue"  = paletteer_d("ochRe::williams_pilbara")[7])

# Build plot
p <- ggplot(colour_data, aes(x = x, y = y, colour = colours))
p <- p + geom_point(shape = 15, size = 28)
p <- p + scale_x_continuous(limits = c(0.75,6.25))
p <- p + scale_y_continuous(limits = c(0.75,8.25))
p <- p + scale_colour_manual(values = colour_vector)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/ambient_trial_20210603_colours.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Apply mask -------------------------------------------------------------------

# Load noise image for bg
bg <- readPNG(
  here("colour_fields/everything/ambient_trial_20210603_noise_blocks.png"))

# Load mask
mask_raster <- as.raster(
  readPNG(here("colour_fields/everything/ambient_trial_20210603_mask.png")))

p <- ggplot()
p <- p + with_mask(
  annotation_custom(
    rasterGrob(bg, width = unit(1,"npc"), height = unit(1,"npc")), 
    -Inf, Inf, -Inf, Inf),
  mask = mask_raster,
  invert = TRUE)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export masked image to file
ggsave(here("colour_fields/everything/ambient_trial_20210603_masked.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)

# Apply colour layer -----------------------------------------------------------

# Load colour layer
colour_layer <- as.raster(
  readPNG(here("colour_fields/everything/ambient_trial_20210603_colours.png")))

# Load masked image
masked_img <- as.raster(
  readPNG(here("colour_fields/everything/ambient_trial_20210603_masked.png")))

p <- ggplot()
p <- p + as_reference(
  annotation_custom(
    rasterGrob(masked_img, width = unit(1,"npc"), height = unit(1,"npc")), 
    -Inf, Inf, -Inf, Inf),
  id = "masked_img")
p <- p + with_blend(
  annotation_custom(
    rasterGrob(colour_layer, width = unit(1,"npc"), height = unit(1,"npc")), 
    -Inf, Inf, -Inf, Inf),
  bg_layer = "masked_img",
  blend_type = "overlay")
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill="white"),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export composite image to file
ggsave(here("colour_fields/everything/ambient_trial_20210603_composite.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)