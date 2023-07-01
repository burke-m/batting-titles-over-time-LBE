library(baseballr)
library(tidyverse)

years <- c(1920:2022)
BAs_1920_2022 <- map_df(.x = years, 
                              ~{
                                message(paste0('Grabbing leaders for season ', .x, 
                                               ' of 2022'))
                                payload <- 
                                payload <- baseballr::mlb_stats_leaders(
                                  leader_categories = 'battingAverage',
                                  sport_id = 1, season = .x, stat_group = 'hitting')|>
                                  mutate(season = .x)
                                return(payload)
                              })
