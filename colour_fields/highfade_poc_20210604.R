# Load libraries ---------------------------------------------------------------

library(here)
library(magick)

# Import image -----------------------------------------------------------------

# TODO: Drop code in from ambient_trial_202106031906.R to build the base plot
img <- image_read(here("colour_fields/everything/ambient_trial_20210603_bloop.png"))

img_morphed <- img %>%
  image_crop("600x430+2400+4950") %>%
  image_resize("900x600") %>%
  image_morphology('ErodeI', 'Disk', iter = 10) %>%
  image_morphology('DilateI', 'Octagon', iter = 3) %>%
  image_modulate(hue = 98, brightness = 70) %>%
  image_contrast() %>%
  image_contrast() %>%
  image_modulate(brightness = 105) %>%
  image_motion_blur(angle = 270, radius = 1200, sigma = 30) %>%
  image_morphology('DilateI', 'Octagon', iter = 3) %>%
  image_quantize(max = 64) %>%
  image_modulate(brightness = 200) %>%
  image_enhance()
  
image_write(
  img_morphed,
  here("colour_fields/everything/highfade_poc_20210604.png"),
  format = "png", quality = 100)