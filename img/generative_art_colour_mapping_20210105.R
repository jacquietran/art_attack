library(here)
library(EBImage)
library(tidyverse)
library(paletteer)
library(magick)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("img/handpicked/2020-12-13-01-22_seed_9163.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.matter", 265))
display(img_col, method = "raster")
img_col_cropped <- image_crop(image_read(img_col), "1780x1780+2+2")

image_write(img_col_cropped, here("img/edited/colour_mapped_202101051539.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("img/handpicked/2020-12-12-17-40_seed_6087.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("awtools::a_palette", direction = -1))
display(img_col, method = "raster")
img_col_cropped <- image_crop(image_read(img_col), "1780x1780+2+2")

image_write(img_col_cropped, here("img/edited/colour_mapped_202101051622.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("img/handpicked/2020-12-13-00-28_seed_4516.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("viridis::magma", 265, direction = -1))
display(img_col, method = "raster")
img_col_cropped <- image_crop(image_read(img_col), "1780x1780+2+2")

image_write(img_col_cropped, here("img/edited/colour_mapped_202101051631.png"))