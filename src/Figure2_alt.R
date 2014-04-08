library(rasterVis)
library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the colors used to spectral divergent
z_colors_spectral <- zlegend('spectral')
# Construct a suitable color key for levelplots
z_color_key <- list(at=c(z_colors_spectral$values),
                    labels=list(labels=z_colors_spectral$labels,
                                at=z_colors_spectral$values))

# Custom function for calculating to row and col stats for levelplots
top.fraction <- function(x, fraction=0.9) {
  return(sum(x[x >= fraction]))
}

# MSNFI without sfc classes -----------------------------------------------

png(file="figs/levelplots/p%d.png", width=820, height=820)

rankr.nosfc.msnfi.abf.pe.w <- rank_raster(nosfc.msnfi.abf.pe.w)
rankr.nosfc.msnfi.abf.pe.w.cmat <- rank_raster(nosfc.msnfi.abf.pe.w.cmat)
stack.nosfc.msnfi.abf <- stack(rankr.nosfc.msnfi.abf.pe.w,
                               rankr.nosfc.msnfi.abf.pe.w.cmat)

levelplot(rankr.nosfc.msnfi.abf.pe.w, FUN.margin=top.fraction, 
          maxpixels=1e6, 
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))
levelplot(rankr.nosfc.msnfi.abf.pe.w.cmat, FUN.margin=top.fraction, 
          maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))

# MSNFI with sfc classes --------------------------------------------------

rankr.msnfi.abf.pe.w <- rank_raster(msnfi.abf.pe)
rankr.msnfi.abf.pe.w.cmat <- rank_raster(msnfi.abf.pe.w.cmat)

levelplot(rankr.msnfi.abf.pe.w, FUN.margin=top.fraction, 
          maxpixels=1e6, 
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))
levelplot(rankr.msnfi.abf.pe.w.cmat, FUN.margin=top.fraction, 
          maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))

# All data ----------------------------------------------------------------
  
rankr.abf.pe.w <- rank_raster(abf.pe.w)
rankr.abf.pe.w.cmat <- rank_raster(abf.pe.w.cmat)

levelplot(rankr.abf.pe.w, FUN.margin=top.fraction, 
          maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))
levelplot(rankr.abf.pe.w.cmat, FUN.margin=top.fraction, 
          maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_spectral$colors), 
          at=z_colors_spectral$values, colorkey=z_color_key,
          scales=list(draw=FALSE))

dev.off()