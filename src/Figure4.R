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
groups(V1) <- rep(1:5, 4)
groupnames(V1) <- fert.labels

groups(V3) <- rep(1:5, 4)
groupnames(V3) <- fert.labels

groups(V1.load.V3) <- rep(1:5, 4)
groupnames(V1.load.V3) <- fert.labels

groups(V1.load.V5) <- rep(1:5, 4)
groupnames(V1.load.V5) <- fert.labels

# When assigning new groups to the connectivity transformed variant, remember
# that the feature stack is duplicated: 1st for connectivity transformations, 
# 2nd time for local quality. Labels need to be reconstructed as well.
groups(V2) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V2) <- con.fert.labels

groups(V4) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V4) <- con.fert.labels

# Performance curves by soil fertility --------------------------------------

# Detailed data

grpcur.V1 <- curves(V1, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.V2 <- curves(V2, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.V2 <- grpcur.V2[,-grep("-con$", names(grpcur.V2))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.V2 <- new("ZGroupCurvesDataFrame", nocon.grpcur.V2)

# MSNFI-classes data

grpcur.V3 <- curves(V3, groups=TRUE)
# Get columns 21:40 -> these are NOT transformed by matrix connectivity so 
# they describe local quality. cols can't be used in curves() when groups=TRUE,
# so the group curves data frame has to be manually divided.
grpcur.V4 <- curves(V4, groups=TRUE)
# Get only columns that don't end with "-con" (for connectivity)
nocon.grpcur.V4 <- grpcur.V4[,-grep("-con$", names(grpcur.V4))]
# We'll have to manually transform this back ZGroupCurvesDataFrame
nocon.grpcur.V4 <- new("ZGroupCurvesDataFrame", nocon.grpcur.V4)

# MSNFI data

# No groups used/available
cur.V5 <- curves(V5)
cur.V6 <- curves(V6)

# Pre-load MSNFI / MSNFI-nosfc ranking

grpcur.V1.load.V3 <- curves(V1.load.V3, groups=TRUE)
grpcur.V2.load.V4 <- curves(V2.load.V4, groups=TRUE)

grpcur.V1.load.V5 <- curves(V1.load.V5, groups=TRUE)
grpcur.V2.load.V6 <- curves(V2.load.V6, groups=TRUE)

# Plotting ----------------------------------------------------------------

p1 <- plot(grpcur.V1, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p1 <- p1 + ggtitle("Detailed data abf_pe_w by soil fertility class")

p2 <- plot(nocon.grpcur.V2, monochrome=FALSE, min=FALSE, mean=FALSE, 
           max=FALSE, invert.x=TRUE)
p2 <- p2 + ylim(0, 1) + 
  ggtitle("Detailed data abf_pe_w_cmat by soil fertility class (local quality)")

p3 <- plot(grpcur.V3, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=TRUE) + ylim(0, 1)
p3 <- p3 + ggtitle("MSNFI-classes data abf_pe_w by soil fertility class")

p4 <- plot(nocon.grpcur.V4, monochrome=FALSE, min=FALSE, mean=FALSE, 
           max=FALSE, invert.x=TRUE)
p4 <- p4 + ylim(0, 1) + 
  ggtitle("MSNFI-classes data abf_pe_w_cmat by soil fertility class (local quality)")

p5 <- plot(cur.V5, monochrome=FALSE, min=FALSE, mean=FALSE, 
           invert.x=TRUE) + ylim(0, 1)
p5 <- p5  + ggtitle("MSNFI data abf_pe_w by soil fertility class")
p6 <- plot(cur.V6, monochrome=FALSE, min=FALSE, 
           mean=FALSE, invert.x=TRUE) + ylim(0, 1)
p6 <- p6  + ggtitle("MSNFI data abf_pe_w by Psoil fertility class")

grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3)

# Performance differences -------------------------------------------------

# Calculate the difference in performance levels between the analysis based on
# the detailed data and on the pre-loaded version (detailed data forced to the
# rank order of analysis based on MSNFI with classes)

# dd = detailed data, Full
# Get just the mean columns
dd <- grpcur.V1[,c(1, seq(4, ncol(grpcur.V1), 5))]
m.dd <- melt(dd, id.vars=c("pr_lost"))
# Get the average over everything
dd.all <- data.frame(pr_lost=V1@results@curves$pr_lost, variable="mean.All",
                     value=V1@results@curves$ave_pr)
m.dd <- rbind(m.dd, dd.all)
m.dd$type <- "Detailed data"

loaded.msnfi.sfc <- grpcur.V1.load.V3[,c(1, seq(4, ncol(grpcur.V1.load.V3), 5))]
m.loaded.msnfi.sfc <- melt(loaded.msnfi.sfc, id.vars=c("pr_lost"))
m.loaded.msnfi.sfc.all <- data.frame(pr_lost=V1.load.V3@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V1.load.V3@results@curves$ave_pr)
m.loaded.msnfi.sfc <- rbind(m.loaded.msnfi.sfc, m.loaded.msnfi.sfc.all)
m.loaded.msnfi.sfc$type <- "Loaded msnfi-sfc"

loaded.msnfi <- grpcur.V1.load.V5[,c(1, seq(4, ncol(grpcur.V1.load.V5), 5))]
m.loaded.msnfi <- melt(loaded.msnfi, id.vars=c("pr_lost"))
m.loaded.msnfi.all <- data.frame(pr_lost=V1.load.V5@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V1.load.V5@results@curves$ave_pr)
m.loaded.msnfi <- rbind(m.loaded.msnfi, m.loaded.msnfi.all)
m.loaded.msnfi$type <- "Loaded msnfi"

dat <- do.call("rbind", list("A"=m.dd, "B"=m.loaded.msnfi.sfc, 
                             "C"=m.loaded.msnfi))

dat$variable <- gsub("^mean\\.", "", dat$variable)

p7 <- ggplot(dat, aes(x=pr_lost, y=value, color=type)) 
p7 + geom_line(size=1.25) + facet_wrap(~variable) +
  ylab("Prop. of distributions remaining\n") +
  scale_x_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("1.0", "0.8", "0.6", "0.4", "0.2", "0.0")) + 
  xlab("Prop. of landscape under conservation")
