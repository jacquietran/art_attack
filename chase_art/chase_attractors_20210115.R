# Load libraries ---------------------------------------------------------------

library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_attractors_202101150942 ------------------------------------------------

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
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])*sin(b*y[i-1])-b*cos(a*x[i-1])*cos(a*x[i-1]);
            y[i] = sin(c*x[i-1])*sin(a*x[i-1])-d*cos(b*y[i-1])*cos(a*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-2.75 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=-1.06 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=-1.43
d=4.6

# Create data frame
df=createTrajectory(8000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101150942.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101151003 ------------------------------------------------

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
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])*sin(b*y[i-1])+b*cos(a*x[i-1])*cos(b*x[i-1]);
            y[i] = sin(c*x[i-1])*sin(b*x[i-1])-d*cos(b*y[i-1])*cos(a*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-2.37 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=-.66 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=-1.93
d=9.6

# Create data frame
df=createTrajectory(8000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101151003.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101151135 ------------------------------------------------

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
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])*sin(b*y[i-1])+b*cos(a*x[i-1])*cos(b*x[i-1]);
            y[i] = sin(c*x[i-1])*sin(b*x[i-1])-d*cos(b*y[i-1])*cos(a*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.6 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=-.45 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=-1.93
d=9.6

# Create data frame
df=createTrajectory(8000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101151135.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101151314 ------------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt <- list(scale_y_continuous(expand = c(0,0)),
            scale_x_continuous(expand = c(0,0)),
            theme(legend.position  = "none",
                  panel.background = element_rect(colour = NA, fill = NA),
                  panel.border     = element_blank(),
                  plot.margin      = grid::unit(c(-5, -5, -5, -5), "mm"),
                  plot.background  = element_blank(),
                  axis.ticks       = element_blank(),
                  panel.grid       = element_blank(),
                  axis.title       = element_blank(),
                  axis.text        = element_blank(),
                  axis.line        = element_blank(),
                  axis.ticks.x     = element_blank(),
                  axis.ticks.y     = element_blank()))

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])*sin(b*y[i-1])+b*cos(a*x[i-1])*cos(b*x[i-1]);
            y[i] = sin(c*x[i-1])*sin(b*x[i-1])-d*cos(b*y[i-1])*cos(a*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.6 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=-.75 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=-2.83
d=9

# Create data frame
df=createTrajectory(8000000, 0, 0, a, b, c, d)

#calculate points with createTrajectory function like normal
#then clip outer points
xmax <- max(df$x)/1.5
xmin <- min(df$x)/1.5
ymax <- max(df$y)/1.5
ymin <- min(df$y)/1.5

df_clip <- df %>%
        filter(x > xmin & x < xmax) %>%
        filter(y > ymin & y < ymax)

# Build plot
ggplot(df_clip, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101151314.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101151350 ------------------------------------------------

# Set plotting options
#cream #FAF4E7
#charcoal #1E1E1E
opt <- list(scale_y_continuous(expand = c(0,0)),
            scale_x_continuous(expand = c(0,0)),
            theme(legend.position  = "none",
                  panel.background = element_rect(colour = NA, fill = NA),
                  panel.border     = element_blank(),
                  plot.margin      = grid::unit(c(-5, -5, -5, -5), "mm"),
                  plot.background  = element_blank(),
                  axis.ticks       = element_blank(),
                  panel.grid       = element_blank(),
                  axis.title       = element_blank(),
                  axis.text        = element_blank(),
                  axis.line        = element_blank(),
                  axis.ticks.x     = element_blank(),
                  axis.ticks.y     = element_blank()))

# Define C++ function
cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])*sin(b*y[i-1])-b*cos(a*x[i-1])*cos(b*x[i-1]);
            y[i] = sin(c*x[i-1])*sin(b*x[i-1])-d*cos(b*y[i-1])*cos(a*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.6 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=-.75 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=-2.83
d=9

# Create data frame
df=createTrajectory(8000000, 0, 0, a, b, c, d)

#calculate points with createTrajectory function like normal
#then clip outer points
xmax <- max(df$x)/1.5
xmin <- min(df$x)/1.5
ymax <- max(df$y)/1.5
ymin <- min(df$y)/1.5

df_clip <- df %>%
        filter(x > xmin & x < xmax) %>%
        filter(y > ymin & y < ymax)

# Build plot
ggplot(df_clip, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101151350.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)