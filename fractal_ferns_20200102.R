# Load libraries 

library(mathart)
library(ggart)
library(ggforce)
library(Rcpp)
library(tidyverse)

n <- 250000

params1 <- data.frame(
  a <- c(0, 0.85, 0.2, -0.15),
  b <- c(0, 0.04, -0.26, 0.28),
  c <- c(0, -0.04, 0.23, 0.26),
  d <- c(0.16, 0.85, 0.22, 0.24),
  e <- c(0, 0, 0, 0),
  f <- c(0, 1.6, 1.6, 0.44),
  p <- c(0.01, 0.85, 0.07, 0.07)
)

df1 <- fractal_fern(n = n, a = params1$a, b = params1$b, c_ = params1$c, d = params1$d, e = params1$e,
                    f = params1$f, p = params1$p) %>% mutate(id = 1)

df1 %>%
  mutate(x = x + 0.5,
         y = y - 0.35,
         id = 2) -> df2

p <- ggplot() +
  geom_point(aes(x, y), df2, size = 0.03, alpha = 0.06, color = "#0d49b8") +
  geom_point(aes(x, y), df1, size = 0.03, alpha = 0.06, color = "#f7faff") +
  coord_equal() +
  theme_blankcanvas(margin_cm = 1) +
  theme(plot.background = element_rect(fill = "#00318c", colour = NA))

ggsave("fractal_fern_202101021927.png", bg = "#00318c",
       width = 10, height = 10, units = "cm", dpi = 300)