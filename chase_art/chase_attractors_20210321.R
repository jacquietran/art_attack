# Load libraries ---------------------------------------------------------------

library(here)
library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_attractors_202103211059 ------------------------------------------------

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
            x[i] = sin(a*y[i-1])*sin(a*y[i-1])+c*cos(a*x[i-1])*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])*sin(b*x[i-1])+d*cos(b*y[i-1])*cos(a*x[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-2 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=1.05 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.75
d=-1

# Create data frame
df=createTrajectory(6000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave(here("chase_art/everything/chase_attractors_202103211059.png"),
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202103211121 ------------------------------------------------

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
            x[i] = sin(a*y[i-1])*sin(a*y[i-1])+c*cos(a*x[i-1])*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])*sin(b*x[i-1])-d*cos(b*y[i-1])*cos(a*x[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-2.9 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=.95 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.75
d=-1

# Create data frame
df=createTrajectory(6000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave(here("chase_art/everything/chase_attractors_202103211121.png"),
       device = "png", width = 10, height = 10, units = "in", dpi = 600)