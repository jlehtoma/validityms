library(gridExtra)

# Set the plot labels
spp.labels <- c("Birch", "Spruce", "Pine", "OtherDec")
fert.labels <- c("Lehto", "Lehtomainen", "Tuore", "Kuivahko", "Kuiva")

# Get variant 4: 17_60_5kp_abf_pe_w_cmat
variant.4 <- getVariant(project.130315, 4)
p1 <- plot(variant.4, monochrome=TRUE, group=TRUE, labels=spp.labels, 
           statistic="mean", invert.x=FALSE, main="Tree species group")
p1  <- p1 + theme(legend.position=c(.35, .3))

# Get variant 11: 24_60_5kp_abf_pe_w_cmat_altg
variant.11 <- getVariant(project.130315, 11)
p2 <- plot(variant.11, monochrome=TRUE, group=TRUE, labels=fert.labels, 
           statistic="mean", invert.x=TRUE, main="Soil fertility")
p2  <- p2 + theme(legend.position=c(.35, .3))

grid.arrange(p1, p2, nrow=1, ncol=2)
