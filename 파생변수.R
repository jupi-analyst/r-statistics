# 파생 변수
install.packages('hflights')
library(hflights)
library(tidyverse)

colnames(hflights)
hflights_df <- tbl_df(hflights)
hflights_df

aa <- mutate(hflights_df, gain = ArrDelay - DepDelay)
aa
