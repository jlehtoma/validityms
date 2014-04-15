library(gridExtra)
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

m_cross_range_jaccard <- addMemoization(cross_range_jaccard)

classes <- c("0-10", "10-20", "20_30", "30-40", "40-50", "50-60", "60-70", 
             "70-80", "80-90", "90-100")
thresholds <- seq(0.1, 1, 0.1)

# Variants 1 and 3
ranks.V1.V3 <- rank_rasters(project.esmk, variants=c(3, 10))
j.ranks.V1.V3 <- m_cross_range_jaccard(ranks.V1.V3[[1]], ranks.V1.V3[[2]], 
                                       thresholds)
colnames(j.ranks.V1.V3) <- classes
j.ranks.V1.V3$classes <- classes

# Variants 2 and 4
ranks.V2.V4 <- rank_rasters(project.esmk, variants=c(4, 11))
j.ranks.V2.V4 <- m_cross_range_jaccard(ranks.V2.V4[[1]], ranks.V2.V4[[2]], 
                                       thresholds)
colnames(j.ranks.V2.V4) <- classes
j.ranks.V2.V4$classes <- classes

# Variants 1 and 2
ranks.V1.V2 <- rank_rasters(project.esmk, variants=c(3, 4))
j.ranks.V1.V2 <- m_cross_range_jaccard(ranks.V1.V2[[1]], ranks.V1.V2[[2]], 
                                       thresholds)
colnames(j.ranks.V1.V2) <- classes
j.ranks.V1.V2$classes <- classes


# Plot heatmaps -----------------------------------------------------------

m.j.ranks.V1.V3 <- melt(j.ranks.V1.V3, id.vars=c("classes"))
p1 <- ggplot(m.j.ranks.V1.V3, aes(x=variable, y=classes))
p1 <- p1 + geom_tile(aes(fill = value)) + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0, 0.3)) +
  ylab("Priority bin for variant V1") +
  xlab("Priority bin for variant V3") +
  ggtitle("Similarity of priority bins for variants V1 and V3")

m.j.ranks.V2.V4 <- melt(j.ranks.V2.V4, id.vars=c("classes"))
p2 <- ggplot(m.j.ranks.V2.V4, aes(x=variable, y=classes))
p2 <- p2 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0, 0.3)) +
  ylab("Priority bin for variant V2") +
  xlab("Priority bin for variant V4") +
  ggtitle("Similarity of priority bins for variants V2 and V4")

m.j.ranks.V1.V2 <- melt(j.ranks.V1.V2, id.vars=c("classes"))
p3 <- ggplot(m.j.ranks.V1.V2, aes(x=variable, y=classes))
p3 <- p3 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0, 1)) +
  ylab("Priority bin for variant 3") +
  xlab("Priority bin for variant 4") +
  ggtitle("Similarity of priority bins for abf_pe_w vs abf_pe_w_cmat")

grid.arrange(p1, p2, p3, nrow=1)


