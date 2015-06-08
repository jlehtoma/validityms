library(RColorBrewer)
library(rasterVis)
library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the colors used to spectral divergent
z_colors_spectral <- zlegend('spectral')

z_colors_RdYlBu <- z_colors_spectral
z_colors_RdYlBu$colors <- rev(brewer.pal(7, "RdYlBu"))

# Construct a suitable color key for levelplots
z_color_key <- list(at=c(z_colors_RdYlBu$values),
                    labels=list(labels=z_colors_RdYlBu$labels,
                                at=z_colors_RdYlBu$values))

# Custom function for calculating to row and col stats for levelplots
top.fraction <- function(x, fraction=0.9) {
  return(sum(x[x >= fraction]))
}

# Limits for x and y marginal plot, through trial and error
x.lim <- c(0, 150)
y.lim <- c(0, 150)

x.scale.none <- list(cex=0, alternating=1)
y.scale.none <- list(cex=0, alternating=1)

# MSNFI without sfc classes -----------------------------------------------

png(file="figs/Figure4/levelplots/p%d.png", width=860, height=860)

rankr.V1 <- rank_raster(V1)
rankr.V2 <- rank_raster(V2)

levelplot(rankr.V1, FUN.margin=top.fraction, maxpixels=1e6, 
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none), 
          scales.margin=list(x=x.lim, y=y.lim))
levelplot(rankr.V2, FUN.margin=top.fraction, maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none),
          scales.margin=list(x=x.lim, y=y.lim))

# MSNFI with sfc classes --------------------------------------------------

rankr.V3 <- rank_raster(V3)
rankr.V4 <- rank_raster(V4)

levelplot(rankr.V3, FUN.margin=top.fraction, maxpixels=1e6, 
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none),
          scales.margin=list(x=x.lim, y=y.lim))
levelplot(rankr.V4, FUN.margin=top.fraction, maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none),
          scales.margin=list(x=x.lim, y=y.lim))

# All data ----------------------------------------------------------------
  
rankr.V5 <- rank_raster(V5)
rankr.V6 <- rank_raster(V6)

levelplot(rankr.V5, FUN.margin=top.fraction, maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none),
          scales.margin=list(x=x.lim, y=y.lim))
levelplot(rankr.V6, FUN.margin=top.fraction, maxpixels=1e6,
          par.settings=rasterTheme(region=z_colors_RdYlBu$colors), 
          at=z_colors_RdYlBu$values, colorkey=NULL,
          axis.margin=TRUE,
          scales=list(x=x.scale.none, y=y.scale.none),
          scales.margin=list(x=x.lim, y=y.lim))

dev.off()
