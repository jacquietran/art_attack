library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_rachet_1 ---------------------------------------------------------------

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

a=-2.2
b=-1.1
c=0.55
d=-0.7
v=0.2

df=createTrajectory(4000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_1.png", device = "png")

# chase_ratchet_202101041649 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.5
d=-0.65
v=0.15

df=createTrajectory(5000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101041649.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041657 ---------------------------------------------------

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

a=-2.25
b=-3.05
c=0.5
d=-5.65
v=7.15

df=createTrajectory(8000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101041657.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041712 ---------------------------------------------------

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

a=-1.75
b=-2.05
c=1.85
d=0.2
v=1.15

df=createTrajectory(8000000, 0, 0, 0, a, b, c, d, v)

# Build plot and export to PNG
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) +
  opt +
  ggsave("chase_ratchet_202101041712.png",
         device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041724 ---------------------------------------------------

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

a=-2.85
b=-1.02
c=0.35
d=-0.96
v=0.05

df=createTrajectory(7500000, 0, 0, 0, a, b, c, d, v)

# Build plot and export to PNG
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) +
  opt +
  ggsave("chase_ratchet_202101041724.png",
         device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041739 ---------------------------------------------------

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

a=-3.25
b=-1.05
c=0.5
d=-0.65
v=0.15

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101041739.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041804 ---------------------------------------------------

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

a=-1.85
b=-1.75
c=0.5
d=-0.65
v=0.015

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) +
  opt + 
  ggsave("chase_ratchet_202101041804.png",
         device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041850 ---------------------------------------------------

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

a=-2.35
b=-1.10
c=0.5
d=-0.75
v=0.15

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) +
  opt + 
  ggsave("chase_ratchet_202101041850.png",
         device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_ratchet_202101041948 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.83 # making this larger seems to make larger swoops and swirls
d=-0.95 # making this smaller decreases dithering >> more dense lines
v=0.15 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(8000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) +
  opt + 
  ggsave("chase_ratchet_202101041948.png",
         device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101042036 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.5 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines
v=0.35 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101042036.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101042255 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.5 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines
v=0.5 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101042255.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101042305 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.5 # making this larger seems to make larger swoops and swirls
d=-0.75 # making this smaller decreases dithering >> more dense lines
v=0.5 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101042305.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101042327 ---------------------------------------------------

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

a=-2.25
b=-1.05
c=0.75 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines
v=0.5 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101042327.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101042339 ---------------------------------------------------

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

a=-2.25
b=-1.25 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=0.75 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines and white space
v=0.5 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101042339.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)

# chase_ratchet_202101050030 ---------------------------------------------------

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

a=-2 # changing this number from -2.25 to -2 made for a single-line-style drawing
b=-1.05 # changing this number seems to rotate the swirly mass? smaller = counterclockwise
c=0.5 # making this larger seems to make larger swoops and swirls
d=-0.65 # making this smaller decreases dithering >> more dense lines and white space
v=0.5 # making this larger seems to increase "turbulence" (more little swirls)

df=createTrajectory(10000000, 0, 0, 0, a, b, c, d, v)

# Build plot
ggplot(df, aes(x, y)) +
  geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export to PNG
ggsave("chase_ratchet_202101050030.png",
       device = "png", width = 10, height = 10, units = "in", dpi = 600)