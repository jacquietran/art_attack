# Load libraries ---------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(purrr)

# masaru_ratchets_202101041615 -------------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#fff9f9"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
createTrajectory <- function(n, x0, y0, t0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6) {
  x <- vector(mode = "numeric", length = n)
  y <- vector(mode = "numeric", length = n)
  t <- vector(mode = "numeric", length = n)
  
  x[1] <- x0
  y[1] <- y0
  t[1] <- t0
  for(i in 2:n) {
    x[i] = a1*sin(f1*y[i-1])^p+a2*cos(f2*y[i-1])^q+a3*sin(f3*t[i-1])^p
    y[i] = a4*cos(f4*x[i-1])^q+a5*sin(f5*y[i-1])^p+a6*cos(f6*t[i-1])^q
    t[i] = t[i-1]+v
  }
  
  data.frame(x = x, y = y)
}

a1 <- 1.8
a2 <- 1.1
a3 <- 2.2
a4 <- 0.654
a5 <- 2.3
a6 <- 0.9
f1 <- 1.3
f2 <- 2
f3 <- 1.89
f4 <- 1.3
f5 <- 1.5
f6 <- 1.1
p <- 6
q <- 12
v <- 8.4

df=createTrajectory(1000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("masaru_rachets_202101041615.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# ratchet_attractors_202101041620 ----------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#FFFFFF"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
createTrajectory <- function(n, x0, y0, t0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6) {
  x <- vector(mode = "numeric", length = n)
  y <- vector(mode = "numeric", length = n)
  t <- vector(mode = "numeric", length = n)
  
  x[1] <- x0
  y[1] <- y0
  t[1] <- t0
  for(i in 2:n) {
    x[i] = a1*sin(f1*y[i-1])^p+a2*cos(f2*y[i-1])^q+a3*sin(f3*t[i-1])^p
    y[i] = a4*cos(f4*x[i-1])^q+a5*sin(f5*y[i-1])^p+a6*cos(f6*t[i-1])^q
    t[i] = t[i-1]+v
  }
  
  data.frame(x = x, y = y)
}

a1 <- 1.8
a2 <- 1.1
a3 <- 2.5
a4 <- 0.654
a5 <- 2.3
a6 <- 1.42
f1 <- 1.3
f2 <- 2
f3 <- 1.22
f4 <- 1.3
f5 <- 3.6
f6 <- 1.1
p <- 6
q <- 15
v <- 7.9

df=createTrajectory(750000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("rachet_attractors_202101041620.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# ratchet_attractors_202101041621 ----------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#FFFFFF"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
createTrajectory <- function(n, x0, y0, t0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6) {
  x <- vector(mode = "numeric", length = n)
  y <- vector(mode = "numeric", length = n)
  t <- vector(mode = "numeric", length = n)
  
  x[1] <- x0
  y[1] <- y0
  t[1] <- t0
  for(i in 2:n) {
    x[i] = a1*sin(f1*y[i-1])^p+a2*cos(f2*y[i-1])^q+a3*sin(f3*t[i-1])^p
    y[i] = a4*cos(f4*x[i-1])^q+a5*sin(f5*y[i-1])^p+a6*cos(f6*t[i-1])^q
    t[i] = t[i-1]+v
  }
  
  data.frame(x = x, y = y)
}

a1 <- 1.2
a2 <- 1.85
a3 <- 2.5
a4 <- 0.354
a5 <- 4.2
a6 <- 1.42
f1 <- 1.3
f2 <- 2
f3 <- 0.22
f4 <- 1.3
f5 <- 7.5
f6 <- 1.1
p <- 12
q <- 25
v <- 4.2

df=createTrajectory(800000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("rachet_attractors_202101041621.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# ratchet_attractors_202101041623 ----------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#FFFFFF"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
createTrajectory <- function(n, x0, y0, t0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6) {
  x <- vector(mode = "numeric", length = n)
  y <- vector(mode = "numeric", length = n)
  t <- vector(mode = "numeric", length = n)
  
  x[1] <- x0
  y[1] <- y0
  t[1] <- t0
  for(i in 2:n) {
    x[i] = a1*sin(f1*y[i-1])^p+a2*cos(f2*y[i-1])^q+a3*sin(f3*t[i-1])^p
    y[i] = a4*cos(f4*x[i-1])^q+a5*sin(f5*y[i-1])^p+a6*cos(f6*t[i-1])^q
    t[i] = t[i-1]+v
  }
  
  data.frame(x = x, y = y)
}

a1 <- 1.8
a2 <- -3
a3 <- 2.2
a4 <- 0.454
a5 <- 2.3
a6 <- -0.9
f1 <- 3.76
f2 <- 3.221
f3 <- 0.1
f4 <- 1.598
f5 <- -2.356
f6 <- -1
p <- 9
q <- 14
v <- 3.5

df=createTrajectory(500000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("rachet_attractors_202101041623.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)

# ratchet_attractors_202101041631 ----------------------------------------------

# Define theme
#cream #FAF4E7
#charcoal #1E1E1E
opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#FFFFFF"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

# Prepare data frame
createTrajectory <- function(n, x0, y0, t0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6) {
  x <- vector(mode = "numeric", length = n)
  y <- vector(mode = "numeric", length = n)
  t <- vector(mode = "numeric", length = n)
  
  x[1] <- x0
  y[1] <- y0
  t[1] <- t0
  for(i in 2:n) {
    x[i] = a1*sin(f1*y[i-1])^p+a2*cos(f2*y[i-1])^q+a3*sin(f3*t[i-1])^p
    y[i] = a4*cos(f4*x[i-1])^q+a5*sin(f5*y[i-1])^p+a6*cos(f6*t[i-1])^q
    t[i] = t[i-1]+v
  }
  
  data.frame(x = x, y = y)
}

a1 <- 1.8
a2 <- 1.1
a3 <- 2.2
a4 <- 0.654
a5 <- 2.3
a6 <- -0.9
f1 <- 3.76
f2 <- 3.221
f3 <- 0.1
f4 <- 1.598
f5 <- -2.356
f6 <- -1
p <- 9
q <- 14
v <- 3.5

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("rachet_attractors_202101041631.png",
       device = "png", width = 12, height = 12, units = "in", dpi = 600)