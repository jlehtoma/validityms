library(zonator)
library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the plot labels
spp.labels <- c("1"="Birch", "2"="Spruce", "3"="OtherDec", "4"="Pine")
fert.labels <- c("1"="Lehto", "2"="Lehtomainen", "3"="Tuore", "4"="Kuivahko", 
                 "5"="Kuiva")


# Variant1 ----------------------------------------------------------------

# Get variant 1 (3): 16_60_5kp_abf_pe_w
variant.1 <- get_variant(project.esmk, 3)
featurenames(variant.1) <- fix_feature_names(featurenames(variant.1))
groupnames(variant.1) <- spp.labels

## Performance curves by tree species

grp.curves.1 <- curves(variant.1, groups=TRUE)
p1 <- plot(grp.curves.1, monochrome=FALSE, 
           invert.x=FALSE, main="Tree species group")

## Boxplots by fertility class 
# Take values [0.8, 1.0], leave everything else but pr_lost out
bp.curves.1 <- curves(variant.1, lost.lower=0.8, lost.upper=1.0, cols=c(1,8:27))

# [todo] - needs to refactored to a proper function
m.bp.curves.1 <- melt(bp.curves.1, id.vars = c("pr_lost"))
m.bp.curves.1$tree.spp <- sapply(strsplit(as.character(m.bp.curves.1$variable), 
                                          "_"), function(x){x[1]})
m.bp.curves.1$soil.fert <- sapply(strsplit(as.character(m.bp.curves.1$variable), 
                                           "_"), function(x){x[2]})
p <- ggplot(m.bp.curves.1, aes(factor(soil.fert), value))
p + geom_boxplot()


# Get variant 4: 17_60_5kp_abf_pe_w_cmat
variant.4 <- get_variant(project.esmk, 4)
groupnames(variant.4) <- spp.labels
curves.4 <- curves(variant.4)
grp.curves.4 <- curves(variant.4, groups=TRUE)
p1 <- plot(grp.curves.4, monochrome=FALSE, 
            invert.x=FALSE, main="Tree species group")

# Get variant 11: 24_60_5kp_abf_pe_w_cmat_altg
variant.11 <- get_variant(project.esmk, 11)
groupnames(variant.11) <- fert.labels
curves.11 <- curves(variant.11)
grp.curves.11 <- curves(variant.11, groups=TRUE)
p2 <- plot(grp.curves.11, monochrome=FALSE, invert.x=TRUE, mean=TRUE, min=TRUE,
           main="Soil fertility")

# Get variant 7: 20_60_5kp_abf_pe_w_cmat_cmete_cres_mask
variant.7 <- getvariant(project.130315, 7)
p3 <- plot(variant.7, monochrome=FALSE, group=TRUE, groups=1:4, 
           labels=spp.labels, statistic="mean", invert.x=FALSE, 
           main="Tree species group")
p3  <- p3 + theme(legend.position=c(.35, .3))

# Get variant 14: 27_60_5kp_abf_pe_w_cmat_cmete_cres_mask_altg
variant.14 <- getvariant(project.130315, 14)
p4 <- plot(variant.14, monochrome=FALSE, group=TRUE, groups=1:5, 
           labels=fert.labels, statistic="mean", invert.x=TRUE, 
           main="Soil fertility")
p4  <- p4 + theme(legend.position=c(.35, .3))

grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)


# Plot just variants 7 and 14
grid.arrange(p3, p4, nrow=1, ncol=2)
