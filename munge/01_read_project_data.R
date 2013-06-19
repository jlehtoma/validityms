# Latest project, basically the runs done by Antti in septemeber re-run in
# Viikki

library(zonator)

# Set the data source
if (.Platform$OS.type == "unix") {
  root <- "/home/jlehtoma/Dropbox/Documents/Manuscripts/validity_ms/data/130315/analyysi"
} else {
  root <- "C:\\Data\\ESMK\\analyysi"
}

project.130315 <- new("Zproject", root=root)