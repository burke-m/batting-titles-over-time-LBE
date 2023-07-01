library(tidyverse)
library(baseballr)

years <- c(1920:2022)
lg_BAs_1920_2022 <- map_df(.x = years, 
                        ~{
                          message(paste0('Grabbing averages for season ', .x, 
                                         ' of 2022'))
                          payload <- mlb_stats(stat_type = 'season',sport_ids = 1, 
                                               stat_group = 'hitting', 
                                               player_pool = "Qualified", 
                                               season = .x)
                          mlb_avg_weighted_BA = sum(as.numeric(payload$avg)*payload$plate_appearances) /
                            sum(payload$plate_appearances)
                          payload_AL <- payload |>
                            filter(league_id == 103)
                          payload_NL <- payload |>
                            filter(league_id == 104)
                          AL_avg_weighted_BA = sum(as.numeric(payload_AL$avg)*payload_AL$plate_appearances) /
                            sum(payload_AL$plate_appearances)
                          NL_avg_weighted_BA = sum(as.numeric(payload_NL$avg)*payload_NL$plate_appearances) /
                            sum(payload_NL$plate_appearances)
                          season = .x
                          df <- data.frame(season, mlb_avg_weighted_BA, 
                                           AL_avg_weighted_BA, NL_avg_weighted_BA)
                          return(df)
                        })
