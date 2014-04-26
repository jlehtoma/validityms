library(ProjectTemplate)
load.project()

# Re-name groups ----------------------------------------------------------

# Local quality

groups(V5) <- rep(1:5, 4)
groupnames(V5) <- fert.labels

groups(V5.load.V3) <- rep(1:5, 4)
groupnames(V5.load.V3) <- fert.labels

groups(V5.load.V1) <- rep(1:5, 4)
groupnames(V5.load.V1) <- fert.labels

# Connectivity

groups(V6) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V6) <- con.fert.labels

groups(V6.load.V2) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V6.load.V2) <- con.fert.labels

groups(V6.load.V4) <- c(rep(1:5, 4), rep(6:10, 4))
groupnames(V6.load.V4) <- con.fert.labels

# Get curves data ---------------------------------------------------------

grpcur.V5 <- curves(V5, groups=TRUE)

## Pre-load MSNFI / MSNFI with classes ranking

grpcur.V5.load.V1 <- curves(V5.load.V1, groups=TRUE)
grpcur.V6.load.V2 <- curves(V6.load.V2, groups=TRUE)

grpcur.V5.load.V3 <- curves(V5.load.V3, groups=TRUE)
grpcur.V6.load.V4 <- curves(V6.load.V4, groups=TRUE)

# Performance differences -------------------------------------------------

# Calculate the difference in performance levels between the analysis based on
# the detailed data and on the pre-loaded version (detailed data forced to the
# rank order of analysis based on MSNFI with classes)

# Just the local quality

# Get just the mean columns
dd <- grpcur.V5[,c(1, seq(4, ncol(grpcur.V5), 5))]
m.dd <- melt(dd, id.vars=c("pr_lost"))
# Get the average over everything
dd.all <- data.frame(pr_lost=V1@results@curves$pr_lost, variable="mean.All",
                     value=V1@results@curves$ave_pr)
m.dd <- rbind(m.dd, dd.all)
m.dd$type <- "V5"

loaded.msnfi.sfc <- grpcur.V5.load.V3[,c(1, seq(4, ncol(grpcur.V5.load.V3), 5))]
m.loaded.msnfi.sfc <- melt(loaded.msnfi.sfc, id.vars=c("pr_lost"))
m.loaded.msnfi.sfc.all <- data.frame(pr_lost=V5.load.V3@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V5.load.V3@results@curves$ave_pr)
m.loaded.msnfi.sfc <- rbind(m.loaded.msnfi.sfc, m.loaded.msnfi.sfc.all)
m.loaded.msnfi.sfc$type <- "V3"

loaded.msnfi <- grpcur.V5.load.V1[,c(1, seq(4, ncol(grpcur.V5.load.V1), 5))]
m.loaded.msnfi <- melt(loaded.msnfi, id.vars=c("pr_lost"))
m.loaded.msnfi.all <- data.frame(pr_lost=V5.load.V1@results@curves$pr_lost, 
                                 variable="mean.All",
                                 value=V5.load.V1@results@curves$ave_pr)
m.loaded.msnfi <- rbind(m.loaded.msnfi, m.loaded.msnfi.all)
m.loaded.msnfi$type <- "V1"

dat <- do.call("rbind", list("A"=m.dd, "B"=m.loaded.msnfi.sfc, 
                             "C"=m.loaded.msnfi))

dat$variable <- gsub("^mean\\.", "", dat$variable)

dat$lt <- 1
dat$lt[which(dat$type == "V1")] <- 2
dat$lt[which(dat$type == "V3")] <- 3
dat$lt <- as.factor(dat$lt)

p1 <- ggplot(dat, aes(x=pr_lost, y=value, linetype=lt)) 
p1 <- p1 + geom_line(size=0.8) + facet_wrap(~variable) +
  ylab("Prop. of distributions remaining\n") +
  scale_x_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("1.0", "0.8", "0.6", "0.4", "0.2", "0.0")) + 
  xlab("Prop. of landscape under conservation") + 
  scale_linetype_discrete(name="Ranking from",
                          labels=c("V5", "V1", "V3")) + theme_bw()

png(file="figs/Figure4/Fig4.png", width=1000, height=800)
p1
dev.off()

svg(file="figs/Figure4/Fig4.svg", width=1000, height=800)
p1
dev.off()
