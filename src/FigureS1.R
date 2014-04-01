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

# abf_pe
ranks.abf.pe.w <- rank_rasters(project.esmk, variants=c(3, 10))
j.classes.ranks.abf.pe.w <- m_cross_range_jaccard(ranks.abf.pe.w[[1]], 
                                                  ranks.abf.pe.w[[2]], 
                                                  thresholds)
colnames(j.classes.ranks.abf.pe.w) <- classes
j.classes.ranks.abf.pe.w$classes <- classes

# abf_pe_w_cmat
ranks.abf.pe.w.cmat <- rank_rasters(project.esmk, variants=c(4, 11))
j.classes.ranks.abf.pe.w.cmat <- m_cross_range_jaccard(ranks.abf.pe.w.cmat[[1]], 
                                                       ranks.abf.pe.w.cmat[[2]], 
                                                       thresholds)
colnames(j.classes.ranks.abf.pe.w.cmat) <- classes
j.classes.ranks.abf.pe.w.cmat$classes <- classes

# abf_pe_w vs abf_pe_w_cmat within same dataset (all data)
ranks.local.vs.cmat <- rank_rasters(project.esmk, variants=c(3, 4))
j.classes.local.vs.cmat <- m_cross_range_jaccard(ranks.local.vs.cmat[[1]], 
                                                 ranks.local.vs.cmat[[2]], 
                                                 thresholds)
colnames(j.classes.local.vs.cmat) <- classes
j.classes.local.vs.cmat$classes <- classes


# Plot heatmaps -----------------------------------------------------------

m.j.classes.ranks.abf.pe.w <- melt(j.classes.ranks.abf.pe.w, 
                                   id.vars=c("classes"))
p1 <- ggplot(m.j.classes.ranks.abf.pe.w, aes(x=variable, y=classes))
p1 <- p1 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0,1)) +
  ylab("Priority bin for variant 2") +
  xlab("Priority bin for variant 9") +
  ggtitle("Similarity of priority bins for abf_pe_w (All data vs MSNFI)")

m.j.classes.ranks.abf.pe.w.cmat <- melt(j.classes.ranks.abf.pe.w.cmat, 
                                        id.vars=c("classes"))
p2 <- ggplot(m.j.classes.ranks.abf.pe.w.cmat, aes(x=variable, y=classes))
p2 <- p2 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0,1)) +
  ylab("Priority bin for variant 4") +
  xlab("Priority bin for variant 11") +
  ggtitle("Similarity of priority bins for abf_pe_w_cmat (All data vs MSNFI)")

m.j.classes.local.vs.cmat <- melt(j.classes.local.vs.cmat, id.vars=c("classes"))
p3 <- ggplot(m.j.classes.local.vs.cmat, aes(x=variable, y=classes))
p3 <- p3 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue", limits=c(0,1)) +
  ylab("Priority bin for variant 3") +
  xlab("Priority bin for variant 4") +
  ggtitle("Similarity of priority bins for abf_pe_w vs abf_pe_w_cmat")

grid.arrange(p1, p2, p3, nrow=1)


