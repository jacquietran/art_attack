# Load libraries ---------------------------------------------------------------

library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_ratchet_202103182149 ---------------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, double t0, 
            double a, double b, double c, double d, double v) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            NumericVector t(n);
            x[0]=x0;
            y[0]=y0;
            t[0]=t0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1])-a*sin(c*t[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1])-d*sin(a*t[i-1]);
            t[i] = t[i-1]+v;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.97
b=-1.32
c=0.18
d=-1.26
v=0.05

df=createTrajectory(8000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_art/everything/chase_ratchet_202103182149.png",
       device = "png", width = 10, height = 8, units = "in", dpi = 600)