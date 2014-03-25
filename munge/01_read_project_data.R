# Latest project, basically the runs done by Antti in septemeber re-run in
# Viikki
library(zonator)
library(raster)

# Data setup --------------------------------------------------------------

# Set data sources. This will depend on where repository zsetup-esmk is 
# located, but the default assumption is that they share the same root
# folder

zproject.dir <- "../zsetup-esmk"
zsetup.dir <- file.path(zproject.dir, "zsetup")
root.data.dir <- file.path(zproject.dir, "data")
common.data.dir <- file.path(root.data.dir, "common/60")

# Project and variants ----------------------------------------------------

message("  Reading in Zproject...")
project.esmk <- create_zproject(root=zproject.dir, debug=FALSE)

# Variants are:
#
# ALL DATA - Using MSNFI data + more detailed data from stand-based inventory
# databases. Also using division into separate feature layers based on 
# soil fertility classification derived from more detailed databases and 
# (pixel-base) MSNFI.
#
# 1 = 01_abf
# 2 = 02_abf_pe
# 3 = 03_abf_pe_w
# 4 = 04_abf_pe_w_cmat
# 5 = 05_abf_pe_w_cmat_cmete
# 6 = 06_abf_pe_w_cmat_cmete_cres
# 7 = 07_abf_pe_w_cmat_cmete_cres_mask
# 
# MSNFI DATA ONLY - Using division into separate feature layers based on 
# soil fertility classification derived from (segmented) MSNFI.
# 
# 8 = 08_msnfi_abf
# 9 = 09_msnfi_abf_pe
# 10 = 10_msnfi_abf_pe_w
# 11 = 11_msnfi_abf_pe_w_cmat
#
# MSNFI DATA ONLY - No division into separate feature layers based on 
# soil fertility classification.
#
# 15 = 15_msnfi_abf_pe_nosfc
# 16 = 16_msnfi_abf_pe_w_nosfc
# 17 = 17_msnfi_abf_pe_w_cmat_nosfc

# Actual variants ---------------------------------------------------------

abf <- get_variant(project.esmk, 1)
abf.pe <- get_variant(project.esmk, 2)
abf.pe.w <- get_variant(project.esmk, 3)
abf.pe.w.cmat <- get_variant(project.esmk, 4)
abf.pe.w.cmat.cmete <- get_variant(project.esmk, 5)
abf.pe.w.cmat.cmete.cres <- get_variant(project.esmk, 6)
abf.pe.w.cmat.cmete.cres.mask <- get_variant(project.esmk, 7)

# Fix raster extents ------------------------------------------------------

# For a reason or another, extents of MSNFI-only results have shifted 20 meters
# to the south. Manually fix this for variants 8-11 and 15-17. Use 01_abf as a 
# reference point.

extent(project.esmk@variants[[8]]@results@rank) <- extent(abf@results@rank)
extent(project.esmk@variants[[9]]@results@rank) <- extent(abf@results@rank)
extent(project.esmk@variants[[10]]@results@rank) <- extent(abf@results@rank)
extent(project.esmk@variants[[11]]@results@rank) <- extent(abf@results@rank)

extent(project.esmk@variants[[15]]@results@rank) <- extent(abf@results@rank)
extent(project.esmk@variants[[16]]@results@rank) <- extent(abf@results@rank)
extent(project.esmk@variants[[17]]@results@rank) <- extent(abf@results@rank)

msnfi.abf <- get_variant(project.esmk, 8)
msnfi.abf.pe <- get_variant(project.esmk, 9)
msnfi.abf.pe.w <- get_variant(project.esmk, 10)
msnfi.abf.pe.w.cmat <- get_variant(project.esmk, 11)

nosfc.msnfi.abf.pe <- get_variant(project.esmk, 15)
nosfc.msnfi.abf.pe.w <- get_variant(project.esmk, 16)
nosfc.msnfi.abf.pe.w.cmat <- get_variant(project.esmk, 17)

# Re-grouping -------------------------------------------------------------

# Auxillary data ----------------------------------------------------------

# These data sets are part of Zonation analyses or then they are used in
# analyzing the results.

# Protected areas raster that has open peatlands ("avosuo", as defined in 
# MSNFI raster "päätyyppi") removed from it. Raster has 1 if pixel belongs to a 
# PA, otherwise NoData. NOTE: if you need all PAs (including open peatlands) use
# raster "esmk_hier_pas.img"
pa.mask.file <- file.path(common.data.dir, "esmk_pas_nopeat.img")
pa.mask <- raster(pa.mask.file)

# METSO mask contains location acquired to METSO 2011-2012. In practice,
# they are private protected areas. Each location has a unique ID-number
# which range [1, 75].
metso.mask.file <- file.path(common.data.dir, "esmk_metso.img")
metso.mask <- raster(metso.mask.file)

# Woodland key habitats (WKH) are small set-asides and a conservation instrument
# provided by general forest management. Raster has 1 if pixel belongs to a 
# WKH, otherwise NoData.
wkh.mask.file <- file.path(common.data.dir, "esmk_wkh.img")
wkh.mask <- raster(wkh.mask.file)

# Soil fertility class (SFC) raster has 5 classes in it:
# 1 = Herb-rich (lehto)
# 2 = Herb-rich-like (lehtomainen)
# 3 = Moist/fresh (tuore)
# 4 = Semi-xeric (Kuivahko)
# 5 = Xeric (includes rocky outcrops) (kuiva, karukkokankaat, kalliot)
sfc.mask.file <- file.path(common.data.dir, "esmk_soil_fertility.img")
sfc.mask <- raster(sfc.mask.file)

# Data source raster defined from which data source data is derived:
# 1 = Finnish Forest and Park Service Natural Heritage (FFP, MHLP)
# 2 = Finnish Forest Center (FFC, MKMV)
# 3 = Finnish Forest Research Institute (FFR, MLVMI)
ds.mask.file <- file.path(common.data.dir, "esmk_data_source.img")
ds.mask <- raster(ds.mask.file)
