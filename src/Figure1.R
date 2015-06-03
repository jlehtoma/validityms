# Load required packages
library(gridExtra)
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


# Graphic settings --------------------------------------------------------

p.strip <- list(cex=1.5, lines=2, fontface='bold')
ckey <- list(labels=list(cex=1.5), height=0.5)
x.scale <- list(cex=1, alternating=1)
y.scale.left <- list(cex=1, alternating=1)
y.scale.right <- list(cex=0, alternating=1)
img_width <- 960
img_height <- 960

# Data source -------------------------------------------------------------

## Add a landcover column to the Raster Attribute Table
ds.mask <- as.factor(ds.mask)
ds_rat <- levels(ds.mask)[[1]]
ds_rat[["data_source"]] <- c("FPS", "FFC", "MS-NFI")
levels(ds.mask) <- ds_rat

ds_cols <- brewer.pal(3, "Dark2")

#png(file="figs/Figure1/levelplots/Fig1_data_sources.png", width=img_width, 
#    height=img_height)

ds_plot <- levelplot(ds.mask, col.regions=ds_cols, xlab="", ylab="", maxpixels=1e6,
                     colorkey=ckey, par.strip.text=p.strip, 
                     scales=list(x=x.scale, y=y.scale.right)) + 
  latticeExtra::layer(sp.polygons(esmk.mask))

#dev.off()

# Soil fertility ----------------------------------------------------------

sfc.mask <- as.factor(sfc.mask)
sfc_rat <- levels(sfc.mask)[[1]]
sfc_rat[["soil_fertility_class"]] <- c("Herb-rich", "Herb-rich like", "Mesic", 
                                       "Semi-xeric", "Xeric")
levels(sfc.mask) <- sfc_rat

sfc_cols <- rev(brewer.pal(5, "BrBG"))

#png(file="figs/Figure1/levelplots/Fig1_soil_fertility_class.png", width=img_width, 
#    height=img_height)

sfc_plot <- levelplot(sfc.mask, col.regions=sfc_cols, xlab="", ylab="", 
                      maxpixels=1e6, colorkey=ckey, par.strip.text=p.strip, 
                      scales=list(x=x.scale, y=y.scale)) + 
  latticeExtra::layer(sp.polygons(esmk.mask))

#dev.off()

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

#png(file="figs/Figure1/levelplots/Fig1_validation_data.png", width=img_width, 
#    height=img_height)

masks_plot <- levelplot(masks, col.regions=masks_cols, xlab="", ylab="", 
                        maxpixels=1e6, colorkey=ckey, par.strip.text=p.strip, 
                        scales=list(x=x.scale, y=y.scale.left)) + 
  latticeExtra::layer(sp.polygons(esmk.mask))

#dev.off()

png(file="figs/Figure1/Fig1.png", width=1000, height=555)

grid.arrange(ds_plot, masks_plot, ncol=2)

dev.off()
