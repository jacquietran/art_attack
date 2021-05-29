# Load libraries ---------------------------------------------------------------

library(here)
library(EBImage)
library(tidyverse)
library(ghibli)
library(paletteer)

# 1 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210034.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, ghibli_palette("YesterdayMedium", direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210034_col01.png"))

# 2 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210034.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::grey.pal",
                                            n = 20, direction = 1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210034_col02.png"))

# 3 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210034.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::turquoise.pal",
                                            n = 20, direction = 1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210034_col03.png"))

# 4 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210034.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_dynamic("cartography::harmo.pal",
                                            n = 20, direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210034_col04.png"))

# 5 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210114.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("nord::lumina"))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210114_col01.png"))

# 6 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210114.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.matter",
                                      n = 20, direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210114_col02.png"))

# 7 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210114.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.dense",
                                      n = 20, direction = 1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210114_col03.png"))

# 8 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105212147.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("pals::ocean.tempo",
                                      n = 20, direction = 1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105212147_col01.png"))

# 9 ----------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105212147.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("rcartocolor::ag_Sunset", direction = 1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105212147_col02.png"))

# 10 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105212147.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, c(paletteer_d("rcartocolor::ag_Sunset", direction = 1),
                            "#FFFFFFFF"))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105212147_col03.png"))

# 11 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105212147.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("rcartocolor::Peach", direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105212147_col04.png"))

# 12 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210124.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_d("rcartocolor::Mint", direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210124_col01.png"))

# 13 ---------------------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("chase_art/handpicked/clifford_attractors_202105210124.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("viridis::inferno",
                                      n = 20, direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("chase_art/everything/clifford_attractors_202105210124_col02.png"))