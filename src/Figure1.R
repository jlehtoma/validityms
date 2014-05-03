# Load required packages
library(maptools)
library(raster)
library(rgdal)
library(rworldmap)


# Define LAEA projection for Europe
crs.laea <- CRS("+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +units=m +no_defs")  # Lambert Azimuthal Equal Area

# Grab the whole world, NOTE that you will also need package rworldextra
world.wgs84 <- getMap(resolution = "high")
world.laea <- spTransform(world.wgs84, crs.laea)

# Download data from gadm.org for Finland
fin.wgs84 <- getData('GADM', country='FIN', level=2, path="cache")
fin.laea <- spTransform(fin.wgs84, crs.laea)

# Grab just Southern Savonia
ssavonia.laea <- subset(fin.laea, NAME_2 == "Southern Savonia") 

world.laea@data$border <- "darkgrey"
world.laea@data[which(world.laea@data$ne_10m_adm == "FIN"),]$border = "black"

plot(world.laea, xlim = c(4000000, 5700000), 
                 ylim = c(3100000, 5350000), border=world.laea@data$border)
plot(ssavonia.laea, add=T, col="olivedrab", border="olivedrab", lwd=0.1)
box()

mar<-(adm[adm$NAME_1=="Marinduque",])plot(mar, bg="dodgerblue", axes=T)