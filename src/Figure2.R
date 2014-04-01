library(gridExtra)
library(ProjectTemplate)
load.project()

# Set the plot labels
spp.labels <- c("1"="Birch", "2"="Spruce", "3"="OtherDec", "4"="Pine")
fert.labels <- c("1"="Herb-rich", "2"="Herb-rich-like", "3"="Mesic", 
                 "4"="Semi-xeric", "5"="Xeric")

low.limit <- 0.98

groups(abf.pe.w) <- rep(1:4, 5)
groupnames(abf.pe.w) <- spp.labels
groupnames(msnfi.abf.pe.w) <- spp.labels

# Performance curves by tree spp ------------------------------------------

grpcur.abf.pe.w <- curves(abf.pe.w, groups=TRUE)
p1 <- plot(grpcur.abf.pe.w, monochrome=FALSE, min=TRUE, mean=TRUE, max=TRUE,
           invert.x=FALSE, main="Tree species group")
p1 + ylim(0, 1) + ggtitle("All data abf_pe_w by tree spp")

grpcur.msnfi.abf.pe.w <- curves(msnfi.abf.pe.w, groups=TRUE)
p2 <- plot(grpcur.msnfi.abf.pe.w, monochrome=FALSE, min=TRUE, mean=TRUE, max=TRUE,
           invert.x=FALSE, main="Tree species group")
p2 + ylim(0, 1) + ggtitle("MSNFI-only abf_pe_w by tree spp")


# Calculate new grouping
groups(abf.pe.w) <- rep(1:5, 4)
groupnames(abf.pe.w) <- fert.labels

grpcur.abf.pe.w <- curves(abf.pe.w, groups=TRUE)
p3 <- plot(grpcur.abf.pe.w, monochrome=FALSE, min=FALSE, mean=FALSE, max=FALSE,
           invert.x=FALSE, main="Tree species group")
p3 + ylim(0, 1) + ggtitle("All data abf_pe_w by soil fertility class")

# Boxplots ----------------------------------------------------------------



## Boxplots by fertility class 
# Take values [0.8, 1.0], leave everything else but pr_lost out
bp.curves.1 <- curves(variant.1, lost.lower=low.limit, lost.upper=1.0, 
                      cols=c(1,8:27))

# [todo] - needs to refactored to a proper function
m.bp.curves.1 <- melt(bp.curves.1, id.vars = c("pr_lost"))
m.bp.curves.1$tree.spp <- sapply(strsplit(as.character(m.bp.curves.1$variable), 
                                          "_"), function(x){x[1]})
m.bp.curves.1$soil.fert <- sapply(strsplit(as.character(m.bp.curves.1$variable), 
                                           "_"), function(x){x[2]})
m.bp.curves.1$type <- "_loc"
m.bp.curves.1$name <- "variant1"

p <- ggplot(m.bp.curves.1, aes(factor(soil.fert), value))
p + geom_boxplot()

# Variant2 ----------------------------------------------------------------

# Get variant 4: 17_60_5kp_abf_pe_w_cmat
variant.2 <- get_variant(project.esmk, 4)
# Since the feature layers are duplicated in the spp file, we need to deal with 
# this in fixing the feature names
# Get the original number of features
nfeats <- nfeatures(variant.2) / 2
# Fix the feature names, but include all feature names only once
fixed.feature.names <- fix_feature_names(featurenames(variant.2)[1:nfeats])
# Since the feature stack is duplicated in the spp files (once for connectivity,
# once for local quality), indicate this with suffixes "_con" and "_loc"
featurenames(variant.2) <- c(paste0(fixed.feature.names, "_con"), 
                             paste0(fixed.feature.names, "_loc"))
groupnames(variant.2) <- spp.labels

#curves.2 <- curves(variant.2)
#grp.curves.2 <- curves(variant.2, groups=TRUE)
#p2 <- plot(grp.curves.2, monochrome=FALSE, 
#            invert.x=FALSE, main="Tree species group")

bp.curves.2 <- curves(variant.2, lost.lower=low.limit, lost.upper=1.0, 
                      cols=c(1,8:47))
# [todo] - needs to refactored to a proper function
m.bp.curves.2 <- melt(bp.curves.2, id.vars = c("pr_lost"))
m.bp.curves.2$tree.spp <- sapply(strsplit(as.character(m.bp.curves.2$variable), 
                                          "_"), function(x){x[1]})
m.bp.curves.2$soil.fert <- sapply(strsplit(as.character(m.bp.curves.2$variable), 
                                           "_"), function(x){x[2]})
m.bp.curves.2$type <- sapply(strsplit(as.character(m.bp.curves.2$variable), 
                                           "_"), function(x){x[3]})
m.bp.curves.2$name <- "variant2"
p <- ggplot(m.bp.curves.2, aes(factor(tree.spp), value, fill=type))
p + geom_boxplot()

# Variant3 ----------------------------------------------------------------

# Get variant 5: 18_60_5kp_abf_pe_w_cmat_cmete
variant.3 <- get_variant(project.esmk, 5)
# Since the feature layers are duplicated in the spp file, we need to deal with 
# this in fixing the feature names
# Get the original number of features, there is 1 wrscr file so remove that
nfeats <- (nfeatures(variant.3) - 1) / 4
# Fix the feature names, but include all feature names only once
fixed.feature.names <- fix_feature_names(featurenames(variant.3)[1:nfeats])
# Since the feature stack is quadruplet in the spp files (twice for 
# matrix connectivity, twice for interaction connectivity, 
# once for local quality), indicate this with suffixes "_con", "_int", and 
# "_loc"
featurenames(variant.3) <- c(paste0(fixed.feature.names, "_con"),
                             paste0(fixed.feature.names, "_conint"),
                             paste0(fixed.feature.names, "_loc"),
                             paste0(fixed.feature.names, "_int"),
                             "mv_wrscr")
spp.labels["5"] <- "wrscr.mv"
groupnames(variant.3) <- spp.labels

bp.curves.3 <- curves(variant.3, lost.lower=low.limit, lost.upper=1.0, 
                      cols=c(1,8:87))
# [todo] - needs to refactored to a proper function
m.bp.curves.3 <- melt(bp.curves.3, id.vars = c("pr_lost"))
m.bp.curves.3$tree.spp <- sapply(strsplit(as.character(m.bp.curves.3$variable), 
                                          "_"), function(x){x[1]})
m.bp.curves.3$soil.fert <- sapply(strsplit(as.character(m.bp.curves.3$variable), 
                                           "_"), function(x){x[2]})
m.bp.curves.3$type <- sapply(strsplit(as.character(m.bp.curves.3$variable), 
                                      "_"), function(x){x[3]})
m.bp.curves.3$name <- "variant3"
p <- ggplot(m.bp.curves.3, aes(factor(tree.spp), value, fill=type))
p + geom_boxplot()

# Combined ----------------------------------------------------------------

all.curves <- list("1"=m.bp.curves.1, "2"= m.bp.curves.2, "3"=m.bp.curves.3)
m.bp.all.curves <- do.call("rbind", all.curves)

cp1 <- ggplot(m.bp.all.curves, aes(factor(tree.spp), value, fill=name))
cp1 <- cp1 + geom_boxplot()

cp2 <- ggplot(m.bp.all.curves, aes(factor(soil.fert), value, fill=name))
cp2 <- cp2 + geom_boxplot()

grid.arrange(cp1, cp2, nrow=2)

#  ------------------------------------------------------------------------

#grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

# Plot just variants 7 and 14
#grid.arrange(p3, p4, nrow=1, ncol=2)
