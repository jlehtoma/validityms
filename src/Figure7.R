<<<<<<< HEAD
library(ProjectTemplate)
load.project()

library(dplyr)
library(grid)

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
dd.all <- data.frame(pr_lost=V5@results@curves$pr_lost, variable="mean.All",
                     value=V5@results@curves$ave_pr)
m.dd <- rbind(m.dd, dd.all)
m.dd$type <- "R5"

loaded.msnfi.sfc <- grpcur.V5.load.V3[,c(1, seq(4, ncol(grpcur.V5.load.V3), 5))]
m.loaded.msnfi.sfc <- melt(loaded.msnfi.sfc, id.vars=c("pr_lost"))
m.loaded.msnfi.sfc.all <- data.frame(pr_lost=V5.load.V3@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V5.load.V3@results@curves$ave_pr)
m.loaded.msnfi.sfc <- rbind(m.loaded.msnfi.sfc, m.loaded.msnfi.sfc.all)
m.loaded.msnfi.sfc$type <- "R3"

loaded.msnfi <- grpcur.V5.load.V1[,c(1, seq(4, ncol(grpcur.V5.load.V1), 5))]
m.loaded.msnfi <- melt(loaded.msnfi, id.vars=c("pr_lost"))
m.loaded.msnfi.all <- data.frame(pr_lost=V5.load.V1@results@curves$pr_lost, 
                                 variable="mean.All",
                                 value=V5.load.V1@results@curves$ave_pr)
m.loaded.msnfi <- rbind(m.loaded.msnfi, m.loaded.msnfi.all)
m.loaded.msnfi$type <- "R1"

dat <- do.call("rbind", list("A"=m.dd, "B"=m.loaded.msnfi.sfc, 
                             "C"=m.loaded.msnfi))

dat$variable <- gsub("^mean\\.", "", dat$variable)

dat$lt <- 1
dat$lt[which(dat$type == "R1")] <- 2
dat$lt[which(dat$type == "R3")] <- 3
dat$lt <- factor(dat$lt)
dat$variable <- factor(dat$variable)

# Note that the values don't start from 1.0 because of the condition layer. For
# visualization purposes, scale values between 0 and 1. 
dat.scaled <- ddply(dat, c("variable", "type"), summarize,
                    pr_lost = pr_lost,
                    value01 = range01(value),
                    lt = lt)

p1 <- ggplot(dat.scaled, aes(x=pr_lost, y=value01, linetype=lt)) 
p1 <- p1 + geom_line(size=0.8) + facet_wrap(~variable) +
  ylab("Prop. of distributions remaining\n") +
  scale_x_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("1.0", "0.8", "0.6", "0.4", "0.2", "0.0")) + 
  xlab("\nProp. of landscape under conservation") + 
  scale_linetype_discrete(name="Run",
                          breaks=c("2", "3", "1"),
                          labels=c("R1", "R3", "R5")) + theme_bw() + 
  theme(strip.text.x = element_text(size = 14),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        legend.title = element_text(size=18),
        legend.text = element_text(size=14),
        legend.key.width = unit(1.5, "cm"),
        legend.key = element_blank())

png(file="figs/Figure6/Fig6.png", width=1000, height=800)
p1
dev.off()

svg(file="figs/Figure6/Fig6.svg", width=1000, height=800)
p1
dev.off()


# Special plotting for lectio ---------------------------------------------

# Get R3 and R5
dat_sub <- dplyr::filter(dat.scaled, lt == 1 | lt == 3)
dat_sub <- dplyr::filter(dat_sub, variable == "All")

p1 <- ggplot(dat_sub, aes(x=1-pr_lost, y=value01, color=lt)) 
p1 <- p1 + geom_line(size=1) +
  ylab("Proportion of distribution covered (%)\n") +
  scale_y_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("0", "20", "40", "60", "80", "100")) +
  scale_x_continuous(breaks=seq(1, 0, -0.2), 
                     labels=c("0", "20", "40", "60", "80", "100")) + 
  xlab("\nProportion of landscape under conservation (%)") + 
  scale_color_discrete(name="Run",
                          breaks=c("3", "1"),
                          labels=c("Coarse", "Detailed")) + theme_bw() + 
  theme(strip.text.x = element_text(size = 14),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        legend.title = element_text(size=18),
        legend.text = element_text(size=14),
        legend.key.width = unit(1.5, "cm"),
        legend.key = element_blank())

p1

# Get performance levels in numbers ---------------------------------------

pr_lost <- c(0.9)

# We'll have to get the overall means from the curves (performance can't handle
# this in zonator 0.3.9)

cur.V5 <- curves(V5)
V5.09 <- cur.V5[which(cur.V5$pr_lost >= pr_lost),][1,]$ave_pr

cur.V5.V1 <- curves(V5.load.V1)
V5.V1.09 <- cur.V5.V1[which(cur.V5.V1$pr_lost >= pr_lost),][1,]$ave_pr

cur.V5.V3 <- curves(V5.load.V3)
V5.V3.09 <- cur.V5.V3[which(cur.V5.V3$pr_lost >= pr_lost),][1,]$ave_pr

# Group wise means are returned by the performance directly

V1.09 <- performance(results(V5.load.V1), pr_lost, groups=TRUE)

V3.09 <- performance(results(V5.load.V3), pr_lost, groups=TRUE)

V5.09 <- performance(results(V5), pr_lost, groups=TRUE)
=======
library(ProjectTemplate)
load.project()

