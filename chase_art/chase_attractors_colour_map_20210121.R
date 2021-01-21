library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(cptcity)
# library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_001", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211747.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_003", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211821.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_008", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211823.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_015", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211825.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_016", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211828.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141432_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_1_cw1_017", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211830.png"))

# 7 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141255_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_038", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211831.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141255_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_062", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211839.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141255_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_068", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211841.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141356_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_073", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211842.png"))

# 9 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141356_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_082", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211843.png"))

# 10 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141356_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_2_cw2_087", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211853.png"))

# 11 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141356_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "cw_6_cw6_036", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211855.png"))

# 12 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141607_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "es_skywalker_es_skywalker_13", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211859.png"))

# 13 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141607_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "es_skywalker_es_skywalker_24", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211905.png"))

# 14 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141607_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "es_rosa_es_rosa_67", n = 100, rev = FALSE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211912.png"))

# 15 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101141607_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, cpt(pal = "jjg_ccolo_Bionic_Blender_Bad_Kitten", n = 100, rev = TRUE))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101211924.png"))