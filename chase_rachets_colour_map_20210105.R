library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(paletteer)

#read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101042327.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, ghibli_palette("MononokeMedium", 256, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_20210105.png"))