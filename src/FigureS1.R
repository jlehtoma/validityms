library(gridExtra)
library(ProjectTemplate)
load.project()

# Compare the overlaps between different variants

# Helper function that breaks the rown names into separate columns in a data
# frame
rowname2cols <- function(x) {
  
  thresholds <- c()
  cols <- c()
  tokens <- strsplit(x, "\\.")
  for (token in tokens) {
    thresholds <- c(thresholds, paste0(token[1], ".", token[2]))
    cols <- c(cols, gsub("X", "", token[3]))
  }
  df <- data.frame(threshold=thresholds, variant=cols)
  return(df)
}

# Helper function the restructure the jaccard data
list2df <- function(x) {
  # Transform lists of data frames into data frames.
  
  x <- do.call("rbind", x)
  x <- cbind(rowname2cols(row.names(x)), x)
  row.names(x) <- 1:nrow(x)
  m.x <- melt(x, id.vars=c("threshold", "variant"))
  # Get rid of the "X" in the former column headers
  colnames(m.x) <- c("threshold", "variant1", "variant2", "value")
  m.x$variant2 <- gsub("X", "", m.x$variant2)
  return(m.x)
}

# Set the top-fractions used
thresholds <- c(0.98, 0.95, 0.90, 0.80, 0.50)

# jaccard() can take time, so use a memoized version of cross_jaccards provided
# by R.cache.
m_cross_jaccard <- addMemoization(cross_jaccard)

# Between datasets - variants 3, 10, 16 -----------------------------------

# 3 = 03_abf_pe_w
# 10 = 10_msnfi_abf_pe_w
# 16 = 16_msnfi_abf_pe_w_nosfc
ranks.abf.pe.w <- rank_rasters(project.esmk, variants=c(3, 10, 16))
j.abf.pe.w <- m_cross_jaccard(ranks.abf.pe.w, thresholds, disable.checks=TRUE)
j.abf.pe.w <- list2df(j.abf.pe.w)
sub.j.abf.pe.w <- subset(j.abf.pe.w, value != 1.0) 
sub.j.abf.pe.w <- sub.j.abf.pe.w[1:20,]
sub.j.abf.pe.w <- sub.j.abf.pe.w[c(1:10, seq(12, 20, 2)),]
sub.j.abf.pe.w$comparison <- paste(sub.j.abf.pe.w$variant2, "to", 
                                   sub.j.abf.pe.w$variant1)
sub.j.abf.pe.w$comparison <- gsub("03_abf_pe_w", "Full data", 
                                  sub.j.abf.pe.w$comparison)
sub.j.abf.pe.w$comparison <- gsub("10_msnfi_abf_pe_w", "MSNFI with categories", 
                                  sub.j.abf.pe.w$comparison)
sub.j.abf.pe.w$comparison <- gsub("16_msnfi_abf_pe_w_nosfc", "MSNFI without categories", 
                                  sub.j.abf.pe.w$comparison)


# Between datasets - variants 4, 11, 17 -----------------------------------

# 4 = 04_abf_pe_w_cmat
# 11 = 11_msnfi_abf_pe_w_cmat
# 17 = 17_msnfi_abf_pe_w_cmat_nosfc
ranks.abf.pe.w.cmat <- rank_rasters(project.esmk, variants=c(4, 11, 17))
j.abf.pe.w.cmat <- cross_jaccard(ranks.abf.pe.w.cmat, thresholds, 
                                 disable.checks=TRUE)
j.abf.pe.w.cmat <- list2df(j.abf.pe.w.cmat)
sub.j.abf.pe.w.cmat <- subset(j.abf.pe.w.cmat, value != 1.0) 
sub.j.abf.pe.w.cmat <- sub.j.abf.pe.w.cmat[1:20,]
sub.j.abf.pe.w.cmat <- sub.j.abf.pe.w.cmat[c(1:10, seq(12, 20, 2)),]
sub.j.abf.pe.w.cmat$comparison <- paste(sub.j.abf.pe.w.cmat$variant2, "to", 
                                   sub.j.abf.pe.w.cmat$variant1)
