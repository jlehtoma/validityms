library(rasterVis)
library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the colors used to spectral divergent
z_colors_spectral <- zlegend('spectral')

# MSNFI without sfc classes -----------------------------------------------

rankr.nosfc.msnfi.abf.pe.w <- rank_raster(nosfc.msnfi.abf.pe.w)
rankr.nosfc.msnfi.abf.pe.w.cmat <- rank_raster(nosfc.msnfi.abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p1 <- levelplot(rankr.nosfc.msnfi.abf.pe.w, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))
p2 <- levelplot(rankr.nosfc.msnfi.abf.pe.w.cmat, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))

# MSNFI with sfc classes --------------------------------------------------

rankr.msnfi.abf.pe.w <- rank_raster(msnfi.abf.pe)
rankr.msnfi.abf.pe.w.cmat <- rank_raster(msnfi.abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p3 <- levelplot(rankr.msnfi.abf.pe.w, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))
p4 <- levelplot(rankr.msnfi.abf.pe.w.cmat, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))

# All data ----------------------------------------------------------------
  
rankr.abf.pe.w <- rank_raster(abf.pe.w)
rankr.abf.pe.w.cmat <- rank_raster(abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p5 <- levelplot(rankr.abf.pe.w, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))
p6 <- levelplot(rankr.abf.pe.w.cmat, FUN.margin=median, 
                par.settings=rasterTheme(region=z_colors_spectral$colors))