library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101042327.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, ghibli_palette("MononokeMedium", 256, type = "continuous"))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101050101.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101042255.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.tempo", 265))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101050852.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101041455_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.matter", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101050937.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101041724_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.thermal", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101050945.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_ratchet_202101041724_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("scico::lajolla", 265))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101050959.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101041437_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("scico::tokyo", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051505.png"))

# 7 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101051314_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::kovesi.linear_bmy_10_95_c71", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051512.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101051417_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::kovesi.linear_blue_95_50_c20", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051515.png"))

# 9 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/chase_attractors_202101051417_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("viridis::magma", 265, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051524.png"))

# 10 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/rachet_attractors_202101041631_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::orange.pal", 20, direction = -1))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051532.png"))

# 11 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/rachet_attractors_202101041631_resized.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::turquoise.pal", 20))
display(img_col, method = "raster")

writeImage(img_col, here("chase_art/everything/colour_mapping_attempt_202101051534.png"))