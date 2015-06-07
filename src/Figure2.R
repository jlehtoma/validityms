# Load required packages
library(gridExtra)
library(raster)
library(rasterVis)
library(ProjectTemplate)
load.project()

# Graphic settings --------------------------------------------------------

p.strip <- list(cex=1.5, lines=1, fontface='bold')
ckey <- list(labels=list(cex=1.5), height=0.5)
x.scale <- list(cex=1, alternating=1)
x.scale.none <- list(cex=0, alternating=1)
y.scale <- list(cex=1, alternating=1)
y.scale.none <- list(cex=0, alternating=1)
img_width <- 960
img_height <- 960

# Data source -------------------------------------------------------------

## Add a landcover column to the Raster Attribute Table
ds.mask <- as.factor(ds.mask)
ds_rat <- levels(ds.mask)[[1]]
ds_rat[["data_source"]] <- c("Detailed\n(NHS)", "Detailed\n(FFC)", 
                             "Coarse\n(FRI)")
levels(ds.mask) <- ds_rat

ds_cols <- brewer.pal(3, "Dark2")

#png(file="figs/Figure2/levelplots/Fig2_data_sources.png", width=img_width, 
#    height=img_height)

ds_plot <- levelplot(ds.mask, col.regions=ds_cols, xlab="", ylab="", maxpixels=1e6,
                     colorkey=ckey, par.strip.text=p.strip, 
                     scales=list(x=x.scale.none, y=y.scale.none)) + 
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

#masks_cols <- rev(brewer.pal(3, "Paired"))
# This is rev(brewer.pal(3, "Paired")) manually darkened by 30%
# http://www.hexcolortool.com/
masks_cols <- c("#66933E", "#B04116", "#002C68")

#png(file="figs/Figure2/levelplots/Fig2_validation_data.png", width=img_width, 
#    height=img_height)

masks_plot <- levelplot(masks, col.regions=masks_cols, xlab="", ylab="", 
                        maxpixels=1e6, colorkey=ckey, par.strip.text=p.strip, 
                        scales=list(x=x.scale.none, y=y.scale.none)) + 
  latticeExtra::layer(sp.polygons(esmk.mask))

#dev.off()

png(file="figs/Figure2/Fig2_maps.png", width=1280, height=550)

grid.arrange(ds_plot, masks_plot, nrow=1)

dev.off()

