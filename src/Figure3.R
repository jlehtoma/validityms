# Get variant 1: 14_60_5kp_abf
variant.1 <- getVariant(project.130301, 1)
plot.curves(variant.1, monochrome=T, groups=TRUE, statistic="ext2")

# Get variant 4: 17_60_5kp_abf_pe_w_cmat
variant.4 <- getVariant(project.130301, 4)
plot.curves(variant.4, monochrome=T, groups=TRUE)
