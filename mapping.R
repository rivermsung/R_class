name <- LETTERS[1:10]
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
               -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
              36.2, 39, 41.6, 36.9)
stations <- cbind(longitude, latitude)
# Simulated rainfall data
set.seed(0)
precip <- round((runif(length(latitude))*10)^3)


psize <- 1 + precip/500
plot(stations, cex=psize, pch=20, col='red', main='Precipitation')
# add names to plot
text(stations, name, pos=4)
# add a legend
breaks <- c(100, 250, 500, 1000)
legend.psize <- 1+breaks/500
legend("topright", legend=breaks, pch=20, pt.cex=legend.psize, col='red', bg='gray')


lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
x <- cbind(lon, lat)
plot(stations, main='Precipitation')
polygon(x, col='blue', border='lightblue')
lines(stations, lwd=3, col='red')
points(x, cex=2, pch=20)
points(stations, cex=psize, pch=20, col='red', main='Precipitation')

##vector file
filename1 <- system.file("ex/lux.shp", package="terra")
basename(filename1)

#create SpatVector using "vect"
s1 <- vect(filename1)
s1

TWN <- gadm(country="TWN", level=1, path="C:/Users/dan91/Rstudio/data")

#overwrite
TWN <- vect('C:/Users/dan91/Rstudio/data/gadm/gadm41_TWN_1_pk.rds')
outfile1 <- "data/shp_TWN.shp"
writeVector(TWN, outfile1, overwrite=TRUE)

##raster file
f <- system.file("ex/logo.tif", package="terra")
#read raster file using "rast"
r <- rast(f)

ele <-elevation_30s("TWN", path="C:/Users/dan91/Rstudio/data")

#download another Taiwan map
url <- 'https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=72874C55-884D-4CEA-B7D6-F60B0BE85AB0'
path1 <- tempfile(fileext = ".zip")
if (file.exists(path1))  'file alredy exists' else download.file(url, path1, mode="wb")
zip::unzip(zipfile = path1,exdir = 'data')

Taiwan <- "data/COUNTY_MOI_1130718.shp"
Taiwan <-vect(Taiwan)

#extract the attributes (data.frame)
d <- as.data.frame(Taiwan)
head(d)

z <- rast(Taiwan)
dim(z) <- c(2,2)
values(z) <- 1:4
names(z) <- 'Zone'
z <- as.polygons(z)
z

z1 <- z[1,]
z2 <- z[2,]
z3 <- z[3,]
z4 <- z[4,]
plot(Taiwan)
plot(z, add=TRUE, border='blue', lwd=5)
plot(z3, add=TRUE, border='red', lwd=2, col='red')

b <- rbind(Taiwan, z)
head(b)
tail(b)

Taiwan$region<-c(rep("Others",6), rep("North",3), rep("Others",2), "North", rep("Others",10))
pa <- aggregate(Taiwan, by='region')
za <- aggregate(z)
plot(za, col='light gray', border='light gray', lwd=5)
plot(pa, add=TRUE, col=rainbow(2), lwd=3, border='white')

#erase the overlap
e1 <- erase(Taiwan,z1)
e2 <- erase(e1,z3 )
e3 <- erase(e2,z4 )
plot(e3)

#intersect相交
i <- terra::intersect(Taiwan, z3)
plot(i)

e <- ext(119, 123, 21, 26)
te <- crop(Taiwan, e)
plot(Taiwan)
plot(e, add=TRUE, lwd=3, col="red")
plot(te, col='light blue', add=TRUE)
plot(e, add=TRUE, lwd=3, border="blue")

pts <- matrix(c(117, 122, 117, 122, 15, 15, 23, 23), ncol=2)
spts <- vect(pts, crs=crs(Taiwan))
plot(z, col='light blue', lwd=2)
points(spts, col='light gray', pch=20, cex=6)
text(spts, 1:nrow(pts), col='red', font=2, cex=1.5)
lines(Taiwan, col='blue', lwd=2)

filename <- system.file("ex/elev.tif", package="terra")
basename(filename)
r <- rast(filename)
sources(r)
plot(r, main="SpatRaster from file")

tai.pop <- rast("C:/Users/dan91/Rstudio/data/twn-poppopmap15adj/popmap15adj.tif")
par(mfrow=c(1,2))
plot(log(tai.pop+1), main="Taiwan - log population Density (2015)")

ele <-elevation_30s("TWN", path="C:/Users/dan91/Rstudio/data")
ggplot()+
  layer_spatial(ele)+
  scale_fill_continuous(na.value = 'transparent', name='Elevation (m)')+
  ggspatial::annotation_north_arrow(
    location = "tl", which_north = "true",
    style = ggspatial::north_arrow_nautical(fill = c("grey40", "white"), line_col = "grey20"))+
  ggspatial::annotation_scale () +
  theme_bw()

plot(TWN, c("NAME_1", ""), col=rainbow(25))

d <- aggregate(TWN, "NAME_1")
plot(TWN, col="light blue", lty=2, lwd=2)
lines(d, lwd=5)
lines(d, col="white", lwd=1)
text(TWN, "NAME_1", cex=.8, halo=TRUE)

plot(ele)
lines(TWN, lwd=2)
set.seed(12)
xy <- spatSample(ele, 20, "random", na.rm=TRUE, xy=TRUE)
points(xy, pch=20, col="red", cex=2)

bg <- get_tiles(ext(Taiwan))
plotRGB(bg)
lines(TWN, col="blue", lwd=3)

# query
TW.bathy <- getNOAA.bathy(lon1=118,lon2=124, lat1=21,lat2=26,resolution=1) # don't put too wide / resolution: 1 
# define palette
blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))
# make the plot
plot.bathy(TW.bathy,
           image=T,
           deepest.isobath=c(-6000,-120,-30,0),
           shallowest.isobath=c(-1000,-60,0,0),
           step=c(2000,60,30,0),
           lwd=c(0.3,1,1,2),
           lty=c(1,1,1,1),
           col=c("grey","black","black","black"), 
           drawlabels=c(T,T,T,F),
           bpal = list(c(0,max(TW.bathy),greys(100)),c(min(TW.bathy),0,blues(100))),
           land=T, xaxs="i"
)

# Download occurrence
gbif_magpie <- occ_search(scientificName = "Urocissa caerulea", 
                          hasCoordinate=T, 
                          basisOfRecord='HUMAN_OBSERVATION', 
                          limit = 1000) 
# We are just interested in the data frame containing the records
gbif_magpie <- gbif_magpie$data
# A quick map
maps::map('world',xlim=c(119,123), ylim=c(21,26))
points(gbif_magpie$decimalLongitude, 
       gbif_magpie$decimalLatitude, col='red',  pch=19)

