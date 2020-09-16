# Load Data
load("data/World_Values_Survey_Wave_7_Sample.RData")
names(wvs)

# Install + load all packages
install.packages("tidyverse")
library(tidyverse)

install.packages("ggplot2")
library(ggplot2)

install.packages("cowplot")
library(cowplot)



# Name Countries subsets
united.states.df <- subset(wvs, B_COUNTRY == "840")
chile.df <- subset(wvs, B_COUNTRY == "152")
norway.df <- subset(wvs, B_COUNTRY == "578")
mexico.df <- subset(wvs, B_COUNTRY == "484")
colombia.df <- subset(wvs, B_COUNTRY == "170")
swtizerland.df <- subset(wvs, B_COUNTRY == "756")


# Test of Q50 data
ggplot(data = united.states.data) + geom_bar(mapping = aes(x=Q50))
ggplot(data = united.states.df) +
  geom_bar(mapping = aes(x=Q270))

ggplot(data = chile.df) +
  geom_bar(mapping = aes(x=Q270))

# US IMF confidence
united.states.imf <- (united.states.df$Q84)

# Renaming US IMF variables
united.states.imf[united.states.imf == 1] <- '4'
united.states.imf[united.states.imf == 2] <- '3'
united.states.imf[united.states.imf == 3] <- '2'
united.states.imf[united.states.imf == 4] <- '1'

fig1 <- ggplot(data = united.states.df) + 
  geom_bar(mapping = aes(x = united.states.imf)) +
  labs(title = "United States", x = "Confidence in IMF", y = "Frequency")
fig1

# Chile IMF confidence
chile.imf <- (chile.df$Q84)

# Re-labling chile IMF variables 
chile.imf[chile.imf == 1] <- '4'
chile.imf[chile.imf == 2] <- '3'
chile.imf[chile.imf == 3] <- '2'
chile.imf[chile.imf == 4] <- '1'


fig2 <- ggplot(data = chile.df) + 
  geom_bar(mapping = aes(x = chile.imf)) +
  labs(title = "Chile", x = "Confidence in IMF", y = "Frequency")
fig2

# Mexico IMF confideence
mexico.imf <- (mexico.df$Q84)

# Re-labling mexico variables 
mexico.imf[mexico.imf == 1] <- '4'
mexico.imf[mexico.imf == 2] <- '3'
mexico.imf[mexico.imf == 3] <- '2'
mexico.imf[mexico.imf == 4] <- '1'

fig3 <- ggplot(data = mexico.df) + 
  geom_bar(mapping = aes(x = mexico.imf)) +
  labs(title = "Mexico", x = "Confidence in IMF", y = "Frequency") 

fig3

cowplot::plot_grid(fig1, fig2, fig3)

# US confidence in banks
united.states.banks <- (united.states.df$Q78)

# Renaming US bank variables
united.states.banks[united.states.banks == 1] <- '4'
united.states.banks[united.states.banks == 2] <- '3'
united.states.banks[united.states.banks == 3] <- '2'
united.states.banks[united.states.banks == 4] <- '1'

# US bank ggplot
fig4 <- ggplot(data = united.states.df) + 
  geom_bar(mapping = aes(x = united.states.banks)) +
  labs(title = "United States", x = "Confidence in Banks", y = "Frequency")
fig4

# Chile confidence in banks
chile.banks <- (chile.df$Q78)

# Renaming Chile bank variables
chile.banks[chile.banks == 1] <- '4'
chile.banks[chile.banks == 2] <- '3'
chile.banks[chile.banks == 3] <- '2'
chile.banks[chile.banks == 4] <- '1'

# Chile bank ggplot
fig5 <- ggplot(data = chile.df) + 
  geom_bar(mapping = aes(x = chile.banks)) +
  labs(title = "Chile", x = "Confidence in Banks", y = "Frequency")
fig5


# Mexico bank confidence
mexico.banks <- (mexico.df$Q78)

# Mexico renamed bank variables
mexico.banks[mexico.banks == 1] <- '4'
mexico.banks[mexico.banks == 2] <- '3'
mexico.banks[mexico.banks == 3] <- '2'
mexico.banks[mexico.banks == 4] <- '1'

# Mexico bank ggplot
fig6 <- ggplot(data = mexico.df) + 
  geom_bar(mapping = aes(x = mexico.banks)) +
  labs(title = "Mexico", x = "Confidence in Banks", y = "Frequency") 
fig6


cowplot::plot_grid(fig4, fig5, fig6)


