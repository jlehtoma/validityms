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
# For a reason or another, extents of MSNFI-only results have shifted 20 meters
# to the east. Manually fix this.
extent(rankr.msnfi.abf.pe.w) <- extent(rankr.abf.pe.w)

# ylimit is hard coded to ease the comparison of priority distributions.
# Max-values from pairwise comparisons (manually from plots) are:
p1p2.ylim <- 12500
p3p4.ylim <- 3000
p5p6.ylim <- 250

p1 <- plot_hist(rankr.abf.pe.w, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for PAs") + ylim(0, p1p2.ylim)
p2 <- plot_hist(rankr.msnfi.abf.pe.w, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w for PAs") + 
  ylim(0, p1p2.ylim)
p3 <- plot_hist(rankr.abf.pe.w, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for WKHs") + ylim(0, p3p4.ylim)
p4 <- plot_hist(rankr.msnfi.abf.pe.w, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w for WKHs") +
  ylim(0, p3p4.ylim)
p5 <- plot_hist(rankr.abf.pe.w, metso.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w for METSO-deals") +
  ylim(0, p5p6.ylim)
p6 <- plot_hist(rankr.msnfi.abf.pe.w, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="msnfi_abf_pe_w for METSO-deals") +
  ylim(0, p5p6.ylim)

grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3, ncol=2)


# With matrix connectivity ------------------------------------------------

# For comparison, see what's the situation when matrix connectivity is 
# accounted for.

# Variant 4
rankr.abf.pe.w.cmat <- rank_raster(abf.pe.w.cmat)
# Variant 10
rankr.msnfi.abf.pe.w.cmat <- rank_raster(msnfi.abf.pe.w.cmat)
# For a reason or another, extents of MSNFI-only results have shifted 20 meters
# to the east. Manually fix this.
extent(rankr.msnfi.abf.pe.w.cmat) <- extent(rankr.abf.pe.w.cmat)

p7 <- plot_hist(rankr.abf.pe.w.cmat, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w_cmat for PAs") + ylim(0, p1p2.ylim)
p8 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, pa.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w_cmat for PAs") + 
  ylim(0, p1p2.ylim)
p9 <- plot_hist(rankr.abf.pe.w.cmat, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w_cmat for WKHs") + ylim(0, p3p4.ylim)
p10 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, wkh.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="msnfi_abf_pe_w_cmat for WKHs") +
  ylim(0, p3p4.ylim)
p11 <- plot_hist(rankr.abf.pe.w.cmat, metso.mask, add.median=TRUE, add.mean=FALSE,
                binwidth=0.02, title="abf_pe_w_cmat for METSO-deals") +
  ylim(0, p5p6.ylim)
p12 <- plot_hist(rankr.msnfi.abf.pe.w.cmat, metso.mask, add.median=TRUE, 
                add.mean=FALSE, binwidth=0.02, 
                title="msnfi_abf_pe_w_cmat for METSO-deals") +
  ylim(0, p5p6.ylim)

grid.arrange(p7, p8, p9, p10, p11, p12, nrow=3, ncol=2)
