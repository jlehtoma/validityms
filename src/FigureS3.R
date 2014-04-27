library(gridExtra)
library(ProjectTemplate)
load.project()

# Re-name groups ----------------------------------------------------------

# Calculate new grouping based on soil fertility
groups(V3) <- rep(1:5, 4)
groupnames(V3) <- fert.labels

# When assigning new groups to the connectivity transformed variant, remember
# that the feature stack is duplicated: 1st for connectivity transformations, 
# 2nd time for local quality. Labels need to be reconstructed as well.
groups(V4) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V4) <- con.fert.labels

groups(V5) <- rep(1:5, 4)
groupnames(V5) <- fert.labels

# Again, remember the feature stack duplication
groups(V6) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V6) <- con.fert.labels

# Extract curves data -----------------------------------------------------

## MSNFI data

# No groups used/available
cur.V1 <- curves(V1, cols = 8:11)
names(cur.V1) <- c("pr_lost","Birch", "Spruce", "Otherdecid", "Pine")
# Get columns 5:8 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
cur.V2 <- curves(V2, cols = 12:15)
names(cur.V2) <- c("pr_lost","Birch", "Spruce", "Otherdecid", "Pine")

## MSNFI with soil fertility classes data

grpcur.V3 <- curves(V3, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.V4 <- curves(V4, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.V4 <- grpcur.V4[,-grep("-con$", names(grpcur.V4))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.V4 <- new("ZGroupCurvesDataFrame", nocon.grpcur.V4)

## Detailed data with soil fertility classes

grpcur.V5 <- curves(V5, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.V6 <- curves(V6, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.V6 <- grpcur.V6[,-grep("-con$", names(grpcur.V6))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.V6 <- new("ZGroupCurvesDataFrame", nocon.grpcur.V6)

# Plotting ----------------------------------------------------------------

p1 <- plot(cur.V1, monochrome=FALSE, min=FALSE, mean=FALSE, invert.x=TRUE) + 
  ylim(0, 1)
p1 <- p1 + ggtitle("MSNFI data (V1)")

p2 <- plot(cur.V2, monochrome=FALSE, min=FALSE, mean=FALSE, invert.x=TRUE)
p2 <- p2 + ylim(0, 1) + 
  ggtitle("MSNFI with connectivity (V2)")

p3 <- plot(grpcur.V3, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p3 <- p3 + ggtitle("MSNFI with classes (V3)")

p4 <- plot(nocon.grpcur.V4, monochrome=FALSE, min=FALSE, mean=FALSE, 
           max=FALSE, invert.x=TRUE)
p4 <- p4 + ylim(0, 1) + 
  ggtitle("MSNFI with classes and connectivity (V4)")

p5 <- plot(grpcur.V5, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p5 <- p5  + ggtitle("Detailed data with classes (V5)")
p6 <- plot(nocon.grpcur.V6, monochrome=FALSE, min=FALSE, max=FALSE,
           mean=FALSE, invert.x=TRUE) + ylim(0, 1)
p6 <- p6  + ggtitle("Detailed data with classes and connectivity (V6)")

png(file="figs/Figure4/Fig4.png", width=1500, height=1200)
grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)
dev.off()

svg(file="figs/Figure4/Fig4.svg", width=1500, height=1200)
grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)
dev.off()
