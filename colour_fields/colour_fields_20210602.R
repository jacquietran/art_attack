# Load libraries ---------------------------------------------------------------

# Make noise
library(here)
library(ambient)
library(dplyr)

# Add colour
library(EBImage)
library(paletteer)

# Plot on top of colour field
library(Rcpp)
library(purrr)
library(ggplot2)
library(png)
library(grid)

# Make some noise --------------------------------------------------------------
  
png(here("colour_fields/everything/ambient_trial_20210602.png"),
    width = 8, height = 8, units = "in", res = 600)

long_grid(x = seq(0, 1.5, length.out = 1000), 
          y = seq(0, 1.5, length.out = 1000)) %>% 
  mutate(
    x1 = x + gen_simplex(x, y) / 3, 
    y1 = y + gen_simplex(x, y) / 25,
    worley = gen_worley(x, y, value = 'distance', seed = 50),
    worley_frac = fracture(gen_worley, ridged, octaves = 18, x = x, y = y, 
                           value = 'distance', seed = 5),
    full = blend(normalise(worley), normalise(worley_frac), gen_spheres(x1, y1))
  ) %>%
  plot(full)

dev.off()

# Add some colour --------------------------------------------------------------

# read in the image and convert to greyscale
img <- readImage(here("colour_fields/everything/ambient_trial_20210602.png"))
gray <- channel(img, "gray")

img_col <- colormap(gray, paletteer_c("ggthemes::Blue Light",
                                      n = 256, direction = -1))
display(img_col, method = "raster")

writeImage(
  img_col,
  here("colour_fields/everything/ambient_trial_20210602_col.png"))

# Plot on top of colour field --------------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position   = "none",
            panel.background  = element_rect(fill="white"),
            axis.ticks        = element_blank(),
            axis.ticks.length = unit(0, "pt"),
            panel.grid        = element_blank(),
            axis.title        = element_blank(),
            axis.text         = element_blank())

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a = -1.82
b = 0.9621
c = -1.97
d = -1.64

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# clip outer points
xmax <- max(df$x)/2.5
xmin <- min(df$x)/2.5
ymax <- max(df$y)/2.5
ymin <- min(df$y)/2.5

df_clip <- df %>%
  filter(x > xmin & x < xmax) %>%
  filter(y > ymin & y < ymax)

# Read in background image
bg <- readPNG(here("colour_fields/everything/ambient_trial_20210602_col.png"))

# Build plot
p <- ggplot(df_clip, aes(x, y))
p <- p + annotation_custom(
  rasterGrob(bg, width = unit(1,"npc"), height = unit(1,"npc")), 
  -Inf, Inf, -Inf, Inf)
p <- p + geom_point(color=paletteer_d("nord::mountain_forms")[1], shape=46, alpha=.01)
p <- p + scale_x_continuous(expand = c(0,0))
p <- p + scale_y_continuous(expand = c(0,0))
p <- p + opt

p

# Export plot to PNG
ggsave(here("colour_fields/everything/ambient_trial_20210602_composite.png"),
       device = "png", width = 8, height = 8, units = "in", dpi = 600)