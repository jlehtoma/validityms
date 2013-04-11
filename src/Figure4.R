library(raster)
result.folder <- "G:\\Data\\Metsakeskukset\\Etela-Savo\\Zonation\\Results\\130315\\analyysi"

# Results -----------------------------------------------------------------

# Build a list with variant names, 1-13 with 6 fertility classes in the data
# 14-20 with 5 feritility classes
variants <- c("14_60_5kp_abf",
              "16_60_5kp_abf_pe_w",
              "18_60_5kp_abf_pe_w_cmat_cmete",
              "20_60_5kp_abf_pe_w_cmat_cmete_cres_mask")

# Read in the rasters and create a RasterStack - FOR IMG
results <- read.result.rasters(variants, result.folder, 
                               format="_rank.img")

# Read in the mask rasters for the whole ESMK

mask.folder <- "G:/Data/Metsakeskukset/Etela-Savo/Zonation/ESMK/data/maski"

sa.mask <-  raster(file.path(mask.folder, "ESMK_slalue_avosuoton_60.img"))
mete.mask <- raster(file.path(mask.folder, "ESMK_mete_60.img"))
ysa.mask <- raster(file.path(mask.folder, "ELY_ysat_2011_2012.img"))
engo.mask <- raster(file.path(mask.folder, "ESMK_engo_A_2012_60_bin_avosuoton.img"))

img.folder <- "G:/Data/Metsakeskukset/Etela-Savo/Zonation/Results/130315/images"

# 14_60_5kp_abf
h1.sa <- histPlot(results[[1]], mask=sa.mask, add.median=F, add.mean=T, 
                  save.dir="", binwidth=0.02, title="Variant 1 by PA")
