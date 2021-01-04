# From: https://www.williamrchase.com/post/disintegration-12-months-of-art-october/

# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(EnvStats)
library(zoo)

# Load dust functions ----------------------------------------------------------

rtnorm <- function(n, mean = 0, sd = 1, min = 0, max = 1) {
  bounds <- pnorm(c(min, max), mean, sd)
  u <- runif(n, bounds[1], bounds[2])
  qnorm(u, mean, sd)
}

#draw a circle
circle <- function(points = 10000, r = 30) {
  tibble(angle = seq(0, 2*pi, length.out = points), x = r*cos(angle), y = r*sin(angle)) %>%
    mutate(id = 1:nrow(.)) %>%
    select(id, x, y)
}

#generate a seed for circles with splits
gen_seed_cir <- function(n_grains = 10000, r = 30, wind_angle = 0, split_mod = 200, inertia_prob1 = 1, inertia_prob2 = 1) {
  if((wind_angle >= 45 & wind_angle <= 135) | (wind_angle >= 225 & wind_angle < 315)) {
    sand <- circle(n_grains, r) %>%
      arrange(desc(x)) %>%
      mutate(id = 1:nrow(.))
  } else {
    sand <- circle(n_grains, r) %>%
      arrange(y) %>%
      mutate(id = 1:nrow(.))
  }
  
  splits <- sand %>% sample_n(nrow(.) / split_mod)
  
  sand_split <- 
    sand %>%
    left_join(splits, by = "id") %>%
    mutate(split = ifelse(is.na(x.y), NA, id))
  
  sand_split$split[1] <- 0
  split2 <- na.locf(sand_split$split)
  
  sand_split %>%
    mutate(split = split2, group_split = split2) %>%
    select(id, x = x.x, y = y.x, split, group_split) %>%
    group_by(group_split) %>%
    group_map( ~ mutate(., inertia2 = sample(c(NA, 0), 1, prob = c(inertia_prob1, inertia_prob2)))) %>%
    map( ~ mutate(., id = 1:nrow(.))) %>%
    map( ~ mutate(., diff = id - nrow(.) / 2)) %>%
    bind_rows(.id = "group_id")
}

#split the edges and add inertia + diff values
splitter2 <- function(data, seed, wind_angle = 0, inertia_mean = 1, inertia_sd = 5, inertia_min = 1, inertia_max = 100) {
  if((wind_angle >= 45 & wind_angle <= 135) | (wind_angle >= 225 & wind_angle < 315)) {
    data %>%
      mutate(split = seed$split, inertia2 = seed$inertia2) %>%
      select(id, x, y, split, inertia2) %>%
      group_by(split) %>%
      arrange(desc(x)) %>%
      group_map( ~ mutate(., id = 1:nrow(.))) %>%
      map( ~ mutate(., diff = id - nrow(.) / 2)) %>%
      bind_rows(.id = "group_id") %>%
      mutate(inertia = ifelse(is.na(inertia2), rtnorm(nrow(.), mean = 1, sd = 5, min = 1, max = 100), inertia2)) %>%
      ungroup() 
  } else {
    data %>%
      mutate(split = seed$split, inertia2 = seed$inertia2) %>%
      select(id, x, y, split, inertia2) %>%
      group_by(split) %>%
      arrange(y) %>%
      group_map( ~ mutate(., id = 1:nrow(.))) %>%
      map( ~ mutate(., diff = id - nrow(.) / 2)) %>%
      bind_rows(.id = "group_id") %>%
      mutate(inertia = ifelse(is.na(inertia2), rtnorm(nrow(.), mean = 1, sd = 5, min = 1, max = 100), inertia2)) %>%
      ungroup() 
  }
}

