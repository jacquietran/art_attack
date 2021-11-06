# Load libraries ---------------------------------------------------------------

library(here)
library(av)
library(dplyr)
library(ggplot2)

# Read sound data into R -------------------------------------------------------

# URL: https://www.youtube.com/watch?v=kj1CDekK-54

av_audio_convert(
  here("acoustic_analysis/source_sounds/megan_washington_80_miles.mp4"),
  here("acoustic_analysis/source_sounds/megan_washington_80_miles.wav"), channels = 1)

meg <- here("acoustic_analysis/source_sounds/megan_washington_80_miles.wav")

# Spectral analysis ------------------------------------------------------------

fft_data <- read_audio_fft(meg, start_time = 70.0, end_time = 72.0)
# dim(fft_data)
#> [1] 512 860

# Plot the spectrogram
# plot(fft_data)

# Data tidying -----------------------------------------------------------------

# Convert fft_data from matrix to data frame
temp <- as.data.frame(as.table(fft_data))
temp2 <- as.data.frame(cbind(temp, time = attr(fft_data, "time")))
temp2 %>%
  select(time, Freq) %>%
  rename(freq = Freq) %>%
  filter(freq != 1) -> fft_df

# Plot -------------------------------------------------------------------------

ggplot(fft_df, aes(x = time, y = freq, colour = freq)) +
  geom_point(alpha = 0.8, shape = 46) +
  theme_void() +
  theme(
    legend.position = "none",
    plot.background = element_rect(fill = "#FFFFFF"))

ggsave(
  here("acoustic_analysis/everything/megan_washington_80_miles_20210912.png"),
  last_plot(), width = 8, height = 8, units = "in", dpi = 600)