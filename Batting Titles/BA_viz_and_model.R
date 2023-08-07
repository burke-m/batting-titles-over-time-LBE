library(tidyverse)

BA_titles_simple |>
  ggplot(aes(x=season,y=value,color=league_name))+
  geom_point() +
  scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
                     breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  geom_smooth() +
  geom_smooth(aes(color = 'MLB'), show.legend = TRUE) +
  geom_text(aes(label = person_last_name), size = 3, nudge_y = -.003) +
  labs(x="Season", y="BA", color = "League", 
       caption = "Created by Burke Mayling @idodrums",
       title = "MLB Batting Titles 1920-2022",
       subtitle = "The best BAs in baseball have decreased for most of the Live Ball Era")+
  scale_color_discrete(type = c('red','black', 'blue'))+
  theme_classic()

model <- glm(BA_titles_simple$value ~BA_titles_simple$season)
model_AL <- glm(BA_titles_simple_AL$value ~BA_titles_simple_AL$season)
model_NL <- glm(BA_titles_simple_NL$value ~BA_titles_simple_NL$season)

BA_titles_NL_pred <- BA_titles_simple_NL |>
  summarise(season, person_full_name, predicted_avg_NL = model_NL$fitted.values)

BA_titles_AL_pred <- BA_titles_simple_AL |>
  summarise(season, person_full_name, predicted_avg_AL = model_AL$fitted.values)

BA_titles_plus_models <- BA_titles_simple |>
  mutate(predicted_avg_ovr = model$fitted.values) |>
  left_join(BA_titles_NL_pred, by = c('season', 'person_full_name')) |>
  left_join(BA_titles_AL_pred, by = c('season','person_full_name'))

BA_titles_plus_models |>
  ggplot(aes(x=season, color = league_name)) +
  geom_point(aes(y=value, color = league_name) ) +
  geom_line(aes(y=predicted_avg_ovr),color='purple', size=1) +
  geom_line(aes(y=predicted_avg_NL), size = 1) +
  geom_line(aes(y=predicted_avg_AL), size = 1) +
  theme_minimal() +
  labs(title = "MLB Batting Titles vs Expected",
       subtitle = "Data from 1920-2022",
       xlab = "Season",
       ylab = "Avg",
       color = 'League') +
  geom_text(aes(y=value, label = person_last_name), size = 3.3) +
  scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
                     breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  theme_minimal()