sub.j.abf.pe.w.cmat$comparison <- gsub("04_abf_pe_w_cmat", "Full data", 
                                  sub.j.abf.pe.w.cmat$comparison)
sub.j.abf.pe.w.cmat$comparison <- gsub("11_msnfi_abf_pe_w_cmat", "MSNFI with categories", 
                                  sub.j.abf.pe.w.cmat$comparison)
sub.j.abf.pe.w.cmat$comparison <- gsub("17_msnfi_abf_pe_w_cmat_nosfc", "MSNFI without categories", 
                                  sub.j.abf.pe.w.cmat$comparison)

# Within the same data, between variants ----------------------------------

ranks.abf.v2.v4 <- rank_rasters(project.esmk, variants=c(3, 4))
ranks.msnfi.abf.v2.v4 <- rank_rasters(project.esmk, variants=c(10, 11))
ranks.msnfi.nosfc.abf.v2.v4 <- rank_rasters(project.esmk, variants=c(16, 17))

j.abf.v2tov4 <- m_cross_jaccard(ranks.abf.v2.v4, thresholds, 
                                disable.checks=TRUE)
j.msnfi.abf.v2tov4 <- m_cross_jaccard(ranks.msnfi.abf.v2.v4, thresholds, 
                                      disable.checks=TRUE)
j.msnfi.nosfc.abf.v2tov4 <- m_cross_jaccard(ranks.msnfi.nosfc.abf.v2.v4, thresholds, 
                                            disable.checks=TRUE)

between.variants <- function(x, name) {
  x <- list2df(x)
  x <- subset(x, value != 1.0) 
  x <- x[1:5,]
  x$comparison <- name
  return(x)
}

j.abf.v2tov4 <- between.variants(j.abf.v2tov4, "Detailed data")

j.msnfi.abf.v2tov4 <- between.variants(j.msnfi.abf.v2tov4, "MSNFI with SFC")
j.msnfi.nosfc.abf.v2tov4  <- between.variants(j.msnfi.nosfc.abf.v2tov4,
                                              "MSNFI without SFC")

j.v2tov4 <- do.call("rbind", list("all"=j.abf.v2tov4,
                                  "msnfi"=j.msnfi.abf.v2tov4,
                                  "msnfi-nosfc"=j.msnfi.nosfc.abf.v2tov4))

# Plot the results --------------------------------------------------------

png(file="figs/Figure3/Fig3A.png", width=800, height=900)

# Between the data sets
p1 <- ggplot(sub.j.abf.pe.w, aes(x=threshold, y=value, group=comparison,
                               color=comparison))
p1 <- p1 + geom_line(size=1.0) + geom_point(size=3.0) + 
        xlab("\nTop fraction of the landscape") +
        ylab("Jaccard index\n") + ylim(0, 1) + 
        scale_x_discrete(labels=c("50%", "20%", "10%", "5%", "2%")) + 
        theme_bw() +
        ggtitle("Spatial overlap between datasets for variants abf_pe_w")

p2 <- ggplot(sub.j.abf.pe.w.cmat, aes(x=threshold, y=value, group=comparison,
                                color=comparison))
p2 <- p2 + geom_line(size=1.0) + geom_point(size=3.0) + 
        xlab("\nTop fraction of the landscape") +
        ylab("Jaccard index\n") + ylim(0, 1) + 
        scale_x_discrete(labels=c("50%", "20%", "10%", "5%", "2%")) + 
        theme_bw() +
        ggtitle("Spatial overlap between datasets for variants abf_pe_w_cmat")

grid.arrange(p1, p2, ncol=1)

dev.off()

png(file="figs/Figure3/Fig3B.png", width=800, height=600)

# Between variants
p3 <- ggplot(j.v2tov4, aes(x=threshold, y=value, group=comparison,
                                  color=comparison))
p3 + geom_line(size=1.0) + geom_point(size=3.0) + 
        xlab("\nTop fraction of the landscape") +
        ylab("Jaccard index\n") + ylim(0, 1) + 
        scale_x_discrete(labels=c("50%", "20%", "10%", "5%", "2%")) + 
        theme_bw() +
        ggtitle("Spatial overlap between variants 2-4")
dev.off()
