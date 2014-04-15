library(ProjectTemplate)
load.project()

# Get the rank results of different variants masked with the different 
# validation data sets

V1.pa <- mask(rank_raster(V1), pa.mask)
V3.pa <- mask(rank_raster(V3), pa.mask)

V1.pa.values <- getValues(V1.pa)
V1.pa.values <- V1.pa.values[!is.na(V1.pa.values)]
V3.pa.values <- getValues(V3.pa)
V3.pa.values <- V3.pa.values[!is.na(V3.pa.values)]

# Correlations ------------------------------------------------------------

correl <- cor(V1.pa.values, V3.pa.values, method="kendall", use="pairwise") 
correl.t <- cor.test(V1.pa.values, V3.pa.values, method="kendall")
