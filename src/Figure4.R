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

groups(V5.load.V3) <- rep(1:5, 4)
groupnames(V5.load.V3) <- fert.labels

groups(V5.load.V1) <- rep(1:5, 4)
groupnames(V5.load.V1) <- fert.labels

# Extract curves data -----------------------------------------------------

## MSNFI data

# No groups used/available
cur.V1 <- curves(V1)
cur.V2 <- curves(V2)

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

## Pre-load MSNFI / MSNFI with classes ranking

grpcur.V5.load.V1 <- curves(V5.load.V1, groups=TRUE)
grpcur.V6.load.V2 <- curves(V6.load.V2, groups=TRUE)

grpcur.V5.load.V3 <- curves(V5.load.V3, groups=TRUE)
grpcur.V6.load.V4 <- curves(V6.load.V4, groups=TRUE)

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

png(file="figs/Figure4/Fig4A.png", width=1500, height=1200)
grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)
dev.off()

svg(file="figs/Figure4/Fig4A.svg", width=1500, height=1200)
grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)
dev.off()

# Performance differences -------------------------------------------------

# Calculate the difference in performance levels between the analysis based on
# the detailed data and on the pre-loaded version (detailed data forced to the
# rank order of analysis based on MSNFI with classes)

# dd = detailed data, Full
# Get just the mean columns
dd <- grpcur.V5[,c(1, seq(4, ncol(grpcur.V5), 5))]
m.dd <- melt(dd, id.vars=c("pr_lost"))
# Get the average over everything
dd.all <- data.frame(pr_lost=V1@results@curves$pr_lost, variable="mean.All",
                     value=V1@results@curves$ave_pr)
m.dd <- rbind(m.dd, dd.all)
m.dd$type <- "Detailed data"

loaded.msnfi.sfc <- grpcur.V5.load.V3[,c(1, seq(4, ncol(grpcur.V5.load.V3), 5))]
m.loaded.msnfi.sfc <- melt(loaded.msnfi.sfc, id.vars=c("pr_lost"))
m.loaded.msnfi.sfc.all <- data.frame(pr_lost=V5.load.V3@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V5.load.V3@results@curves$ave_pr)
m.loaded.msnfi.sfc <- rbind(m.loaded.msnfi.sfc, m.loaded.msnfi.sfc.all)
m.loaded.msnfi.sfc$type <- "Loaded msnfi-sfc"

loaded.msnfi <- grpcur.V5.load.V1[,c(1, seq(4, ncol(grpcur.V5.load.V1), 5))]
m.loaded.msnfi <- melt(loaded.msnfi, id.vars=c("pr_lost"))
m.loaded.msnfi.all <- data.frame(pr_lost=V5.load.V1@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V5.load.V1@results@curves$ave_pr)
m.loaded.msnfi <- rbind(m.loaded.msnfi, m.loaded.msnfi.all)
m.loaded.msnfi$type <- "Loaded msnfi"

dat <- do.call("rbind", list("A"=m.dd, "B"=m.loaded.msnfi.sfc, 
                             "C"=m.loaded.msnfi))

dat$variable <- gsub("^mean\\.", "", dat$variable)

p7 <- ggplot(dat, aes(x=pr_lost, y=value, color=type)) 
p7 <- p7 + geom_line(size=1.25) + facet_wrap(~variable) +
  ylab("Prop. of distributions remaining\n") +
  scale_x_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("1.0", "0.8", "0.6", "0.4", "0.2", "0.0")) + 
  xlab("Prop. of landscape under conservation")

png(file="figs/Figure4/Fig4B.png", width=1000, height=800)
p7
dev.off()

svg(file="figs/Figure4/Fig4B.svg", width=1000, height=800)
p7
dev.off()
