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

# Get variant 7: 20_60_5kp_abf_pe_w_cmat_cmete_cres_mask
variant.7 <- getVariant(project.130315, 7)
p3 <- plot(variant.7, monochrome=TRUE, group=TRUE, groups=1:4, labels=spp.labels, 
           statistic="mean", invert.x=FALSE, main="Tree species group")
p3  <- p3 + theme(legend.position=c(.35, .3))

# Get variant 14: 27_60_5kp_abf_pe_w_cmat_cmete_cres_mask_altg
variant.14 <- getVariant(project.130315, 14)
p4 <- plot(variant.14, monochrome=TRUE, group=TRUE, groups=1:5, labels=fert.labels, 
           statistic="mean", invert.x=TRUE, main="Soil fertility")
p4  <- p4 + theme(legend.position=c(.35, .3))


grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

# Plot just variants 7 and 14
grid.arrange(p3, p4, nrow=1, ncol=2)
