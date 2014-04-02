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

# MSNFI without sfc classes -----------------------------------------------

rankr.nosfc.msnfi.abf.pe.w <- rank_raster(nosfc.msnfi.abf.pe.w)
rankr.nosfc.msnfi.abf.pe.w.cmat <- rank_raster(nosfc.msnfi.abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p1 <- levelplot(rankr.nosfc.msnfi.abf.pe.w, FUN.margin=median,
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors), 
                at=z_colors_spectral$values, colorkey=z_color_key)
p2 <- levelplot(rankr.nosfc.msnfi.abf.pe.w.cmat, FUN.margin=median,
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors),
                at=z_colors_spectral$values, colorkey=z_color_key)

# MSNFI with sfc classes --------------------------------------------------

rankr.msnfi.abf.pe.w <- rank_raster(msnfi.abf.pe)
rankr.msnfi.abf.pe.w.cmat <- rank_raster(msnfi.abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p3 <- levelplot(rankr.msnfi.abf.pe.w, FUN.margin=median, 
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors),
                at=z_colors_spectral$values, colorkey=z_color_key)
p4 <- levelplot(rankr.msnfi.abf.pe.w.cmat, FUN.margin=median, 
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors),
                at=z_colors_spectral$values, colorkey=z_color_key)

# All data ----------------------------------------------------------------
  
rankr.abf.pe.w <- rank_raster(abf.pe.w)
rankr.abf.pe.w.cmat <- rank_raster(abf.pe.w.cmat)
#plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
#     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)

p5 <- levelplot(rankr.abf.pe.w, FUN.margin=median, 
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors),
                at=z_colors_spectral$values, colorkey=z_color_key)
p6 <- levelplot(rankr.abf.pe.w.cmat, FUN.margin=median, 
                maxpixels=1e6,
                par.settings=rasterTheme(region=z_colors_spectral$colors),
                at=z_colors_spectral$values, colorkey=z_color_key)