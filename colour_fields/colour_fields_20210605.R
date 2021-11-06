# Load libraries ---------------------------------------------------------------

library(here)
library(dplyr)
library(ggplot2)
library(ambient)
library(magick)
library(paletteer)
library(ggfx)

# Cut shapes -------------------------------------------------------------------

set.seed(751)
ids <- factor(seq(1, 10, by = 1))

values <- data.frame(
  id = ids,
  value = sample(1:10, 10, replace = TRUE)
)

positions <- data.frame(
  id = rep(ids, each = 4),
  x = sample(1:6, 10, replace = TRUE),
  y = sample(1:6, 10, replace = TRUE))

# Currently we need to manually merge the two together
datapoly <- merge(values, positions, by = c("id"))

# Make noise -------------------------------------------------------------------

grid <- long_grid(
  seq(0, 6, l = 150),
  seq(0, 6, l = 150)) %>%
  mutate(
    curl = curl_noise(gen_cubic, x = x, y = y)) %>%
  purrr::reduce(data.frame) %>%
  rename(x = out, y = elt, curl_x = x, curl_y = y)

# Build plot ------------------------------------------------------------------

p <- ggplot()
p <- p + geom_curve(
  data = grid,
  aes(x = x, y = y, xend = (x + curl_x / 100), yend = (y + curl_y / 100)),
  curvature = -0.4)
p <- p + with_ordered_dither(
  geom_polygon(data = datapoly, aes(x = x, y = y, fill = value, group = id)))
p <- p + theme(legend.position   = "none",
               panel.background  = element_rect(fill = paletteer_d("ochRe::olsen_seq")[7]),
               axis.ticks        = element_blank(),
               axis.ticks.length = unit(0, "pt"),
               panel.grid        = element_blank(),
               axis.title        = element_blank(),
               axis.text         = element_blank())

# Export to file
ggsave(here("colour_fields/everything/colour_fields_202100605.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)