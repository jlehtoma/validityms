# Latest project, basically the runs done by Antti in septemeber re-run in
# Viikki

# Set the data source
if (.Platform$OS.type == "unix") {
  root <- "/home/jlehtoma/Dropbox/Documents/Manuscripts/validity_ms/data/130315/analyysi"
  tutorial.root <- "/home/jlehtoma/temp/zonation-tutorial"
} else {
  root <- "C:\\Data\\ESMK\\analyysi"
}

project.tutorial <- new("Zproject", root=tutorial.root)

project.130315 <- new("Zproject", root=root)