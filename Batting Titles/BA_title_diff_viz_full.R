library(tidyverse)

# Requires that Title_tables.R is run first

# Plot of difference in raw value over time of title winners relative to MLB average ----
BA_titles_simple |>
  ggplot(aes(x=season,y=diff_mlb_BA,color=league_name))+
  geom_point() +
  geom_smooth() +
  geom_smooth(aes(color = 'MLB'), show.legend = TRUE) +
  geom_text(aes(label = person_last_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
                     #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="Difference In BA Between MLB Average and BA Title Winners", 
       color = "League",
       title = "MLB Batting Titles Relative to MLB Average 1920-2022",
       subtitle = "Displayed as a Raw Difference",
       caption = "Created by Burke Mayling @idodrums")+
  scale_color_discrete(type = c('red', 'green','blue'))+
  theme_classic()

# Plot of %increase over time of title winners relative to MLB average ----
BA_titles_simple |>
  ggplot(aes(x=season,y=percent_above_mlb))+
  geom_smooth(aes(color=league_name), show.legend = TRUE) +
  geom_smooth(aes(color = 'MLB'), show.legend = TRUE) +
  geom_point(aes(color=league_name)) +
  geom_text(aes(label = person_last_name, color=league_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="Percent Increase In BA Between MLB Average and BA Title Winners", 
       color = "League",
       title = "MLB Batting Titles Relative to League 1920-2022",
       subtitle = "The best hitters in MLB have remained ~25% above MLB Average in the Live Ball Era",
       caption = "Created by Burke Mayling @idodrums") +
  scale_color_discrete(type = c('red', 'green','blue'))+
  theme_classic()

# Plot of difference in raw value over time of AL title winners relative to AL average ----
BA_titles_simple_AL |>
  ggplot(aes(x=season,y=diff_AL_BA))+
  geom_smooth(aes(color='AL_avg')) +
  geom_smooth(aes(color = 'MLB_avg', y=diff_mlb_BA), show.legend = TRUE) +
  geom_smooth(aes(color = 'NL_avg', y=diff_NL_BA), show.legend = TRUE) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="Difference In BA Between AL Average and BA Title Winners", 
       color = "League",
       title = "AL Batting Titles Relative to League 1920-2022",
       subtitle = "Displayed as a Raw Difference",
       caption = "Created by Burke Mayling @idodrums"
  )+
  scale_color_discrete(type = c('black','green', 'blue'))+
  theme_classic()

# Plot of difference in raw value over time of NL title winners relative to NL average ----
BA_titles_simple_NL |>
  ggplot(aes(x=season,y=diff_NL_BA*1000))+
  geom_smooth(aes(color = 'Value Over NL_avg')) +
  geom_smooth(aes(color = 'Value Over MLB_avg', y=diff_mlb_BA*1000), show.legend = TRUE) +
  geom_smooth(aes(color = 'Value Over AL_avg', y=diff_AL_BA*1000), show.legend = TRUE) +
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  
  labs(x="Season", 
       y="Number of BA points Above NL Average", 
       color = "League",
       title = "NL Batting Titles Relative to Leagues 1920-2022",
       subtitle = "Displayed as a Raw Difference x 1000",
       caption = "Created by Burke Mayling @idodrums"
  )+
  scale_color_discrete(type = c('red','green','black'))+
  theme_classic()

# Plot of %increase over time of AL title winners relative to AL average ----
BA_titles_simple_AL |>
  ggplot(aes(x=season,y=percent_above_AL))+
  geom_smooth(aes(color='AL_avg'), show.legend = TRUE) +
  geom_smooth(aes(color = 'MLB_avg', y=percent_above_mlb), show.legend = TRUE) +
  geom_smooth(aes(color = 'NL_avg', y=percent_above_NL), show.legend = TRUE)+
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="Percent Increase In BA Between AL Average and BA Title Winner", 
       color = "League",
       title = "AL Batting Titles Relative to League 1920-2022",
       subtitle = "The best hitters in the AL have remained ~25% above MLB Average in most of the Live Ball Era",
       caption = "Created by Burke Mayling @idodrums") +
  scale_color_discrete(type = c('black','green', 'blue'))+
  theme_classic()

# Plot of %increase over time of NL title winners relative to NL average ----
BA_titles_simple_NL |>
  ggplot(aes(x=season,y=percent_above_NL))+
  geom_smooth(aes(color='NL_avg'), show.legend = TRUE) +
  geom_smooth(aes(color = 'MLB_avg', y=percent_above_mlb), show.legend = TRUE) +
  geom_smooth(aes(color = 'AL_avg', y=percent_above_AL), show.legend = TRUE)+
  geom_point() +
  geom_text(aes(label = person_last_name), size = 3.2) +
  # scale_y_continuous(limits = c(.301,.430), labels = seq(0.300,0.430,0.015),
  #breaks = seq(0.300,0.430,0.015)) +
  scale_x_continuous(limits = c(1920,2022), breaks = seq(1920,2022,17)) +
  labs(x="Season", 
       y="Percent Increase In BA Between NL Average and BA Title Winner", 
       color = "League",
       title = "NL Batting Titles Relative to League 1920-2022",
       subtitle = "The best hitters in the NL have remained ~25% above MLB Average in most of the Live Ball Era",
       caption = "Created by Burke Mayling @idodrums") +
  scale_color_discrete(type = c('red','green', 'black'))+
  theme_classic()
