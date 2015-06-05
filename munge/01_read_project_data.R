# Latest project, basically the runs done by Antti in septemeber re-run in
# Viikki
library(zonator)
library(raster)
library(maptools)

# Data setup --------------------------------------------------------------

# Set data sources. This will depend on where repository zsetup-esmk is 
# located, but the default assumption is that they share the same root
# folder

if (Sys.info()["sysname"] == "Linux") {
  zproject.dir <- "/home/jlehtoma/GitHub/zsetup-esmk/"
} else if (Sys.info()["sysname"] == "Windows") {
  zproject.dir <- "C:/Data/zsetup-esmk"
} else {
  stop("Operating system not supported")
}

zsetup.dir <- file.path(zproject.dir, "zsetup")
root.data.dir <- file.path(zproject.dir, "data")
common.data.dir <- file.path(root.data.dir, "common/60")
common.vector.dir <- file.path(root.data.dir, "common/vector")

# Project and variants ----------------------------------------------------

message("  Reading in Zproject...")
project.esmk <- create_zproject(root=zproject.dir, debug=FALSE)

# Original variants are:
#
#
# MSNFI DATA ONLY - No division into separate feature layers based on 
# soil fertility classification.
#
# V1 = 16_msnfi_abf_pe_w_nosfc
# V2 = 17_msnfi_abf_pe_w_cmat_nosfc
#
# MSNFI DATA ONLY - Using division into separate feature layers based on 
# soil fertility classification derived from (segmented) MSNFI.
# 
# V3 = 10_msnfi_abf_pe_w
# V4 = 11_msnfi_abf_pe_w_cmat
#
# ALL DATA - Using MSNFI data + more detailed data from stand-based inventory
# databases. Also using division into separate feature layers based on 
# soil fertility classification derived from more detailed databases and 
# (pixel-base) MSNFI.
#
# V5 = 03_abf_pe_w
# V6 = 04_abf_pe_w_cmat
# 

V1 <- get_variant(project.esmk, 16)
V2 <- get_variant(project.esmk, 17)

V3 <- get_variant(project.esmk, 10)
V4 <- get_variant(project.esmk, 11)

V5 <- get_variant(project.esmk, 3)
V6 <- get_variant(project.esmk, 4)

# Pre-loaded variants -----------------------------------------------------

# Use feature data from V5 but pre-load ranking from V3
V5.load.V3 <- get_variant(project.esmk, 18)
# Use feature data from V6 but pre-load ranking from V4
V6.load.V4 <- get_variant(project.esmk, 19)

# Use feature data from V5 but pre-load ranking from V1
V5.load.V1 <- get_variant(project.esmk, 20)
# Use feature data from V6 but pre-load ranking from V2
V6.load.V2 <- get_variant(project.esmk, 21)

# Re-grouping -------------------------------------------------------------

# Auxillary data ----------------------------------------------------------

# These data sets are part of Zonation analyses or then they are used in
# analyzing the results.

# Vector data
# Regional borders
esmk.mask.file <- file.path(common.vector.dir, "esmk_borders.shp")
esmk.mask <- readShapePoly(esmk.mask.file,
                           proj4string=CRS("+init=epsg:3067"))
# Project to KKJ
# TODO: everything should be in EUREF TM35FIN
esmk.mask <- spTransform(esmk.mask, "+init=epsg:2393")

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
sfc.mask <- raster(sfc.mask.file, crs="+init=epsg:2393")
# !!!NOTE!!! This masking operation will take a while, so once it was done
# (2015-06-02), the resulta was written over the original data. The actual
# Zonation analysis is masked already to only to the study area.
# 
#sfc.mask <- mask(sfc.mask, esmk.mask)
#writeRaster(sfc.mask, sfc.mask.file, overwrite=TRUE, datatype="INT1U",
#            options=c("COMPRESSED=YES"))

# Data source raster defined from which data source data is derived:
# 1 = Finnish Forest and Park Service Natural Heritage (FFP, MHLP)
# 2 = Finnish Forest Center (FFC, MKMV)
# 3 = Finnish Forest Research Institute (FFR, MLVMI)
ds.mask.file <- file.path(common.data.dir, "esmk_data_source.img")
ds.mask <- raster(ds.mask.file, crs="+init=epsg:2393")
# !!!NOTE!!! This masking operation will take a while, so once it was done
# (2015-06-02), the resulta was written over the original data. The actual
# Zonation analysis is masked already to only to the study area.
# 
#ds.mask <- mask(ds.mask, esmk.mask)
#writeRaster(ds.mask, ds.mask.file, overwrite=TRUE, datatype="INT1U",
#            options=c("COMPRESSED=YES"))

 

