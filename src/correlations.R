library(ProjectTemplate)
load.project()

# Correlations ------------------------------------------------------------

pairs(ranks.abf.pe.w, method="kendall")