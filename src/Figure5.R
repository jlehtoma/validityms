library(gridExtra)
library(ProjectTemplate)
load.project()

# Some code migrated over from:
# DataVault/Data/Metsakeskukset/Etela-Savo/Zonation/ESMK/results/R/result_stats_september.R

# CAPTION: Figure 6. The average priority rank and the distribution of rank 
# priorities of the landscape within the independent spatial validation data in 
# rank priorities based on more detailed data (left column) and MSNFI-only data 
# (right column). First row corresponds to protected areas, second to woodland 
# key habitats, and the third one to made METSO-deals. Each of the spatial 
# validation data is assumed to have on average higher conservation value than 
# the surrounding managed forest. 

rankr.V1 <- rank_raster(V1)
rankr.V2 <- rank_raster(V2)
rankr.V3 <- rank_raster(V3)
rankr.V4 <- rank_raster(V4)
rankr.V5 <- rank_raster(V5)
rankr.V6 <- rank_raster(V6)

# ylimit is hard coded to ease the comparison of priority distributions.
# Max-values from pairwise comparisons (manually from plots) are:
p1.p3.ylim <- 20000
p4.p6.ylim <- 3500
p7.p9.ylim <- 750

p1 <- plot_hist(rankr.V1, pa.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="V1 for PAs") + ylim(0, p1.p3.ylim)

p2 <- plot_hist(rankr.V3, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="V3 for PAs") + 
  ylim(0, p1.p3.ylim)

p3 <- plot_hist(rankr.V5, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="V5 for PAs") #+ ylim(0, p1.p3.ylim )

p4 <- plot_hist(rankr.V1, wkh.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="V1 for WKHs") + ylim(0, p4.p6.ylim)

p5 <- plot_hist(rankr.V3, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="V3 for WKHs") +
  ylim(0, p4.p6.ylim)

p6 <- plot_hist(rankr.V5, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="V5 for WKHs") #+ ylim(0, p4.p6.ylim)

p7 <- plot_hist(rankr.V1, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="V1 for METSO-deals") +
  ylim(0, p7.p9.ylim)

p8 <- plot_hist(rankr.V3, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="V3 for METSO-deals") +
  ylim(0, p7.p9.ylim)

p9 <- plot_hist(rankr.V5, metso.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="V5 for METSO-deals") +
  ylim(0, p7.p9.ylim)

png(file="figs/Figure5/Fig5.png", width=1500, height=1200)

grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, nrow=3, ncol=3)

dev.off()
