# Load libraries ---------------------------------------------------------------

library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_ratchet_202101141757 ---------------------------------------------------

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
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1])+a*sin(c*t[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1])+d*sin(a*t[i-1]);
            t[i] = t[i-1]+v;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

# a=-2.25
# b=-1.05
# c=0.5
# d=-0.65
# v=0.15

a=-2.5 # changing this number from -2.25 to -2 made for a single-line-style drawing
b=1.83 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=0.5 # making this larger seems to make larger swoops and swirls
d=-0.8 # making this smaller decreases dithering >> more dense lines and white space
v=0.97 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(15000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101141757.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101142048 ---------------------------------------------------

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
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1])+a*sin(c*t[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1])+d*sin(a*t[i-1]);
            t[i] = t[i-1]+v;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

# a=-2.25
# b=-1.05
# c=0.5
# d=-0.65
# v=0.15

a=-2.5 # changing this number from -2.25 to -2 made for a single-line-style drawing
b=1.83 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=-0.5 # making this larger seems to make larger swoops and swirls
d=-1.8 # making this smaller decreases dithering >> more dense lines and white space
v=2 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(15000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101142048.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101142106 ---------------------------------------------------

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
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1])+a*sin(c*t[i-1]);
            y[i] = sin(b*x[i-1])-d*cos(b*y[i-1])+d*sin(a*t[i-1]);
            t[i] = t[i-1]+v;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

# a=-2.25
# b=-1.05
# c=0.5
# d=-0.65
# v=0.15

a=-2.25 # changing this number from -2.25 to -2 made for a single-line-style drawing
b=-1.05 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=0.75 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines
v=0.57 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(15000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101142106.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101142229 ---------------------------------------------------

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
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1])+a*sin(c*t[i-1]);
            y[i] = sin(b*x[i-1])-d*cos(b*y[i-1])-d*sin(a*t[i-1]);
            t[i] = t[i-1]+v;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

# a=-2.25
# b=-1.05
# c=0.5
# d=-0.65
# v=0.15

a=-2.5 # changing this number from -2.25 to -2 made for a single-line-style drawing
b=-1.05 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=0.25 # making this larger seems to make larger swoops and swirls
d=-0.7 # making this smaller decreases dithering >> more dense lines
v=0.8 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(15000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101142229.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)