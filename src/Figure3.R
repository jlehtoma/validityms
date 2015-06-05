library(gridExtra)
library(raster)
library(rasterVis)
library(ProjectTemplate)
load.project()


# Graphics parameters -----------------------------------------------------

p.strip <- list(cex=1.5, lines=1, fontface='bold')
ckey <- list(labels=list(cex=1.5), height=0.5)
x.scale <- list(cex=1, alternating=1)
x.scale.none <- list(cex=0, alternating=1)
y.scale <- list(cex=1, alternating=1)
y.scale.none <- list(cex=0, alternating=1)

# Define color scheme
sfc_cols <- rev(brewer.pal(5, "BrBG"))

sfc_classes <- c("Herb-rich", "Herb-rich like", "Mesic", "Semi-xeric", "Xeric")

# Soil fertility DETAILED --------------------------------------------------

dsfc.mask <- as.factor(dsfc.mask)
dsfc_rat <- levels(dsfc.mask)[[1]]
dsfc_rat[["soil_fertility_class"]] <- sfc_classes
levels(dsfc.mask) <- dsfc_rat

# Soil fertility COARSE ----------------------------------------------------

csfc.mask <- as.factor(csfc.mask)
csfc_rat <- levels(csfc.mask)[[1]]
csfc_rat[["soil_fertility_class"]] <- sfc_classes
levels(csfc.mask) <- csfc_rat


# Plot data ---------------------------------------------------------------

# Stack the different classifications together
sfc_plot_stack <- stack(csfc.mask, dsfc.mask)

sfc_plot <- levelplot(sfc_plot_stack, col.regions=sfc_cols, xlab="", ylab="", 
                      maxpixels=1e6, colorkey=ckey, par.strip.text=p.strip, 
                      scales=list(x=x.scale.none, y=y.scale.none),
                      names.attr=c("", "")) + 
  latticeExtra::layer(sp.polygons(esmk.mask))


#dev.off()