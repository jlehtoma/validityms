library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the plot labels
spp.labels <- c("1"="Birch", "2"="Spruce", "3"="OtherDec", "4"="Pine")
fert.labels <- c("1"="Herb-rich", "2"="Herb-rich-like", "3"="Mesic", 
                 "4"="Semi-xeric", "5"="Xeric")
con.fert.labels <- c("1"="Herb-rich-con", "2"="Herb-rich-like-con", 
                     "3"="Mesic-con", "4"="Semi-xeric-con", "5"="Xeric-con",
                     "6"="Herb-rich", "7"="Herb-rich-like", "8"="Mesic", 
                     "9"="Semi-xeric", "10"="Xeric")

# Calculate new grouping based on soil fertility
groups(abf.pe.w) <- rep(1:5, 4)
groupnames(abf.pe.w) <- fert.labels

groups(msnfi.abf.pe.w) <- rep(1:5, 4)
groupnames(msnfi.abf.pe.w) <- fert.labels

groups(loaded.abf.pe.w) <- rep(1:5, 4)
groupnames(loaded.abf.pe.w) <- fert.labels

# When assigning new groups to the connectivity transformed variant, remember
# that the feature stack is duplicated: 1st for connectivity transformations, 
# 2nd time for local quality. Labels need to be reconstructed as well.
groups(abf.pe.w.cmat) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(abf.pe.w.cmat) <- con.fert.labels

# Performance curves by soil fertility --------------------------------------

# Detailed data

grpcur.abf.pe.w <- curves(abf.pe.w, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.abf.pe.w.cmat <- curves(abf.pe.w.cmat, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.abf.pe.w.cmat <- grpcur.abf.pe.w.cmat[,-grep("-con$", names(grpcur.abf.pe.w.cmat))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.abf.pe.w.cmat <- new("ZGroupCurvesDataFrame", 
                                  nocon.grpcur.abf.pe.w.cmat)

# MSNFI-classes data

grpcur.msnfi.abf.pe.w <- curves(msnfi.abf.pe.w, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.msnfi.abf.pe.w.cmat <- curves(msnfi.abf.pe.w.cmat, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.msnfi.abf.pe.w.cmat <- grpcur.msnfi.abf.pe.w.cmat[,-grep("-con$", names(grpcur.msnfi.abf.pe.w.cmat))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.msnfi.abf.pe.w.cmat <- new("ZGroupCurvesDataFrame", 
                                        nocon.grpcur.msnfi.abf.pe.w.cmat)

# MSNFI data

# No groups used/available
cur.nosfc.msnfi.abf.pe.w <- curves(nosfc.msnfi.abf.pe.w)
cur.nosfc.msnfi.abf.pe.w.cmat <- curves(nosfc.msnfi.abf.pe.w.cmat)

# Pre-loaded

grpcur.loaded.abf.pe.w <- curves(loaded.abf.pe.w, groups=TRUE)

# Plotting ----------------------------------------------------------------

p1 <- plot(grpcur.abf.pe.w, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p1 <- p1 + ggtitle("Detailed data abf_pe_w by soil fertility class")

p1B <- plot(grpcur.loaded.abf.pe.w, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p1B <- p1B + ggtitle("Pre-loaded data abf_pe_w by soil fertility class")

p2 <- plot(nocon.grpcur.abf.pe.w.cmat, monochrome=FALSE, min=FALSE, mean=FALSE, 
           max=FALSE, invert.x=TRUE)
p2 <- p2 + ylim(0, 1) + 
  ggtitle("Detailed data abf_pe_w_cmat by soil fertility class (local quality)")

p3 <- plot(grpcur.abf.pe.w, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p3 <- p3 + ggtitle("MSNFI-classes data abf_pe_w by soil fertility class")

p4 <- plot(nocon.grpcur.abf.pe.w.cmat, monochrome=FALSE, min=FALSE, mean=FALSE, 
           max=FALSE, invert.x=TRUE)
p4 <- p4 + ylim(0, 1) + 
  ggtitle("MSNFI-classes data abf_pe_w_cmat by soil fertility class (local quality)")

p5 <- plot(cur.nosfc.msnfi.abf.pe.w, monochrome=FALSE, min=FALSE, mean=FALSE, 
           invert.x=TRUE) + ylim(0, 1)
p5 <- p5  + ggtitle("MSNFI data abf_pe_w by soil fertility class")
p6 <- plot(cur.nosfc.msnfi.abf.pe.w.cmat, monochrome=FALSE, min=FALSE, 
           mean=FALSE, invert.x=TRUE) + ylim(0, 1)
p6 <- p6  + ggtitle("MSNFI data abf_pe_w by soil fertility class")

grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)
