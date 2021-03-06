library(gridExtra)
library(ProjectTemplate)
load.project()

cross_range_jaccard <- function(raster1, raster2, thresholds, ...) {
  
  jaccards <- matrix(nrow=length(thresholds), ncol=length(thresholds))
    
  for (i in 1:length(thresholds)) {
    for (j in 1:length(thresholds)) {
    
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
    }
    jaccards <- as.data.frame(jaccards)
  }
  return(jaccards)
}

m_cross_range_jaccard <- addMemoization(cross_range_jaccard)

classes <- c("0.0 - 0.1", "0.1 - 0.2", "0.2 - 0.3", "0.3 - 0.4", "0.4 - 0.5", 
             "0.5 - 0.6", "0.6 - 0.7", "0.7 - 0.8", "0.8 - 0.9", "0.9 - 1.0")
thresholds <- seq(0.1, 1, 0.1)

# Variants 1 and 3
ranks.V1.V3 <- rank_rasters(project.esmk, variants=c(16, 10))
j.ranks.V1.V3 <- m_cross_range_jaccard(ranks.V1.V3[[1]], ranks.V1.V3[[2]], 
                                       thresholds)
colnames(j.ranks.V1.V3) <- classes
j.ranks.V1.V3$classes <- classes

# Variants 1 and 5
ranks.V1.V5 <- rank_rasters(project.esmk, variants=c(16, 3))
j.ranks.V1.V5 <- m_cross_range_jaccard(ranks.V1.V5[[1]], ranks.V1.V5[[2]], 
                                       thresholds)
colnames(j.ranks.V1.V5) <- classes
j.ranks.V1.V5$classes <- classes

# Variants 3 and 5
ranks.V3.V5 <- rank_rasters(project.esmk, variants=c(10, 3))
j.ranks.V3.V5 <- m_cross_range_jaccard(ranks.V3.V5[[1]], ranks.V3.V5[[2]], 
                                       thresholds)
colnames(j.ranks.V3.V5) <- classes
j.ranks.V3.V5$classes <- classes

# Variants 2 and 4
ranks.V2.V4 <- rank_rasters(project.esmk, variants=c(17, 11))
j.ranks.V2.V4 <- m_cross_range_jaccard(ranks.V2.V4[[1]], ranks.V2.V4[[2]], 
                                       thresholds)
colnames(j.ranks.V2.V4) <- classes
j.ranks.V2.V4$classes <- classes

# Variants 2 and 6
ranks.V2.V6 <- rank_rasters(project.esmk, variants=c(17, 4))
j.ranks.V2.V6 <- m_cross_range_jaccard(ranks.V2.V6[[1]], ranks.V2.V6[[2]], 
                                       thresholds)
colnames(j.ranks.V2.V6) <- classes
j.ranks.V2.V6$classes <- classes

# Variants 4 and 6
ranks.V4.V6 <- rank_rasters(project.esmk, variants=c(11, 4))
j.ranks.V4.V6 <- m_cross_range_jaccard(ranks.V4.V6[[1]], ranks.V4.V6[[2]], 
                                       thresholds)
colnames(j.ranks.V4.V6) <- classes
j.ranks.V4.V6$classes <- classes

# Variants 1 and 2
ranks.V1.V2 <- rank_rasters(project.esmk, variants=c(16, 17))
j.ranks.V1.V2 <- m_cross_range_jaccard(ranks.V1.V2[[1]], ranks.V1.V2[[2]], 
                                       thresholds)
colnames(j.ranks.V1.V2) <- classes
j.ranks.V1.V2$classes <- classes

# Variants 3 and 4
ranks.V3.V4 <- rank_rasters(project.esmk, variants=c(10, 11))
j.ranks.V3.V4 <- m_cross_range_jaccard(ranks.V3.V4[[1]], ranks.V3.V4[[2]], 
                                       thresholds)
colnames(j.ranks.V3.V4) <- classes
j.ranks.V3.V4$classes <- classes