library(dplyr)
library(grid)

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
dd.all <- data.frame(pr_lost=V5@results@curves$pr_lost, variable="mean.All",
                     value=V5@results@curves$ave_pr)
m.dd <- rbind(m.dd, dd.all)
m.dd$type <- "R5"

loaded.msnfi.sfc <- grpcur.V5.load.V3[,c(1, seq(4, ncol(grpcur.V5.load.V3), 5))]
m.loaded.msnfi.sfc <- melt(loaded.msnfi.sfc, id.vars=c("pr_lost"))
m.loaded.msnfi.sfc.all <- data.frame(pr_lost=V5.load.V3@results@curves$pr_lost, 
                                     variable="mean.All",
                                     value=V5.load.V3@results@curves$ave_pr)
m.loaded.msnfi.sfc <- rbind(m.loaded.msnfi.sfc, m.loaded.msnfi.sfc.all)
m.loaded.msnfi.sfc$type <- "R3"

loaded.msnfi <- grpcur.V5.load.V1[,c(1, seq(4, ncol(grpcur.V5.load.V1), 5))]
m.loaded.msnfi <- melt(loaded.msnfi, id.vars=c("pr_lost"))
m.loaded.msnfi.all <- data.frame(pr_lost=V5.load.V1@results@curves$pr_lost, 
                                 variable="mean.All",
                                 value=V5.load.V1@results@curves$ave_pr)
m.loaded.msnfi <- rbind(m.loaded.msnfi, m.loaded.msnfi.all)
m.loaded.msnfi$type <- "R1"

dat <- do.call("rbind", list("A"=m.dd, "B"=m.loaded.msnfi.sfc, 
                             "C"=m.loaded.msnfi))

dat$variable <- gsub("^mean\\.", "", dat$variable)

dat$lt <- 1
dat$lt[which(dat$type == "R1")] <- 2
dat$lt[which(dat$type == "R3")] <- 3
dat$lt <- factor(dat$lt)
dat$variable <- factor(dat$variable)

# Note that the values don't start from 1.0 because of the condition layer. For
# visualization purposes, scale values between 0 and 1. 
dat.scaled <- ddply(dat, c("variable", "type"), summarize,
                    pr_lost = pr_lost,
                    value01 = range01(value),
                    lt = lt)

p1 <- ggplot(dat.scaled, aes(x=pr_lost, y=value01, linetype=lt)) 
p1 <- p1 + geom_line(size=0.8) + facet_wrap(~variable) +
  ylab("Prop. of distributions remaining\n") +
  scale_x_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("1.0", "0.8", "0.6", "0.4", "0.2", "0.0")) + 
  xlab("\nProp. of landscape under conservation") + 
  scale_linetype_discrete(name="Run",
                          breaks=c("2", "3", "1"),
                          labels=c("R1", "R3", "R5")) + theme_bw() + 
  theme(strip.text.x = element_text(size = 14),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        legend.title = element_text(size=18),
        legend.text = element_text(size=14),
        legend.key.width = unit(1.5, "cm"),
        legend.key = element_blank())

png(file="figs/Figure6/Fig6.png", width=1000, height=800)
p1
dev.off()

svg(file="figs/Figure6/Fig6.svg", width=1000, height=800)
p1
dev.off()


# Special plotting for lectio ---------------------------------------------

# Get R3 and R5
dat_sub <- dplyr::filter(dat.scaled, lt == 1 | lt == 3)
dat_sub <- dplyr::filter(dat_sub, variable == "All")

p1 <- ggplot(dat_sub, aes(x=1-pr_lost, y=value01, color=lt)) 
p1 <- p1 + geom_line(size=1) +
  ylab("Proportion of distribution covered (%)\n") +
  scale_y_continuous(breaks=seq(0, 1, 0.2), 
                     labels=c("0", "20", "40", "60", "80", "100")) +
  scale_x_continuous(breaks=seq(1, 0, -0.2), 
                     labels=c("0", "20", "40", "60", "80", "100")) + 
  xlab("\nProportion of landscape under conservation (%)") + 
  scale_color_discrete(name="Run",
                          breaks=c("3", "1"),
                          labels=c("Coarse", "Detailed")) + theme_bw() + 
  theme(strip.text.x = element_text(size = 14),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        legend.title = element_text(size=18),
        legend.text = element_text(size=14),
        legend.key.width = unit(1.5, "cm"),
        legend.key = element_blank())

p1

# Get performance levels in numbers ---------------------------------------

pr_lost <- c(0.9)

# We'll have to get the overall means from the curves (performance can't handle
# this in zonator 0.3.9)

cur.V5 <- curves(V5)
V5.09 <- cur.V5[which(cur.V5$pr_lost >= pr_lost),][1,]$ave_pr

cur.V5.V1 <- curves(V5.load.V1)
V5.V1.09 <- cur.V5.V1[which(cur.V5.V1$pr_lost >= pr_lost),][1,]$ave_pr

cur.V5.V3 <- curves(V5.load.V3)
V5.V3.09 <- cur.V5.V3[which(cur.V5.V3$pr_lost >= pr_lost),][1,]$ave_pr

# Group wise means are returned by the performance directly

V1.09 <- performance(results(V5.load.V1), pr_lost, groups=TRUE)

V3.09 <- performance(results(V5.load.V3), pr_lost, groups=TRUE)

V5.09 <- performance(results(V5), pr_lost, groups=TRUE)
>>>>>>> ee7a63ecaee9e204f770af7cd20f35a2a0ec063f
