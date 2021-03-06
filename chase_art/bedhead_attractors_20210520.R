# Load libraries ---------------------------------------------------------------

library(here)
library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# bedhead_attractors_202105210004 ----------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(x[i-1]*y[i-1]/b)*y[i-1]+cos(a*x[i-1]-y[i-1]);
            y[i] = x[i-1]+sin(y[i-1])/b;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a = 0.4271
b = 0.3023

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave(here("chase_art/everything/bedhead_attractors_202105200004.png"),
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# bedhead_attractors_202105210904 ----------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(x[i-1]*y[i-1]/b)*y[i-1]+cos(a*x[i-1]-y[i-1]);
            y[i] = x[i-1]+sin(y[i-1])/b;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a = 0.78
b = 0.1123

# Create data frame
df=createTrajectory(10000000, 0, 0, a, b)

# for "cropping" the plot
xmin <- min(df$x) / 3
xmax <- max(df$x) / 3
ymin <- min(df$y) / 3
ymax <- max(df$y) / 3

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt + 
  coord_cartesian(xlim = c(xmin, xmax), ylim = c(ymin, ymax))

# Export plot to PNG
ggsave(here("chase_art/everything/bedhead_attractors_202105200904.png"),
       device = "png", width = 6, height = 6, units = "in", dpi = 600)

# bedhead_attractors_202105210934 ----------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(x[i-1]*y[i-1]/b)*y[i-1]+cos(a*x[i-1]-y[i-1]);
            y[i] = x[i-1]+sin(y[i-1])/b;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a = 0.98
b = 0.23

# Create data frame
df=createTrajectory(6000000, 0, 0, a, b)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave(here("chase_art/everything/bedhead_attractors_202105200934.png"),
       device = "png", width = 12, height = 12, units = "in", dpi = 600)