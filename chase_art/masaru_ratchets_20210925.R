# Load libraries ---------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(purrr)
library(here)

# masaru_ratchets_202109251429 -------------------------------------------------

# Define theme
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

a1 <- 0.39
a2 <- 0.7
a3 <- 1.42
a4 <- 0.95
a5 <- 3.69
a6 <- 3.6
f1 <- 2.7
f2 <- 4.4
f3 <- 8.52
f4 <- 1.7
f5 <- 5.6
f6 <- 3.7
p <- 6 # changing this from 6 seems to be tricky / unwise!
q <- 15 # changing this from 15 seems to be tricky / unwise!
v <- 8.2

df=createTrajectory(500000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave(here("chase_art/everything/masaru_rachets_202109251429a.png"),
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

# masaru_ratchets_202109251429 -------------------------------------------------

# Define theme
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

a1 <- 0.39
a2 <- 0.7
a3 <- 1.42
a4 <- 0.95
a5 <- 3.69
a6 <- 3.6
f1 <- 2.7
f2 <- 4.4
f3 <- 8.52
f4 <- 1.7
f5 <- 5.6
f6 <- 3.7
p <- 6 # changing this from 6 seems to be tricky / unwise!
q <- 15 # changing this from 15 seems to be tricky / unwise!
v <- 8.2

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave(here("chase_art/everything/masaru_rachets_202109251429b.png"),
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

# masaru_ratchets_202109251444 -------------------------------------------------

# Define theme
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

a1 <- 0.39
a2 <- 1.2
a3 <- 0.82
a4 <- 0.95
a5 <- 3.69
a6 <- 3.6
f1 <- 1.7
f2 <- 4.4
f3 <- 8.52
f4 <- 0.9
f5 <- 7.6
f6 <- 3.7
p <- 6 # changing this from 6 seems to be tricky / unwise!
q <- 15 # changing this from 15 seems to be tricky / unwise!
v <- 8.2

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave(here("chase_art/everything/masaru_rachets_202109251444.png"),
       device = "png", width = 12, height = 8, units = "in", dpi = 600)