#Meta-analysis of Ebola vaccine safety

#1. Load meta package
library(meta)
# library(osfr) if you are syncing with OSF

#2. Load the data in Excel (note, naming the data is free, vaccinesafety.dat. You should not use "space" in R for the name)
eboladata <- read.csv("/cloud/project/ebola-data.csv")
head(eboladata)

#Since many adverse events reported, we can do meta analysis to evaluate the odd of adverse event (each of them) and subgroup analysis
#First, do meta analysis of adverse event arthralgia by applying below codes

#3. Load only arthralgia data
arthralgia<-eboladata[1:6,] #vaccinesafety.dat[1:6,] means load row 1 to 6, all columns
arthralgia

#4. Meta analysis of adverse events arthralgia (to learn about the code more, please check the guideline of meta package in the link provided at manuscript)
OR.arthralgia = metabin (et, nt, ec, nc, studlab = Study, data = arthralgia.dat, method = "Inverse", sm = "OR")
print(summary(OR.arthralgia), digits = 2)
forest(OR.arthralgia, comb.fixed = FALSE,lab.e="Vaccine A", lab.c="Placebo", xlab="Odds of arthralgia", col.square = "green", col.diamond = "blue", print.Q = TRUE, print.pval.Q = TRUE)
funnel(OR.arthralgia)
metabias(k.min=6, OR.arthralgia)

#5. The meta analysis above for arthralgia should be repeated for each of the adverse events. Start from loading the data of only specific adverse events desired (from step 3)