h1.mete <- histPlot(results[[1]], mask=mete.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 1 by WKH")
h1.ysa <- histPlot(results[[1]], mask=ysa.mask, add.median=F, add.mean=T, 
                   save.dir="", binwidth=0.02,title="Variant 1 by METSO-deals")
h1.engo <- histPlot(results[[1]], mask=engo.mask, add.median=F, add.mean=T, 
                   save.dir="", binwidth=0.02,title="Variant 1 by ENGO sites")

# 16_60_5kp_abf_pe_w
h2.sa <- histPlot(results[[2]], mask=sa.mask, add.median=F, add.mean=T, 
                  save.dir="", binwidth=0.02, title="Variant 2 by PA")
h2.mete <- histPlot(results[[2]], mask=mete.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 2 by WKH")
h2.ysa <- histPlot(results[[2]], mask=ysa.mask, add.median=F, add.mean=T, 
                   save.dir="", binwidth=0.02,title="Variant 2 by METSO-deals")
h2.engo <- histPlot(results[[2]], mask=engo.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 2 by ENGO sites")

# 18_60_5kp_abf_pe_w_cmat_cmete
h3.sa <- histPlot(results[[3]], mask=sa.mask, add.median=F, add.mean=T, 
                  save.dir="", binwidth=0.02, title="Variant 3 by PA")
h3.mete <- histPlot(results[[3]], mask=mete.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 3 by WKH")
h3.ysa <- histPlot(results[[3]], mask=ysa.mask, add.median=F, add.mean=T, 
                   save.dir="", binwidth=0.02,title="Variant 3 by METSO-deals")
h3.engo <- histPlot(results[[3]], mask=engo.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 3 by ENGO sites")

# 20_60_5kp_abf_pe_w_cmat_cmete_cres_mask
h4.sa <- histPlot(results[[4]], mask=sa.mask, add.median=F, add.mean=T, 
                  save.dir="", binwidth=0.02, title="Variant 4 by PA")
h4.mete <- histPlot(results[[4]], mask=mete.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 4 by WKH")
h4.ysa <- histPlot(results[[4]], mask=ysa.mask, add.median=F, add.mean=T, 
                   save.dir="", binwidth=0.02,title="Variant 4 by METSO-deals")
h4.engo <- histPlot(results[[4]], mask=engo.mask, add.median=F, add.mean=T, 
                    save.dir="", binwidth=0.02,title="Variant 4 by ENGO sites")

library(gridExtra)

grid.arrange(h1.sa, h1.mete, h1.ysa, h1.engo, 
             h2.sa, h2.mete, h2.ysa, h2.engo,
             h3.sa, h3.mete, h3.ysa, h3.engo,
             h4.sa, h4.mete, h4.ysa, h4.engo,
             nrow=4, ncol=4)

for (i in 1:nlayers(results)) {
  #histPlot(result, show=F, save.dir="C:/z/ESMK/results/images")
  histPlot(results[[i]], mask=sa.mask, add.median=T, add.mean=F, show=T, 
           save.dir=img.folder.september, binwidth=0.02)
  histPlot(results[[i]], mask=mete.mask, add.median=T, add.mean=F, show=T, 
           save.dir=img.folder.september, binwidth=0.02)
  histPlot(results[[i]], mask=ysa.mask, add.median=T, add.mean=F, show=T,
           save.dir=img.folder.september, binwidth=0.02)
}

## READ IN THE DATA ############################################################

# Input index files

setwd("G:/Data/Metsakeskukset/Etela-Savo/Zonation/ESMK/Setup")

# Get the input index files from 1_60_abf
input.files <- read.csv("1_60_abf/1_60_abf.spp", sep=" ", header=F, as.is=T)[6]
names(input.files) <- c("path")

indices.koivu <- stack(sapply(input.files$path[1:6], 
                              function(x){ named.raster(filepath=file.path(x),
                                                        name=str_replace(basename(x), 
                                                                         ".img", "")) 
                              }, 
                              USE.NAMES=F))

indices.kuusi <- stack(sapply(input.files$path[7:12], 
                              function(x){ named.raster(filepath=file.path(x),
                                                        name=str_replace(basename(x), 
                                                                         ".img", "")) 
                              }, 
                              USE.NAMES=F))

indices.mlp <- stack(sapply(input.files$path[13:18], 
                            function(x){ named.raster(filepath=file.path(x),
                                                      name=str_replace(basename(x), 
                                                                       ".img", "")) 
                            }, 
                            USE.NAMES=F))

indices.manty <- stack(sapply(input.files$path[19:24], 
                              function(x){ named.raster(filepath=file.path(x),
                                                        name=str_replace(basename(x), 
                                                                         ".img", "")) 
                              }, 
                              USE.NAMES=F))

boxplot(results.masked, notch=T)

boxplot(log(indices.koivu), ylim=c(-20, 10), main="Index koivu", ylab="log(index)")
boxplot(log(indices.kuusi), ylim=c(-20, 10), main="Index kuusi", ylab="log(index)")
boxplot(log(indices.mlp), ylim=c(-20, 10), main="Index mlp", ylab="log(index)")
boxplot(log(indices.manty), ylim=c(-20, 10), main="Index manty", ylab="log(index)")

# More stats --------------------------------------------------------------

# Calculate a similarity matrix 
# Calculate a similarity matrix based on Jaccard coefficient
similarity.mtrx <- matrix(nrow=nlayer(results), ncol=nlayer(results))
for (i in 1:nrow(similarity.mtrx)){
  for (j in 1:ncol(similarity.mtrx)) {
    similarity.mtrx[i, j] <- jaccard(results[[i]], results[[j]], 0.9)
  }
}

# Performance curves ------------------------------------------------------

curves.dir <- "C:/Data/suoajot25_34"
#curves.dir <- "C:/Program Files/zonation 3.1.6/zonation-tutorial/tutorial_output"
curves.file <- file.path(result.folder, 
                         "17_60_5kp_abf_pe_w_cmat", "output",
                         "result_17_60_5kp_abf_pe_w_cmat.grp_curves.txt")
curves <- read.grp.curves(curves.file)
plot(curves, monochrome=T, invert.x=TRUE)