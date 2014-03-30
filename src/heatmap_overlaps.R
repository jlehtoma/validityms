library(ProjectTemplate)
load.project()

cross_range_jaccard <- function(raster1, raster2, thresholds, ...) {
  
  jaccards <- matrix(nrow=length(thresholds), ncol=length(thresholds))
    
  for (i in 1:length(thresholds)) {
    for (j in 1:length(thresholds)) {
    
      # See the complement, if it's not NA then the pair has already been
      # compared
      if (is.na(jaccards[j, i])) {
        i.min <- thresholds[i] - 0.1
        j.min <- thresholds[j] - 0.1
        i.max <- thresholds[i]
        j.max <- thresholds[j]
        message(paste0("Calculating Jaccard index between ", 
                       names(raster1), "[", i.min, ", ", i.max, "] and ", 
                       names(raster2), "[", j.min, ", ", j.max, "]"))
        jaccards[i, j] <- jaccard(raster1, raster2, 
                                  x.min=i.min, x.max=i.max,
                                  y.min=j.min, y.max=j.max, ...)
        #jaccards[i, j] <- rnorm(1)
      } else {
        jaccards[i, j]  <- jaccards[j, i]
      }
      
    }
    jaccards <- as.data.frame(jaccards)
  }
  return(jaccards)
}
thresholds <- seq(0.1, 1, 0.1)
ranks.abf.pe <- rank_rasters(project.esmk, variants=c(2, 9))
j <- cross_range_jaccard(ranks.abf.pe[[1]], ranks.abf.pe[[2]], thresholds)
