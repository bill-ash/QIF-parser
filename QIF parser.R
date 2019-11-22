library(tidyverse)
out <- read.delim("Downloads/stmt.qfx")
grep(pattern = "<BANKTRANLIST>", x = out)
grepl("<BANKTRANLIST>", out)

zz <- out[44:127,] 
  
p <- map(zz, ~ gsub("<[^>]+>", "", x = zz, perl = TRUE), .id = "id")[[1]]

p %>% 
  matrix(ncol = 7, byrow = TRUE) %>% 
  as_tibble() %>% 
  select(-1, -3, -7, -5)
  