# Variants 5 and 6
ranks.V5.V6 <- rank_rasters(project.esmk, variants=c(3, 4))
j.ranks.V5.V6 <- m_cross_range_jaccard(ranks.V5.V6[[1]], ranks.V5.V6[[2]], 
                                       thresholds)
colnames(j.ranks.V5.V6) <- classes
j.ranks.V5.V6$classes <- classes

# Plot between input data sets  ---------------------------------------------

low.color <- "white"
high.color <- "red"
high.color.B <- "steelblue"

low.limit <- 0.0
high.limit.A <- 0.6
high.limit.B <- 0.3

axis.theme <- theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

m.j.ranks.V1.V3 <- melt(j.ranks.V1.V3, id.vars=c("classes"))
p1 <- ggplot(m.j.ranks.V1.V3, aes(x=variable, y=classes))
p1 <- p1 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R1") +
  xlab("Priority range R3") + axis.theme +
  ggtitle("R1 and R3")

m.j.ranks.V1.V5 <- melt(j.ranks.V1.V5, id.vars=c("classes"))
p2 <- ggplot(m.j.ranks.V1.V5, aes(x=variable, y=classes))
p2 <- p2 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R1") +
  xlab("Priority range R5") + axis.theme +
  ggtitle("R1 and R5")

m.j.ranks.V3.V5 <- melt(j.ranks.V3.V5, id.vars=c("classes"))
p3 <- ggplot(m.j.ranks.V3.V5, aes(x=variable, y=classes))
p3 <- p3 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R3") +
  xlab("Priority range R5") + axis.theme +
  ggtitle("R3 and R5")

m.j.ranks.V2.V4 <- melt(j.ranks.V2.V4, id.vars=c("classes"))
p4 <- ggplot(m.j.ranks.V2.V4, aes(x=variable, y=classes))
p4 <- p4 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R2") +
  xlab("Priority range R4") + axis.theme +
  ggtitle("R2 and R4")

m.j.ranks.V2.V6 <- melt(j.ranks.V2.V6, id.vars=c("classes"))
p5 <- ggplot(m.j.ranks.V2.V6, aes(x=variable, y=classes))
p5 <- p5 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R2") +
  xlab("Priority range R6") + axis.theme +
  ggtitle("R2 and R6")

m.j.ranks.V4.V6 <- melt(j.ranks.V4.V6, id.vars=c("classes"))
p6 <- ggplot(m.j.ranks.V4.V6, aes(x=variable, y=classes))
p6 <- p6 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color, 
                      limits=c(low.limit, high.limit.A)) +
  ylab("Priority range R4") +
  xlab("Priority range R6") + axis.theme +
  ggtitle("R4 and R6")

#grid.arrange(p1, p2, p3, p4, p5, p6, nrow=3, ncol=2)


# Plot within input data sets ---------------------------------------------

m.j.ranks.V1.V2 <- melt(j.ranks.V1.V2, id.vars=c("classes"))
p7 <- ggplot(m.j.ranks.V1.V2, aes(x=variable, y=classes))
p7 <- p7 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color.B, limits=c(0, 1)) +
  ylab("Priority range R1") +
  xlab("Priority range R2") + axis.theme +
  ggtitle("R1 and R2")

m.j.ranks.V3.V4 <- melt(j.ranks.V3.V4, id.vars=c("classes"))
p8 <- ggplot(m.j.ranks.V3.V4, aes(x=variable, y=classes))
p8 <- p8 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color.B, limits=c(0, 1)) +
  ylab("Priority range R3") +
  xlab("Priority range R4") + axis.theme +
  ggtitle("R3 and R4")

m.j.ranks.V5.V6 <- melt(j.ranks.V5.V6, id.vars=c("classes"))
p9 <- ggplot(m.j.ranks.V5.V6, aes(x=variable, y=classes))
p9 <- p9 + geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = low.color, high = high.color.B, limits=c(0, 1)) +
  ylab("Priority range R5") +
  xlab("Priority range R6") + axis.theme +
  ggtitle("R5 and R6")

grid.arrange(p1, p2, p3, p4, p5, p6,p7, p8, p9, nrow=3, ncol=3,
             main="Similarity of priority ranges between runs")
