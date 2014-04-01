library(ProjectTemplate)
load.project()

# Lowest-highest fractions of the landscape -------------------------------

rankr.abf.pe.w <- rank_raster(abf.pe.w)
rankr.msnfi.abf.pe.w <- rank_raster(msnfi.abf.pe.w)

# Get the highest 10% of the landscape for 03_ranks_abf_pe_w
bin.rankr.abf.pe.w.top20 <- rankr.abf.pe.w >= 0.8
bin.rankr.abf.pe.w.topXX <- (rankr.abf.pe.w >= 0.8 & rankr.abf.pe.w <= 0.9)
# Get the lowest 10% of the landscape for 03_ranks_abf_pe_w
bin.rankr.msnfi.abf.pe.w.low20 <- rankr.msnfi.abf.pe.w <= 0.2

# Calculate the intersection of the two rasters, this is given by adding 
# the binary rasters together -> 2 indicates intersection
combination <- bin.rankr.abf.pe.w.top20 + bin.rankr.msnfi.abf.pe.w.low20
intersection <- combination == 2

# Union is all the area covered by the both rasters
union <- combination >= 1

jaccard.index <- (cellStats(intersection, "sum") / cellStats(union, "sum"))

