library(tidyverse)

bfi <- read_csv("bfi.csv")

glimpse(bfi)

library(apaTables)
apa.cor.table(bfi)

library(cocor)
cocor(~A1+C1|E1+01, data=as.data.frame(bfi))
# confidence interval r.jk - r.hm 0.0753  0.1800
# Difference: r.jk - r.hm = 
# A1+C1 & E1+01 = nonoverlapping (dep) correlation
# e.g. for above, does C1 predict job performance (A1) better than E1
# e.g., C1+A1|E1+A1, does C1 predict A1 better than E1

bfi_men <- bfi %>% filter(gender==1) %>% select(-gender)
bfi_women <- bfi %>% filter(gender==2) %>% select(-gender)

bfi_men <- as.data.frame(bfi_men)
bfi_women <- as.data.frame(bfi_women)

cocor(~A1+E1|A1+E1, data=list(bfi_men, bfi_women))
# looks at correlation between A1 and E1 for men vs A1 and E1 for women

