library(tidyverse)

# Requires that 01-Title-Tables-Setup.R is run first

# Plot of difference in raw value over time of title winners relative to MLB average ----
BA_titles_simple |>
  ggplot(aes(x=season,y=diff_mlb_BA*1000,color=league_name))+
  geom_point() +
  geom_smooth() +
  geom_text(aes(label = person_last_name), size = 3, nudge_y = -1.5) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="BA Points Above MLB Avg", 
       color = "League",
       title = "MLB Batting Titles Relative to MLB Average 1920-2022",
       subtitle = "Displayed as a Raw Difference x 1000",
       caption = "Created by Burke Mayling @idodrums")+
  scale_color_discrete(type = c('red','blue'))+
  theme_classic()

# Plot of difference in raw value over time of AL title winners relative to AL average ----
BA_titles_simple_AL |>
  ggplot(aes(x=season,y=diff_AL_BA*1000))+
  geom_smooth(aes(color = 'NL', y=diff_NL_BA*1000), show.legend = TRUE) +
  geom_smooth(aes(color = 'MLB', y=diff_mlb_BA*1000), show.legend = TRUE) +
  geom_smooth(aes(color='AL')) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2, nudge_y = -1.5) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="BA Points Above AL Avg", 
       color = "Points Above Lg Avg",
       title = "AL Batting Titles Relative to Leagues 1920-2022",
       subtitle = "Displayed as a Raw Difference x 1000",
       caption = "Created by Burke Mayling @idodrums"
  )+
  scale_color_discrete(type = c('red','green', 'blue'))+
  theme_classic()

# Plot of difference in raw value over time of NL title winners relative to NL average ----
BA_titles_simple_NL |>
  ggplot(aes(x=season,y=diff_NL_BA*1000))+  
  geom_smooth(aes(color = 'AL', y=diff_AL_BA*1000), show.legend = TRUE) +
  geom_smooth(aes(color = 'MLB', y=diff_mlb_BA*1000), show.legend = TRUE) +
  geom_smooth(aes(color = 'NL')) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2, nudge_y = -1.5) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  
  labs(x="Season", 
       y="BA points Above NL Avg", 
       color = "Points Above Lg Avg",
       title = "NL Batting Titles Relative to Leagues 1920-2022",
       subtitle = "Displayed as a Raw Difference x 1000",
       caption = "Created by Burke Mayling @idodrums"
  )+
  scale_color_discrete(type = c('red','green','blue'))+
  theme_classic()
