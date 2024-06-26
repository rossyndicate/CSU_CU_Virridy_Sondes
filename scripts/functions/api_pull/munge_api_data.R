#' Munge API data for QAQC workflow
#' @param api_path Path where the raw API data lives.
#' @return A dataframe with the munged API data.
#' @require An upstream dependency (i.e., alternative to `{necessary object}`).
#' @examples
# munge_api_data(api_path = "data/api/")

munge_api_data <- function(api_path, require = NULL) {

  api_data <- list.files(path = api_path, full.names = TRUE, pattern = "*.csv") %>%
    purrr::map_dfr(~data.table::fread(.) %>%
                     dplyr::select(-id)) %>%
    # remove overlapping API-pull data
    dplyr::distinct() %>%
    # remove VuLink data
    dplyr::filter(!grepl("vulink", name, ignore.case = TRUE)) %>% 
    #remove extra params
    dplyr::filter(parameter %nin% c("Density", "External Voltage","Partial Pressure O₂","Pressure", "Resistivity" , "Salinity", "Total Dissolved Solids", "pH MV", "Baro", "Battery Level", "Level: Depth to Water","Level: Elevation" )) %>%
    # Convert UTC (as it is sent from HydroVU API) to MST:
    dplyr::mutate(DT = lubridate::as_datetime(timestamp, tz = "UTC")) %>%
    dplyr::mutate(DT = lubridate::with_tz(DT, tzone = "MST"),
           DT_round = lubridate::round_date(DT, "15 minutes"),
           DT_join = as.character(DT_round),
           site = tolower(site)) 
  return(api_data)

}
