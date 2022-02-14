# Load libraries ---------------------------------------------------------------

library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# Set path for saving images ---------------------------------------------------

img_dir <- here::here("chase_art/everything/clifford_attractors/")

# Set plotting options ---------------------------------------------------------

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# # Define C++ function --------------------------------------------------------

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

# clifford_attractors_202202142126 ---------------------------------------------

# Set parameters
a = -1.82
b = 0.9621
c = -1.97
d = -1.74

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142126.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

# clifford_attractors_202202142131 ---------------------------------------------

# Set parameters
a = -1.82
b = 0.7621
c = -2.1
d = -1.5

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142131.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

# clifford_attractors_202202142134 ---------------------------------------------

# Set parameters
a = -1.92
b = 0.7621
c = -2.1
d = -1.5

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142134.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

# clifford_attractors_202202142139 ---------------------------------------------

# Set parameters
a = -1.92
b = 1.1621
c = -2.3
d = -1.8

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142139.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

# clifford_attractors_202202142144 ---------------------------------------------

# Set parameters
a = -1.92
b = 1.3621
c = -2.3
d = -1.8

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142144.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

# clifford_attractors_202202142150 ---------------------------------------------

# Set parameters
a = -1.92
b = 1.3621
c = -3.2
d = -1.1

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b, c, d)

# Build plot
p <- ggplot(df, aes(x, y)) +
  geom_point(color = "#1E1E1E", shape = 46, alpha = 0.01) +
  opt

# Export plot to PNG
ggsave(
  paste0(img_dir, "/clifford_attractors_202202142150.png"),
  last_plot(), device = "png",
  width = 10, height = 10, units = "in", dpi = 600)

