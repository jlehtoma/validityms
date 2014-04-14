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

# Original variants are:
#
# ALL DATA - Using MSNFI data + more detailed data from stand-based inventory
# databases. Also using division into separate feature layers based on 
# soil fertility classification derived from more detailed databases and 
# (pixel-base) MSNFI.
#
# V1 = 03_abf_pe_w
# V2 = 04_abf_pe_w_cmat
# 
# MSNFI DATA ONLY - Using division into separate feature layers based on 
# soil fertility classification derived from (segmented) MSNFI.
# 
# V3 = 10_msnfi_abf_pe_w
# V4 = 11_msnfi_abf_pe_w_cmat
#
# MSNFI DATA ONLY - No division into separate feature layers based on 
# soil fertility classification.
#
# V5 = 16_msnfi_abf_pe_w_nosfc
# V6 = 17_msnfi_abf_pe_w_cmat_nosfc

# Actual variants ---------------------------------------------------------

V1 <- get_variant(project.esmk, 3)
V2 <- get_variant(project.esmk, 4)

V3 <- get_variant(project.esmk, 10)
V4 <- get_variant(project.esmk, 11)

V5 <- get_variant(project.esmk, 16)
V6 <- get_variant(project.esmk, 17)


# Pre-loaded variants -----------------------------------------------------

# Use feature data from V1 but pre-load ranking from V3
V1.load.V3 <- get_variant(project.esmk, 18)
# Use feature data from V2 but pre-load ranking from V4
V2.load.V4 <- get_variant(project.esmk, 19)

# Use feature data from V1 but pre-load ranking from V5
V1.load.V5 <- get_variant(project.esmk, 20)
# Use feature data from V1 but pre-load ranking from V6
V2.load.V6 <- get_variant(project.esmk, 21)

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
extent(pa.mask) <- extent(rank_raster(V1))

# METSO mask contains location acquired to METSO 2011-2012. In practice,
# they are private protected areas. Each location has a unique ID-number
# which range [1, 75].
metso.mask.file <- file.path(common.data.dir, "esmk_metso.img")
metso.mask <- raster(metso.mask.file)
extent(metso.mask) <- extent(rank_raster(V1))

# Woodland key habitats (WKH) are small set-asides and a conservation instrument
# provided by general forest management. Raster has 1 if pixel belongs to a 
# WKH, otherwise NoData.
wkh.mask.file <- file.path(common.data.dir, "esmk_wkh.img")
wkh.mask <- raster(wkh.mask.file)
extent(wkh.mask) <- extent(rank_raster(V1))

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
