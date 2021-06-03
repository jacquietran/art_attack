# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(paletteer)

# library(ggfx)
# library(ambient)
# library(EBImage)
# library(Rcpp)
# library(purrr)

# Throw shapes -----------------------------------------------------------------

set.seed(178)
shapes_data <- tibble(
  x = sample.int(20, 250, replace = TRUE),
  y = sample.int(20, 250, replace = TRUE)) %>%
  # Assign colours based on coordinates
  mutate(
    colour_regions = case_when(
      (y < 5)           ~ "region1",
      (y > 4 & y < 14)  ~ "region2",
      (y > 13)          ~ "region3"),
    colours = case_when(
      colour_regions == "region1" ~ sample(
        paletteer_d("ochRe::williams_pilbara")[1:3], n(), replace = TRUE),
      colour_regions == "region2" ~ sample(
        paletteer_d("ochRe::williams_pilbara")[4:7], n(), replace = TRUE),
      colour_regions == "region3" ~ sample(
        paletteer_d("ochRe::williams_pilbara")[1:4], n(), replace = TRUE)))

# Build plot -------------------------------------------------------------------

p <- ggplot(shapes_data, aes(x = x, y = y, colour = colours))
p <- p + geom_point(shape = 15, size = 25, alpha = 0.2)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
p <- p + geom_jitter(shape = 15, size = 25, alpha = 0.05,
                     width = 0.1, height = 0.1)
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
ggsave(here("colour_fields/everything/ambient_trial_202106031906_bloop.png"),
       device = "png", width = 8, height = 10, units = "in", dpi = 600)