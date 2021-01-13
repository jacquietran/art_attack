library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101141031.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    paletteer_d("ghibli::KikiMedium",
                                n = 365, direction = -1, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101141209.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101141031.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    paletteer_d("ghibli::LaputaMedium",
                                n = 256, direction = -1, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101141213.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101141039.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("awtools::a_palette", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101141221.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101141039.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::turquoise.pal", n = 20))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101141225.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101141039.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    paletteer_dynamic("cartography::harmo.pal",
                                      n = 20, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101141231.png"))