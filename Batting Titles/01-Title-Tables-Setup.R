library(tidyverse)
library(baseballr)

stats_glossary <- mlb_baseball_stats()

teams <- mlb_teams(sport_ids = 1)

rstudioapi::jobRunScript(path = 'BA_title_loop.R',
                         name = 'BA title loop',
                         exportEnv = 'R_GlobalEnv')
rstudioapi::jobRunScript(path = 'lgAvg_BA_loop.R',
                         name = 'lgAvg BA loop',
                         exportEnv = 'R_GlobalEnv')
BA_titles <- BAs_1920_2022 |>
  group_by(season,league_name) |>
  filter(value==max(value)) |>
  ungroup() |>
  mutate(value = as.double(value)) |>
  left_join(lg_BAs_1920_2022, by = "season")

BA_titles_simple <- BA_titles |>
  select(season,value,person_full_name,person_last_name,person_id,team_name,
         league_name, mlb_avg_weighted_BA, AL_avg_weighted_BA, NL_avg_weighted_BA)|>
  mutate(diff_mlb_BA = value-mlb_avg_weighted_BA) |>
  mutate(percent_above_mlb = round((value/mlb_avg_weighted_BA -1)*100, digits = 2)) |>
  mutate(diff_AL_BA = value-AL_avg_weighted_BA) |>
  mutate(percent_above_AL = round((value/AL_avg_weighted_BA -1)*100, digits = 2)) |>
  mutate(diff_NL_BA = value-NL_avg_weighted_BA) |>
  mutate(percent_above_NL = round((value/NL_avg_weighted_BA -1)*100, digits = 2))
BA_titles_simple <- BA_titles_simple[,c(1:11,13,15,12,14,16)]

BA_titles_simple_AL <- BA_titles_simple |>
  filter(league_name=='AL')
BA_titles_simple_NL <- BA_titles_simple |>
  filter(league_name=='NL')