#fray the edges of the shape
fray <- function(data, min_fray = 20, max_fray = 100, num_fray = 3) {
  frayer <- function(dat, start, end) { 
    dat %>%
      filter(inertia != 0) %>%
      mutate(group_id2 = group_id) %>%
      group_by(group_id2) %>%
      group_map( ~ filter(., id %in% start:end | id %in% (max(id)-start):(max(id)-end))) %>%
      bind_rows() %>%
      ungroup() %>%
      mutate(inertia2 = sample(c(0, 1), nrow(.), replace = TRUE, prob = c(1, 1)),
             inertia = ifelse(inertia2 == 0, 0, inertia))
  }
  
  fray_params <- list()
  for(i in 1:num_fray) {
    fray_params$start[[i]] <- ifelse(length(fray_params) == 0, 1, fray_params$end[[i - 1]])
    fray_params$end[[i]] <- sample(min_fray:max_fray, 1)
  }
  
  frayed <- list()
  for(i in 1:num_fray) {
    frayed[[i]] <- frayer(data, start = fray_params$start[[i]], end = fray_params$end[[i]])
  }
  
  frayed <- bind_rows(frayed)
  
  full_join(data, frayed, by = c("group_id", "id")) %>%
    mutate(inertia = ifelse(is.na(inertia.y), inertia.x, inertia.y)) %>%
    select(group_id, id, x = x.x, y = y.x, inertia, diff = diff.x)
  
}

#move points according to force, inertia, jitter, etc
gust <- function(data, angle = 0, force = 100, diff_mod = 100, inertia_mod = 50, jitter_min = 0.1, jitter_max = 1, jitter_mod = 1) {
  a <- angle * pi / 180
  perp <- ifelse((((angle >= 315 & angle <= 360) | (angle >= 0 & angle <= 45)) | (angle >= 45 & angle <= 135)), a + ((3 * pi) / 2), a + (pi / 2))
  
  data_jittered <- 
    data %>%
    mutate(jitter = rtnorm(nrow(.), mean = 0, sd = 2, min = -10, max = 15) * jitter_mod) 
  
  
  pts_new <- 
    data_jittered %>%
    mutate(x = ifelse(inertia == 0, x + cos(a)*force, (x + (cos(a) * (force * inertia))) + 
                        (cos(perp) * ((diff * diff_mod)  * (inertia * inertia_mod) * sample(seq(jitter_min, jitter_max, 0.01), 1))) +
                        (cos(perp) * jitter)),
           y = ifelse(inertia == 0, y + sin(a)*force, (y + (sin(a) * (force * inertia))) + 
                        (sin(perp) * ((diff * diff_mod) * (inertia * inertia_mod) * sample(seq(jitter_min, jitter_max, 0.01), 1))) +
                        (sin(perp) * jitter)))
  
  return(pts_new)
}

# Create data ------------------------------------------------------------------

#generate a seed for our circle with 50000 points and a radius of 50
#the `split_mod` parameter controls how many gaps the circle will have, a higher split_mod gives fewer splits
circle_seed <- gen_seed_cir(n_grains = 100000, wind_angle = 270, r = 50, split_mod = 2500)

#generate a list of 5 circles, each one slightly larger than the previous
circles <- list(a = circle(100000, r = 50),
                b = circle(100000, r = 50.25),
                c = circle(100000, r = 50.5),
                d = circle(100000, r = 50.75),
                e = circle(100000, r = 51)
)

#split circles and fray the edges
circle1 <- 
  circles %>%
  map( ~ splitter2(., seed = circle_seed, wind_angle = 270)) %>%
  map_dfr( ~ fray(., min_fray = 100, max_fray = 200, num_fray = 5))

#scatter points according to force and angle
#diff_mod, inertia_mod, and jitter_mod control the shape and look of the points scatter
circle_dust <- gust(circle1, angle = 270, force = 4, diff_mod = 0.006, inertia_mod = 0.0009, jitter_min = 2, jitter_max = 20, jitter_mod = 0.4)

# Build plot -------------------------------------------------------------------

#plot the points with a low alpha and size
ggplot(circle_dust) +
  geom_point(aes(x = x, y = y), alpha = 0.04, size = 0.1, color = "#1e1e1e", shape = 46) +
  scale_color_identity() +  
  theme_void() +
  coord_equal()

#ggsave("circle_1.png", height = 10, width = 10)