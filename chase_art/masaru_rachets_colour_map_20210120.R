library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(cptcity)
# library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201559.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    paletteer_d("ghibli::KikiMedium",
                                n = 365, direction = -1, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202057.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201559.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    paletteer_d("ghibli::PonyoMedium",
                                n = 365, direction = -1, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202059.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201646.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "cmocean_ice", n = 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202102.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201646.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "wkp_encyclopedia_nordisk_familjebok", n = 256, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202123.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201942.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "wkp_encyclopedia_nordisk_familjebok", n = 256, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202127.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201942.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw1_bhw1_sunset2", n = 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202127.png"))

# 7 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101201942.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw3_bhw3_23", n = 256, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202130.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101202000.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw3_bhw3_27", n = 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202136.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101202000.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw3_bhw3_36", n = 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202137.png"))

# 9 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101202000.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw3_bhw3_37", n = 256, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202139.png"))

# 10 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/masaru_rachets_202101202000.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray,
                    cpt(pal = "bhw_bhw4_bhw4_032", n = 256, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101202140.png"))