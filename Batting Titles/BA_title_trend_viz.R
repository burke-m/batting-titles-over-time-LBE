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
