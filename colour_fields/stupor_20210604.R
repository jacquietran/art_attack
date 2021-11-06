# Load libraries ---------------------------------------------------------------

library(here)
library(magick)

# Import image -----------------------------------------------------------------

# TODO: Drop code in from ambient_trial_202106031906.R to build the base plot
img <- image_read(here("colour_fields/everything/ambient_trial_20210603_bloop.png"))

img_morphed <- img %>%
  image_crop("900x600+50+50") %>%
  image_morphology('OpenI', 'Octagon', iter = 10) %>%
  image_blur(radius = 2, sigma = 1) %>%
  image_resize("6000x4800") %>%
  image_noise() %>%
  image_ordered_dither(threshold_map = "h8x8a") %>%
  image_enhance() %>%
  image_reducenoise() %>%
  image_despeckle(times = 10) %>%
  image_resize("9900x7020") %>% # A3 size at 600 dpi
  image_enhance() %>%
  image_normalize()

image_write(
  img_morphed,
  here("colour_fields/everything/stupor_20210604.png"),
  format = "png", quality = 100)