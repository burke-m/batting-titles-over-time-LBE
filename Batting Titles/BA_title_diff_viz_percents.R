library(tidyverse)


# Requires that 01-Title-Tables-Setup.R is run first

# Plot of %increase over time of title winners relative to MLB average ----
BA_titles_simple |>
  ggplot(aes(x=season,y=percent_above_mlb))+
  geom_smooth(aes(color=league_name), show.legend = TRUE) +
  geom_point(aes(color=league_name)) +
  geom_text(aes(label = person_last_name, color=league_name), size = 2.5, 
            nudge_y = -.75) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="% Above MLB Average BA", 
       color = "League",
       title = "MLB Batting Titles Relative to League 1920-2022",
       subtitle = "The best hitters in MLB have remained ~25% above MLB Average in the Live Ball Era",
       caption = "Created by Burke Mayling @idodrums") +
  scale_color_discrete(type = c('red','blue'))+
  theme_classic()

# Plot of %increase over time of AL title winners relative to AL average ----
BA_titles_simple_AL |>
  ggplot(aes(x=season,y=percent_above_AL))+
  geom_smooth(aes(color = 'MLB', y=percent_above_mlb), show.legend = TRUE) +
  geom_smooth(aes(color = 'NL', y=percent_above_NL), show.legend = TRUE)+
  geom_smooth(aes(color='AL'), show.legend = TRUE) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3, nudge_y = -.5) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="% Above AL Average BA", 
       color = "% Above Lg Avg",
       title = "AL Batting Titles Relative to League 1920-2022",
       caption = "Created by Burke Mayling @idodrums",
       subtitle = "The best hitters in the AL have generally reached higher peaks relative to their peers than those of the NL") +
  scale_color_discrete(type = c('red','green', 'blue'))+
  theme_classic()

# Plot of %increase over time of NL title winners relative to NL average ----
BA_titles_simple_NL |>
  ggplot(aes(x=season,y=percent_above_NL))+
  geom_smooth(aes(color = 'MLB', y=percent_above_mlb), show.legend = TRUE) +
  geom_smooth(aes(color = 'AL', y=percent_above_AL), show.legend = TRUE)+
  geom_smooth(aes(color='NL'), show.legend = TRUE) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3, nudge_y = -.5) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="% Above NL Avg BA", 
       color = "% Above Lg Avg",
       title = "NL Batting Titles Relative to League 1920-2022",
       subtitle = "The best hitters in the NL have remained ~25% above NL Lg Avg in most of the Live Ball Era",
       caption = "Created by Burke Mayling @idodrums") +
  scale_color_discrete(type = c('red','green', 'blue'))+
  theme_classic()
