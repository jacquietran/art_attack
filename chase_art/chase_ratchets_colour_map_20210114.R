# Load libraries ---------------------------------------------------------------

library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142106.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, ghibli_palette("YesterdayMedium", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142347.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142106.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, ghibli_palette("MononokeMedium", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142349.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142106.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("jcolors::pal11", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142351.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142106.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("jcolors::pal12", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142353.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142106.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("jcolors::pal4", direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142356.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142229.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("nord::lumina"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142357.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142229.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.dense", 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142358.png"))

# 7 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101142229.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("scico::lapaz", 256))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101142359.png"))