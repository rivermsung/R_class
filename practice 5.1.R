gbif_landcrab <- occ_search(scientificName = "Xeruca formosensis", 
                          hasCoordinate=T, 
                          basisOfRecord='HUMAN_OBSERVATION', 
                          limit = 1000)
gbif_landcrab <- gbif_landcrab$data

TWN <- gadm(country="TWN", level=2, path="C:/Users/dan91/Rstudio/data")
plot(TWN)

