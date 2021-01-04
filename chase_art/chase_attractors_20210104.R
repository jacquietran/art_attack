# Load libraries ---------------------------------------------------------------

library(Rcpp)
library(ggplot2)
library(dplyr)
library(purrr)

# chase_attractors_202101041256 ------------------------------------------------

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

a=-2.5 #making a smaller makes it more "spread out"? but don't make it smaller than 3. making it bigger is bad, just makes lines
b=1 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.5
d=-0.9

# Create data frame
df=createTrajectory(5000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101041256.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101041437 ------------------------------------------------

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
b=1.25 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.75
d=-1

# Create data frame
df=createTrajectory(5000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101041437.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101041455 ------------------------------------------------

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

a=-2.5 #making a smaller makes it more "spread out"? but don't make it smaller than -3. making it bigger is bad, just makes lines
b=1.25 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.25
d=-2

# Create data frame
df=createTrajectory(5000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101041455.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# chase_attractors_202101041558 ------------------------------------------------

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
b=-1 #making b smaller seems good... not sure, making it from -3 to 3 doesn't change, but 1 to -1 does...?
c=0.95
d=-3

# Create data frame
df=createTrajectory(5000000, 0, 0, a, b, c, d)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.01) + opt

# Export plot to PNG
ggsave("chase_attractors_202101041558.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)