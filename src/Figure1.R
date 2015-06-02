# Load required packages
library(maptools)
library(raster)
library(rasterVis)
library(rgdal)
library(rworldmap)
library(RColorBrewer)
library(ProjectTemplate)
load.project()

fin.0.wgs84 <- getData('GADM', country='FIN', level=0, path="cache")
fin.0.kkj <- spTransform(fin.0.wgs84, "+init=epsg:2393")

fin.2.wgs84 <- getData('GADM', country='FIN', level=2, path="cache")
fin.2.kkj <- spTransform(fin.2.wgs84, "+init=epsg:2393")

# Data source -------------------------------------------------------------

## Add a landcover column to the Raster Attribute Table
ds.mask <- as.factor(ds.mask)
ds_rat <- levels(ds.mask)[[1]]
ds_rat[["data_source"]] <- c("FPS", "FFC", "MS-NFI")
levels(ds.mask) <- ds_rat

ds_cols <- brewer.pal(3, "Dark2")

png(file="figs/Figure1/levelplots/Fig1_data_sources.png", width=950, 
    height=950)

levelplot(ds.mask, col.regions=ds_cols, xlab="", ylab="", maxpixels=1e6) +
  latticeExtra::layer(sp.polygons(esmk.mask))

dev.off()


# Soil fertility ----------------------------------------------------------

sfc.mask <- as.factor(sfc.mask)
sfc_rat <- levels(sfc.mask)[[1]]
sfc_rat[["soil_fertility_class"]] <- c("herb-rich", "herb-rich like", "mesic", 
                                       "semi-xeric", "xeric")
levels(sfc.mask) <- sfc_rat

sfc_cols <- rev(brewer.pal(5, "BrBG"))

png(file="figs/Figure1/levelplots/Fig1_soil_fertility_class.png", width=950, 
    height=950)

levelplot(sfc.mask, col.regions=sfc_cols, xlab="", ylab="", maxpixels=1e6) +
  latticeExtra::layer(sp.polygons(esmk.mask))

dev.off()

# Masks -------------------------------------------------------------------

# For the various masks, use the following coding:
# PAs = 1
# WKHs = 2
# METSO = 3
#
# Reclass and merge the masks

wkh.mask.reclassed <- wkh.mask
wkh.mask.reclassed[wkh.mask.reclassed == 1] <- 2

# METSO-deals still have their ID assigned
metso.mask.reclassed <- metso.mask
metso.mask.reclassed[metso.mask.reclassed > 0] <- 3

masks <- merge(pa.mask, wkh.mask.reclassed, metso.mask.reclassed)

masks <- as.factor(masks)
masks_rat <- levels(masks)[[1]]
masks_rat[["type"]] <- c("PA", "WKH", "METSO")
levels(masks) <- masks_rat

masks_cols <- brewer.pal(3, "Dark2")

png(file="figs/Figure1/levelplots/Fig1_validation_data.png", width=950, 
    height=950)

levelplot(masks, col.regions=masks_cols, xlab="", ylab="", maxpixels=1e6) +
  latticeExtra::layer(sp.polygons(esmk.mask))

dev.off()
