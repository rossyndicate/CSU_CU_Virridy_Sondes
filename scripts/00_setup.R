#this file contains all the packages,metadata, groupings and color palettes that are used in downstream scripts

### ----- Load packages ----- ###
package_load <- function(package_names){
  for(i in 1:length(package_names)){
    if(!package_names[i] %in% installed.packages()){
      install.packages(package_names[i])
    }
    library(package_names[i],character.only = TRUE)
  }
}

#vector of packages
pack_req <- c( 
  # data wrangling packages
  "tidyverse","lubridate","padr","janitor","padr", "broom","arrow",
  #spatial packages
  "sf","terra","nhdplusTools", "tigris","raster", "leaflet","tmap",
  # plotting
  "ggpubr","ggthemes","scales","corrplot","gghighlight", "geomtextpath", "ggbeeswarm","plotly", "ggpmisc","flextable",
  # web scrapping
  "rjson", "rvest", "dataRetrieval", "httr", "jsonlite", "yaml",
  #extra
  "devtools", "trend")
package_load(pack_req)

#for API pull
#devtools::install_github("steeleb/HydroVuR")

#devtools::install_github("anguswg-ucsb/cdssr")
library(cdssr)

remove(pack_req, package_load)
#Simple function to negate %in%
`%nin%` = Negate(`%in%`)

### ----- Meta Data ----- ###

# df for sensor metadata
# sensor_meta <- tibble(
#   # param sonde is the name that the sensor records
#   param_sonde = c("% Saturation O₂","Actual Conductivity","Baro","Battery Level","Chl-a Fluorescence", 
#                                       "DO","Density","Depth","External Voltage","FDOM Fluorescence","ORP","Partial Pressure O₂",
#                                       "Pressure","Resistivity","Salinity","Specific Conductivity", "Temperature", "Total Dissolved Solids",
#                                       "Turbidity","pH","pH MV"), 
#   # param common is an abbreviated version that is easier to type
#                       param_common = c("DO_sat", "actual_cond", "baro", "battery", "chla",
#                                        "DO", "density","depth", "voltage", "FDOM", "ORP", "Partial Pressure o2",
#                                        "pressure", "Resistivity", "salinity", "spec_cond", "temp", "tds",
#                                        "turb", "pH", "pH_mv"), 
#   # Param w units is used to label axes
#                       param_w_units = c("% Saturation O₂","Actual Conductivity (µS/cm)","Baro","Battery Level","Chl-a Fluorescence (RFU)", 
#                                         "DO (mg/L)","Density","Depth (m)","External Voltage","FDOM Fluorescence (RFU)","ORP (mv)","Partial Pressure O₂",
#                                         "Pressure","Resistivity","Salinity","Specific Conductivity (µS/cm)", "Temperature (C)", "Total Dissolved Solids (mg/L)",
#                                         "Turbidity (NTU)","pH","pH MV (v)"), 
#   #key param is logical, derived parameters or parameters that are less important for WQ are F 
#                       key_param = c(T, T,F,F,T,
#                                     T,F,T,F,T,T,F, 
#                                     F,T,T,T,T,F,
#                                     T,T,F))
labels <- tibble(param = c("Turbidity", "Specific Conductivity", "Depth", "Chl-a Fluorescence", "FDOM Fluorescence", "Temperature"),
                 label = c("Turbidity (NTU)", "Specific Conductivity (uS/cm)", "Depth (m)", "Chl-a Fluorescence (RFU)", "FDOM Fluorescence (RFU)", "Temperature (C)"))

# site_names <- most_recent_chem%>%select(Site, site_code)%>%
#   distinct()%>%
#   mutate(site= tolower(site_code))%>%
#   select(site_name = Site, site)%>%
#   #fix a few names
#   mutate(site_name = case_when(site == "pbd" ~ "Canyon Mouth", 
#                                site == "sfm" ~ "South Fork at Pingree Rd", 
#                                site == "penn" ~ "Pennock",
#                                TRUE ~ site_name))%>%
#   #add additional rows
#   bind_rows(tibble(site_name = c("Poudre at Archery", 
#                                  "Poudre at Timberline", 
#                                  "Poudre at Prospect"), 
#                    site = c("archery virridy", "timberline virridy", "prospect virridy")))%>%
#   distinct()
# 
# 
# site_order <- c( "Joe Wright Inlet","Chambers Inlet", "Chambers Outflow", "Poudre below Poudre Falls", "Poudre Below Rustic","Pennock", "South Fork at Pingree Rd","Little Beaver","Poudre at Manner's Bridge" ,  "Canyon Mouth", "Poudre at Legacy Bridge", "Poudre at Lincoln", "Poudre at Timberline", "Spring Creek at Poudre Trail" , "Poudre at Prospect", "Poudre at Boxelder Sanitation","Boxelder Creek above Sanitation District", "Poudre at Archery"  )


