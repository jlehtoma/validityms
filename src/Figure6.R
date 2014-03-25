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

# Variant 3
rankr.abf.pe.w <- rank_raster(abf.pe.w)
# Variant 10
rankr.msnfi.abf.pe.w <- rank_raster(msnfi.abf.pe.w)
# Variant 16
rankr.nosfc.msnfi.abf.pe.w <- rank_raster(nosfc.msnfi.abf.pe.w)

# For a reason or another, extents of MSNFI-only results have shifted 20 meters
# to the east. Manually fix this.
extent(rankr.msnfi.abf.pe.w) <- extent(rankr.abf.pe.w)
extent(rankr.nosfc.msnfi.abf.pe.w) <- extent(rankr.abf.pe.w)

# ylimit is hard coded to ease the comparison of priority distributions.
# Max-values from pairwise comparisons (manually from plots) are:
p1.p3.ylim <- 12500
p4.p6.ylim <- 3000
p7.p9.ylim <- 250


p1 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w, pa.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w for PAs") + ylim(0, p1p2.ylim)
p2 <- plot_hist(rankr.msnfi.abf.pe.w, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w for PAs") + 
  ylim(0, p1.p3.ylim)
p3 <- plot_hist(rankr.abf.pe.w, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for PAs") + ylim(0, p1.p3.ylim )

p4 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w, wkh.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w for WKHs") + ylim(0, p4.p6.ylim)
p5 <- plot_hist(rankr.msnfi.abf.pe.w, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w for WKHs") +
  ylim(0, p4.p6.ylim)
p6 <- plot_hist(rankr.abf.pe.w, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for WKHs") + ylim(0, p4.p6.ylim)

p7 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w for METSO-deals") +
  ylim(0, p7.p9.ylim)
p8 <- plot_hist(rankr.msnfi.abf.pe.w, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="msnfi_abf_pe_w for METSO-deals") +
  ylim(0, p7.p9.ylim)
p9 <- plot_hist(rankr.abf.pe.w, metso.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for METSO-deals") +
  ylim(0, p7.p9.ylim)

grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, nrow=3, ncol=3)


# With matrix connectivity ------------------------------------------------

# For comparison, see what's the situation when matrix connectivity is 
# accounted for.

# Variant 4
rankr.abf.pe.w.cmat <- rank_raster(abf.pe.w.cmat)
# Variant 11
rankr.msnfi.abf.pe.w.cmat <- rank_raster(msnfi.abf.pe.w.cmat)
# Variant 17
rankr.nosfc.msnfi.abf.pe.w.cmat <- rank_raster(nosfc.msnfi.abf.pe.w.cmat)
# For a reason or another, extents of MSNFI-only results have shifted 20 meters
# to the east. Manually fix this.
extent(rankr.msnfi.abf.pe.w.cmat) <- extent(rankr.abf.pe.w.cmat)
extent(rankr.nosfc.msnfi.abf.pe.w.cmat) <- extent(rankr.abf.pe.w.cmat)

p10 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w.cmat, pa.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w_cmat for PAs") + ylim(0, p1p2.ylim)
p11 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, pa.mask, add.median=TRUE, 
                 add.mean=FALSE, binwidth=0.02, 
                 title="msnfi_abf_pe_w_cmat for PAs") + 
  ylim(0, p1.p3.ylim)
p12 <- plot_hist(rankr.abf.pe.w.cmat, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w _cmat for PAs") + 
  ylim(0, p1.p3.ylim )

p13 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w.cmat, wkh.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w_cmat for WKHs") + 
  ylim(0, p4.p6.ylim)
p14 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, wkh.mask, add.median=TRUE, 
                 add.mean=FALSE, binwidth=0.02, 
                 title="msnfi_abf_pe_w_cmat for WKHs") +
  ylim(0, p4.p6.ylim)
p15 <- plot_hist(rankr.abf.pe.w.cmat, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w_cmat for WKHs") + 
  ylim(0, p4.p6.ylim)

p16 <- plot_hist(rankr.nosfc.msnfi.abf.pe.w.cmat, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="nosfc_msnfi_abf_pe_w_cmat for METSO-deals") +
  ylim(0, p7.p9.ylim)
p17 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="msnfi_abf_pe_w_cmat for METSO-deals") +
  ylim(0, p7.p9.ylim)
p18 <- plot_hist(rankr.abf.pe.w.cmat, metso.mask, add.median=TRUE, 
                 add.mean=FALSE, binwidth=0.02, 
                 title="abf_pe_w_cmat for METSO-deals") +
  ylim(0, p7.p9.ylim)

grid.arrange(p10, p11, p12, p13, p14, p15, p16, p17, p18, nrow=3, ncol=3)
