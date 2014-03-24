library(ProjectTemplate)
load.project()

# Set the colors used to spectral divergent
z_colors_spectral <- zlegend('spectral')

rankr.abf <- rank_raster(abf)
plot(rankr.abf, useRaster=TRUE, interpolate=TRUE, 
     breaks=z_colors_spectral$values, col=z_colors_spectral$colors)
