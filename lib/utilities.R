#' Fix feature names for ESMK data
#' 
#' Original featurenames are of format:
#' 
#' "index_kuusi_kp_1_60"
#' 
#' where most of the information is not needed. Strip unnecessary substrings
#' and replace soil fertility code [1, 5] with the actual description. Also
#' convert everything to English.
#' 
#' @param x character vector of feature names
#' @return feature_names character vector of fixed feature names
#' 
fix_feature_names <- function(x) {
  
  # Make a list for item language translations
  tree.spp.names <- list("manty"="pine", "mlp"="odecid", "koivu"="birch",
                         "kuusi"="spruce")
  soil.fert.names <- list("1"="herbrich", "2"="herbrichlike",
                          "3"="moist", "4"="semixeric", "5"="xeric")
  
  .clean_name <- function(y) {
    if (grepl("^index", y)) {
      y <- gsub("index_", "", y)
      y <- gsub("kp_", "", y)
      y <- gsub("_60", "", y)
      # Split with undescore and check for length; there shouldn't be more than
      # 2 items
      y <- unlist(strsplit(y, "_"))
      if (length(y) != 2) {
        stop("More than 2 elements in feature names after cleaning")
      }
      y <- paste0(tree.spp.names[y[1]], "_", soil.fert.names[y[2]])
    }
    return(y)
  }
  feature_names <- sapply(x, .clean_name, USE.NAMES=FALSE)
  return(feature_names)
}