Taiwan<-"C:/Users/dan91/Rstudio/data/直轄市、縣(市)界線檔(TWD97經緯度)1130719/COUNTY_MOI_1130718.shp"
Taiwan<-vect(Taiwan)
e <- ext(120, 122.5, 21.5, 25.5)
ML<-terra::intersect(Taiwan, e)
color<-ifelse(ML$COUNTYID %in% c("N","P","B","D","K","Q","E","O"),"lightblue","lightgray")
plot(ML, 
     main="Xeruca formosensis", font.main=4,
     col=color)

gbif_landcrab <- occ_search(scientificName = "Xeruca formosensis", 
                          hasCoordinate=T, 
                          basisOfRecord='HUMAN_OBSERVATION', 
                          limit = 1000)
gbif_landcrab <- gbif_landcrab$data
points(gbif_landcrab$decimalLongitude, 
       gbif_landcrab$decimalLatitude, 
       col='hotpink1',
       pch=16,
       cex=0.5)


