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

united.states.imf <- (united.states.df$Q84)
chile.imf <- (chile.df$Q84)
mexico.imf <- (mexico.df$Q84)

  
united.states.imf[united.states.imf == 1] <- '0'
united.states.imf[united.states.imf == 2] <- '1'
united.states.imf[united.states.imf == 3] <- '2'
united.states.imf[united.states.imf == 4] <- '3'

fig1 <- ggplot(data = united.states.df) + 
  geom_bar(mapping = aes(x = united.states.imf)) +
  labs(title = "United States", x = "Confidence in IMF")

# Re-labling chile variables 
chile.imf[chile.imf == 1] <- '0'
chile.imf[chile.imf == 2] <- '1'
chile.imf[chile.imf == 3] <- '2'
chile.imf[chile.imf == 4] <- '3'


fig2 <- ggplot(data = chile.df) + 
  geom_bar(mapping = aes(x = chile.imf)) +
  labs(title = "Chile", x = "Confidence in IMF")
fig2

# Re-labling mexico variables 
mexico.imf[mexico.imf == 1] <- '4'
mexico.imf[mexico.imf == 2] <- '3'
mexico.imf[mexico.imf == 3] <- '2'
mexico.imf[mexico.imf == 4] <- '1'

fig3 <- ggplot(data = mexico.df) + 
  geom_bar(mapping = aes(x = mexico.imf)) +
  labs(title = "Mexico", x = "Confidence in IMF")

fig3

cowplot::plot_grid(fig1, fig2, fig3)
