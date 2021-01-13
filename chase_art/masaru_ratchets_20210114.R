# Load libraries ---------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(purrr)

# masaru_ratchets_202101141005 -------------------------------------------------

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
f1 <- 1.1
f2 <- 2
f3 <- 1.89
f4 <- 1.3
f5 <- 1.8
f6 <- 1.1
p <- 6
q <- 15
v <- 8.4

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("masaru_rachets_202101141005.png",
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

# masaru_ratchets_202101141014 -------------------------------------------------

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
a2 <- 0.9
a3 <- 2.2
a4 <- 0.73
a5 <- 2.3
a6 <- 0.9
f1 <- 1.1
f2 <- 2
f3 <- 1.89
f4 <- 1.3
f5 <- 1.8
f6 <- 1.1
p <- 6
q <- 15
v <- 8

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("masaru_rachets_202101141014.png",
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

# masaru_ratchets_202101141031 -------------------------------------------------

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
a2 <- 0.9
a3 <- 2.2
a4 <- 0.73
a5 <- 2.3
a6 <- 0.9
f1 <- 1.1
f2 <- 2
f3 <- 2.1
f4 <- 1.3
f5 <- 1.8
f6 <- 1.1
p <- 6 # changing this from 6 seems to be tricky / unwise!
q <- 15 # changing this from 15 seems to be tricky / unwise!
v <- 8.2

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("masaru_rachets_202101141031.png",
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

# masaru_ratchets_202101141039 -------------------------------------------------

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
a2 <- 0.7
a3 <- 2.65
a4 <- 0.852
a5 <- 2.3
a6 <- 0.9
f1 <- 0.7
f2 <- 2.1
f3 <- 2.3
f4 <- 1.3
f5 <- 1.8
f6 <- 1.4
p <- 6 # changing this from 6 seems to be tricky / unwise!
q <- 15 # changing this from 15 seems to be tricky / unwise!
v <- 8.2

df=createTrajectory(5000000, 0, 0, 0, p, q, a1, a2, a3, a4, a5, a6, f1, f2, f3, f4, f5, f6)

# Build plot
ggplot(df, aes(x, y)) + geom_point(color="#1E1E1E", shape=46, alpha=.03) + opt

# Export to PNG
ggsave("masaru_rachets_202101141039.png",
       device = "png", width = 12, height = 8, units = "in", dpi = 600)

beepr::beep("treasure")