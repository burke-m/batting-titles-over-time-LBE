library(tidyverse)


BA_titles_simple_nulls <- BA_titles |>
  select(season,value,person_full_name,person_last_name,person_id,team_name,
         league_name, mlb_avg_weighted_BA, AL_avg_weighted_BA, NL_avg_weighted_BA)|>
  mutate(diff_mlb_BA = value-mlb_avg_weighted_BA) |>
  mutate(percent_above_mlb = round((value/mlb_avg_weighted_BA -1)*100, digits = 2))

BA_titles_simple_AL_nulls <- BA_titles_simple_nulls |>
  filter(league_name=='AL')|>
  mutate(diff_AL_BA = value-AL_avg_weighted_BA) |>
  mutate(percent_above_AL = round((value/AL_avg_weighted_BA -1)*100, digits = 2))
BA_titles_simple_NL_nulls <- BA_titles_simple_nulls |>
  filter(league_name=='NL') |>
  mutate(diff_NL_BA = value-NL_avg_weighted_BA) |>
  mutate(percent_above_NL = round((value/NL_avg_weighted_BA -1)*100, digits = 2))

BA_titles_simple_nulls <- BA_titles_simple_nulls |>
  left_join(BA_titles_simple_AL_nulls, 
            by = colnames(BA_titles_simple_AL)[
              which(colnames(BA_titles_simple_AL) %in% 
                      colnames(BA_titles_simple))]) |>
  left_join(BA_titles_simple_NL_nulls, 
            by = colnames(BA_titles_simple_NL)[
              which(colnames(BA_titles_simple_NL) %in% 
                      colnames(BA_titles_simple))])

BA_titles_simple_nulls <- BA_titles_simple_nulls[,c(1:11,13,15,12,14,16)]
