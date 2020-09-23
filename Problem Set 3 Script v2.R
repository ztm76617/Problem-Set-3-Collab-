# Load Data
load("data/World_Values_Survey_Wave_7_Sample.RData")
view(wvs)
names(wvs)

# Install + load all packages
library(tidyverse)
library(ggplot2)
install.packages("cowplot")
library(cowplot)
library(dplyr)
install.packages("reshape2")
library(reshape2)
<<<<<<< HEAD
=======
# Hey Zach check out line 40 for an example of the sort of pipe-based code we discussed! (JO)


>>>>>>> 8868e254d824b7203c89e57ad7ce901a39a22d21
# Name Countries subsets
united.states.df <- subset(wvs, B_COUNTRY == "840")
chile.df <- subset(wvs, B_COUNTRY == "152")
norway.df <- subset(wvs, B_COUNTRY == "578")
mexico.df <- subset(wvs, B_COUNTRY == "484")
colombia.df <- subset(wvs, B_COUNTRY == "170")
swtizerland.df <- subset(wvs, B_COUNTRY == "756")

# Select columns of interest
mtcars %>% select(mpg,cyl)

wvs %>% select(main.country_number, occ.group, confidence.imf, confidence.banks) %>%
  filter(main.country_number == "840" , occ.group == 1 | occ.group == 8)


# Renaming columns
wvs <- wvs %>% rename('confidence.imf' = Q84)
wvs <- wvs %>% rename('confidence.banks' = Q78)
wvs <- wvs %>% rename('occ.group' = Q281)



# Recoding US variables with pipes + creating ggplots
fig1 <- wvs %>% 
  filter(main.country_number == '840') %>%  # keep USA
  mutate(IMF = case_when(confidence.imf == 1 ~ 4, # recode Q84 as "IMF"
                         confidence.imf == 2 ~ 3,
                         confidence.imf == 3 ~ 2,
                         confidence.imf == 4 ~ 1)) %>% 
  ggplot +
  geom_bar(mapping = aes(x = IMF)) +
  labs(title = "United States", x = "Confidence in IMF", y = "Frequency")  
fig1

fig2 <- wvs %>% 
  filter(B_COUNTRY_ALPHA == 'USA') %>%  # keep USA
  mutate(Banks = case_when(Q78 == 1 ~ 4, # recode Q84 as "Banks"
                           Q78 == 2 ~ 3,
                           Q78 == 3 ~ 2,
                           Q78 == 4 ~ 1)) %>% 
  ggplot +
  geom_bar(mapping = aes(x = Banks)) +
  labs(title = "United States", x = "Confidence in Banks", y = "Frequency")  

fig2


# Recoding Chile variables with pipes + creating ggplots

fig3 <- wvs %>% 
  filter(main.country_number == '152') %>%  
  mutate(IMF = case_when(confidence.imf == 1 ~ 4, 
                         confidence.imf == 2 ~ 3,
                         confidence.imf == 3 ~ 2,
                         confidence.imf == 4 ~ 1)) %>% 
  ggplot +
  geom_bar(mapping = aes(x = IMF)) +
  labs(title = "Chile", x = "Confidence in IMF", y = "Frequency") 

  fig3

  fig4 <- wvs %>% 
    filter(main.country_number == '152') %>%  
    mutate(Banks = case_when(confidence.banks == 1 ~ 4, 
                           confidence.banks == 2 ~ 3,
                           confidence.banks == 3 ~ 2,
                           confidence.banks == 4 ~ 1)) %>% 
    ggplot +
    geom_bar(mapping = aes(x = Banks)) +
    labs(title = "Chile", x = "Confidence in Banks", y = "Frequency") 
  fig4

# Combining US and Chile Bank histograms
comb.hist <- wvs %>%
  select(B_COUNTRY_ALPHA, confidence.banks) %>%
  filter(B_COUNTRY_ALPHA == c("USA", "CHL", "MEX"))
view(comb.hist)



comb.hist_ggplot <- comb.hist %>%
  mutate(Banks = case_when(confidence.banks == 1 ~ 4, 
                           confidence.banks == 2 ~ 3,
                           confidence.banks == 3 ~ 2,
                           confidence.banks == 4 ~ 1)) %>%
  ggplot +
  geom_bar(mapping = aes(x = Banks, fill = B_COUNTRY_ALPHA), position = 'dodge')+
  labs(title = "Comparing Confidence in 'Banks'", x = "Confidence in Banks", y = "Frequency") +
  scale_fill_discrete(name = "Countries")

comb.hist_ggplot


# Full OECDC ggplot
OECD_Countires_Gross_domestic_product_GDP_ <- read_csv("data/OECD Countires Gross domestic product (GDP).csv")
View(OECD_Countires_Gross_domestic_product_GDP_)

oecd.df <- OECD_Countires_Gross_domestic_product_GDP_

full_oecd.fig2019 <- oecd.df %>% 
  select(LOCATION, Value, TIME) %>%
  filter(TIME == "2019") %>%
  mutate(LOCATION = fct_reorder(LOCATION, Value)) %>%
  ggplot + geom_bar(stat = "identity", mapping = aes(x = LOCATION, y = Value)) + ylim(0,120000) +
  labs(title = "Gross Domestic Product (GDP) Per Capita", x = "OECD Countries", y = "USD (Thousands)") + theme_gray() 
  


full_oecd.fig2019

# mexico, usa, chile gdp ggplot

select_oecd.fig2019 <- oecd.df %>% 
  select(LOCATION, Value, TIME) %>%
  filter(TIME == "2019", LOCATION == c("USA","CHL","MEX")) %>%
  mutate(LOCATION = fct_reorder(LOCATION, Value)) %>%
  ggplot + geom_bar(stat = "identity", mapping = aes(x = LOCATION, y = Value)) + ylim(0,120000) + 
  labs(title = "Gross Domestic Product (GDP) Per Capita", x = "OECD Countries", y = "USD (Thousands)") + theme_gray()

select_oecd.fig2019








