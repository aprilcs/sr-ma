#Finally, subgroup analysis of adverse events related to Ebola vaccine A
OR.adverseevents = metabin (et, nt, ec, nc, studlab = Study, data = eboladata, method = "Inverse", sm = "OR")
print(summary(OR.adverseevents), digits = 2)

#6. Subgroup analysis
analysis2<-update(OR.adverseevents, byvar=Adverse.events, print.byvar=FALSE)
print(summary(analysis2), digits=2)