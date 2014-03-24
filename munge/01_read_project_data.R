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

project.esmk <- create_zproject(root=zproject.dir, debug=TRUE)

# Variants are:
#
# ALL DATA
#
# 1 = 01_abf
# 2 = 02_abf_pe
# 3 = 03_abf_pe_w
# 4 = 04_abf_pe_w_cmat
# 5 = 05_abf_pe_w_cmat_cmete
# 6 = 06_abf_pe_w_cmat_cmete_cres
# 7 = 07_abf_pe_w_cmat_cmete_cres_mask
# 
# MSNFI DATA ONLY
# 
# 8 = 08_msnfi_abf
# 9 = 09_msnfi_abf_pe
# 10 = 10_msnfi_abf_pe_w
# 11 = 11_msnfi_abf_pe_w_cmat
#
abf <- get_variant(project.esmk, 1)
abf.pe <- get_variant(project.esmk, 2)
abf.pe.w <- get_variant(project.esmk, 3)
abf.pe.w.cmat <- get_variant(project.esmk, 4)
abf.pe.w.cmat.cmete <- get_variant(project.esmk, 5)
abf.pe.w.cmat.cmete.cres <- get_variant(project.esmk, 6)
abf.pe.w.cmat.cmete.cres.mask <- get_variant(project.esmk, 7)

msnfi.abf <- get_variant(project.esmk, 8)
msnfi.abf.pe <- get_variant(project.esmk, 9)
msnfi.abf.pe.w <- get_variant(project.esmk, 10)
msnfi.abf.pe.w.cmat <- get_variant(project.esmk, 11)

# Re-grouping -------------------------------------------------------------


# Auxillary data ----------------------------------------------------------

# These data sets are part of Zonation analyses or then they are used in
# analyzing the results.

# Protected areas raster is a hierarchical one where 
# 1 = PA, 0 = everything else
pa.mask.file <- file.path(common.data.dir, "esmk_hier_pas.img")
pa.mask <- raster(pa.mask.file)

# METSO mask contains location acquired to METSO 2011-2012. In practice,
# they are private protected areas. Each location has a unique ID-number
# which range [1, 75].
metso.mask.file <- file.path(common.data.dir, "esmk_metso.img")
metso.mask <- raster(metso.mask.file)
