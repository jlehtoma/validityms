library(ProjectTemplate)
load.project()

# Define classification names
tree_spp <- c("Birch", "Spruce", "Other deciduous", "Pine")
soil_fert <- c("Herb-rich", "Herb-rich like", "Mesic", "Semi-xeric", "Xeric")
tree_x_fert <- data.frame(tree_spp=rep(tree_spp, 1, each=5),
                          soil_fert=rep(soil_fert, 4))

# Weights are exactly the sames for the duplicated feature stacks, i.e. in 
# connectivity variants V2, V4 and V6. For the weights table thus use only
# V1, V3 and V5.

V1_weights <- sppdata(V1)[,c("name", "weight")]
V3_weights <- sppdata(V3)[,c("name", "weight")]
V5_weights <- sppdata(V5)[,c("name", "weight")]

# Construct "without classes" table
wo_classes <- data.frame(tree_spp=tree_spp, weights=V1_weights$weight)

# Construct "with classes" table (weights for V3 and V5 are the same!)
w_classes <- cbind(tree_x_fert, weights=V3_weights$weight[1:20])
