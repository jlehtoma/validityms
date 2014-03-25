library(reshape2)
library(plyr)
library(ProjectTemplate)
load.project()

# Compare the overlaps between different variants
# [todo] - Implement cache/memoise


# Calculate the Jaccard indices for various combinations ------------------

# Create a raster stack to hold selected variants

# 2 = 02_abf_pe
# 9 = 09_msnfi_abf_pe
# 15 = 15_msnfi_abf_pe_nosfc
ranks.abf.pe <- rank_rasters(project.esmk, variants=c(2, 9, 15))

j.abf.pe.98 <- cross_jaccard(ranks.abf.pe, c(0.98))
j.abf.pe.95 <- cross_jaccard(ranks.abf.pe, c(0.95))
j.abf.pe.90 <- cross_jaccard(ranks.abf.pe, c(0.90))
j.abf.pe.80 <- cross_jaccard(ranks.abf.pe, c(0.80))
j.abf.pe.50 <- cross_jaccard(ranks.abf.pe, c(0.50))

# 3 = 03_abf_pe_w
# 10 = 10_msnfi_abf_pe_w
# 16 = 16_msnfi_abf_pe_w_nosfc
ranks.abf.pe.w <- rank_rasters(project.esmk, variants=c(3, 10, 16))

j.abf.pe.w.98 <- cross_jaccard(ranks.abf.pe.w, c(0.98))
j.abf.pe.w.95 <- cross_jaccard(ranks.abf.pe.w, c(0.95))
j.abf.pe.w.90 <- cross_jaccard(ranks.abf.pe.w, c(0.90))
j.abf.pe.w.80 <- cross_jaccard(ranks.abf.pe.w, c(0.80))
j.abf.pe.w.50 <- cross_jaccard(ranks.abf.pe.w, c(0.50))

# 4 = 04_abf_pe_w_cmat
# 11 = 11_msnfi_abf_pe_w_cmat
# 17 = 17_msnfi_abf_pe_w_cmat_nosfc
ranks.abf.pe.w.cmat <- rank_rasters(project.esmk, variants=c(4, 11, 17))

j.abf.pe.w.cmat.98 <- cross_jaccard(ranks.abf.pe.w.cmat, c(0.98))
j.abf.pe.w.cmat.95 <- cross_jaccard(ranks.abf.pe.w.cmat, c(0.95))
j.abf.pe.w.cmat.90 <- cross_jaccard(ranks.abf.pe.w.cmat, c(0.90))
j.abf.pe.w.cmat.80 <- cross_jaccard(ranks.abf.pe.w.cmat, c(0.80))
j.abf.pe.w.cmat.50 <- cross_jaccard(ranks.abf.pe.w.cmat, c(0.50))


# Combine the data --------------------------------------------------------

# A = Full data
# B = MSNF-only, sfc
# B = MSNF-only, no sfc

within.variant <- data.frame("comparison"=c("A and B", "A and C", "B and C"),
                             "best50"=c(j.abf.pe.w.50[1, 2],
                                        j.abf.pe.w.50[1, 3],
                                        j.abf.pe.w.50[2, 3]),
                             "best20"=c(j.abf.pe.w.80[1, 2],
                                        j.abf.pe.w.80[1, 3],
                                        j.abf.pe.w.80[2, 3]),
                             "best10"=c(j.abf.pe.w.90[1, 2],
                                        j.abf.pe.w.90[1, 3],
                                        j.abf.pe.w.90[2, 3]),
                             "best5"=c(j.abf.pe.w.95[1, 2],
                                       j.abf.pe.w.95[1, 3],
                                       j.abf.pe.w.95[2, 3]),
                             "best2"=c(j.abf.pe.w.98[1, 2], 
                                       j.abf.pe.w.98[1, 3],
                                       j.abf.pe.w.98[2, 3]))
m.within.variant <- melt(within.variant, id.vars=c("comparison"))

between.variants <- data.frame("comparison"=c("A and B", "A and C", "B and C"),
                               "best50"=c(j.abf.pe.50[1, 2],
                                          j.abf.pe.w.50[1, 2],
                                          j.abf.pe.w.cmat.50[1, 2]),
                               "best20"=c(j.abf.pe.80[1, 2],
                                          j.abf.pe.w.80[1, 2],
                                          j.abf.pe.w.cmat.80[1, 2]),
                               "best10"=c(j.abf.pe.90[1, 2],
                                          j.abf.pe.w.90[1, 2],
                                          j.abf.pe.w.cmat.90[1, 2]),
                               "best5"=c(j.abf.pe.95[1, 2],
                                         j.abf.pe.w.95[1, 2],
                                         j.abf.pe.w.cmat.95[1, 2]),
                               "best2"=c(j.abf.pe.98[1, 2],
                                         j.abf.pe.w.98[1, 2],
                                         j.abf.pe.w.cmat.98[1, 2]))
m.between.variants <- melt(between.variants, id.vars=c("comparison"))

# Plot the results --------------------------------------------------------

# Within a variant
p <- ggplot(m.within.variant, aes(x=variable, y=value, group=comparison,
                                  color=comparison))
p + geom_line(size=1.0) + geom_point(size=3.0) + 
  xlab("\nTop fraction of the landscape") +
  ylab("Jaccard index\n") + ylim(0, 1) + 
  scale_x_discrete(labels=c("50%", "20%", "10%", "5%", "2%")) + theme_bw() +
  ggtitle("Spatial overlap between different data sources and the same variant")

# Between variants
p <- ggplot(m.between.variants, aes(x=variable, y=value, group=comparison,
                                  color=comparison))
p + geom_line(size=1.0) + geom_point(size=3.0) + 
  xlab("\nTop fraction of the landscape") +
  ylab("Jaccard index\n") + ylim(0, 1) + 
  scale_x_discrete(labels=c("50%", "20%", "10%", "5%", "2%")) + theme_bw() +
  ggtitle("Spatial overlap between 2 different data sources and 3 different variants")



# Correlation -------------------------------------------------------------

pairs(ranks.abf.pe.w, method="kendall")
