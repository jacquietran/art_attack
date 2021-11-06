# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(paletteer)
library(magick)

# Throw shapes -----------------------------------------------------------------

set.seed(178)
shapes_data <- tibble(
  x = sample.int(4, 50, replace = TRUE),
  y = sample.int(4, 50, replace = TRUE),
  omit = sample.int(3, 50, replace = TRUE)) %>%
  mutate(
    colours = sample(
      paletteer_d("grDevices::blues9")[4:9], n(), replace = TRUE)) %>%
  filter(omit != 3)

# Build plot -------------------------------------------------------------------

p <- ggplot(shapes_data, aes(x = x, y = y, colour = colours))
p <- p + geom_point(shape = 15, size = 200, alpha = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + geom_jitter(shape = 15, size = 200, alpha = 0.05,
                     width = 0.25, height = 0.25)
p <- p + scale_colour_manual(values = shapes_data$colours)
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(
                 fill=paletteer_d("ochRe::namatjira_qual")[3]),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/colour_field_20210604.png"),
       device = "png", width = 10, height = 8, units = "in", dpi = 600)

# Import image -----------------------------------------------------------------

img <- image_read(here("colour_fields/everything/colour_field_20210604.png"))

img_morphed <- img %>%
    image_trim() %>%
    image_resize("3000x2400") %>%
    image_morphology('DilateI', 'Octagon', iter = 20) %>%
    image_morphology('ErodeI', 'Disk', iter = 3) %>%
    image_motion_blur(angle = 270, radius = 3000, sigma = 30) %>%
    image_morphology('DilateI', 'Octagon', iter = 3) %>%
    image_quantize(max = 64)
  
   #image_modulate(brightness = 200) %>%
   #image_enhance()

image_write(
  img_morphed,
  here("colour_fields/everything/highfade_poc_202106042147.png"),
  format = "png", quality = 100)