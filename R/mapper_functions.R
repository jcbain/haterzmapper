#' Gather ACS attributes from multiple counties
#'
#' @param counties A vector of counties to collect data on. Must be in the following format
#'  `SA,County Name` where SA is the state abbreviation and the Count Name is the name of
#'  the county. For example, `MO,Jackson` would collect on Jackson county, Missouri.
#' @param variables A list of ACM coded variables to collect.
#' @param geography The geographical unit to collect on.
#' @param year The ACS collection year.
#' @param geometry An option to include the simple feature for mapping functionality.
#' @return a simple feature data frame.
#' @examples
#' gather_counties(counties = c('MO,Clay', 'MO,Jackson'),
#'                 variables = c('B02001_001E', 'B02001_003E'))
#' gather_counties('MO,Jackson', variables = 'B01001_001E', geometry = TRUE)
#' @export
gather_counties <- function(counties, variables, geography = 'tract', year = 2015,
                            geometry = FALSE) {
  purrr::reduce(
    purrr::map(counties, function(x) {
      tidycensus::get_acs(geography = geography, variables = variables, year = year,
                          state = stringr::str_split(x ,pattern = ',')[[1]][1],
                          county = stringr::str_split(x,pattern = ',')[[1]][2] ,
                          geometry = geometry)
    }),
    rbind
  )
}


#' Subset geographies based off of some distance from a given coordinate
#'
#' @param df A simple feature dataframe.
#' @param long Longitude of the center point.
#' @param lat Latitude of the center point.
#' @param dist The distance from the center point to subset in meters.
#' @return A simple feature dataframe that is subset of the original data frame with only
#'   those geometries that are within the `dist` specified.
#' @export
subset_map <- function(df, long, lat, dist = 40000){
  # Change CRS for buffer
  df_sf = sf::st_sf(df)
  new_proj = "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +units=m +no_defs"

  if(is.na(st_crs(df_sf))){
    df_sf = sf::st_set_crs(df_sf, sf::st_crs(new_proj))
  }

  df_sf = sf::st_transform(df_sf, sf::st_crs(new_proj))

  # Prepare buffer around center point
  cntr_pnt <- sf::st_sfc(sf::st_point(c(long,  lat)), crs = 4326)
  cntr_aea_sf <- sf::st_transform(cntr_pnt, sf::st_crs(df_sf))
  buff <- sf::st_buffer(cntr_aea_sf, dist)

  # Subset original data
  intersection <- sf::st_intersects(buff, df_sf)
  subset <- df_sf[unlist(intersection),]

  subset
}


#' Collect a frame of a specific variable from the ACS or Census
#'
#' @param var The variable for collection.
#' @param year The year of the collection.
#' @param dataset The options for census bureau collection. Defaults to 'acs5'
#'     but options include 'sf1', 'sf3', 'acs1', 'acs3' or 'acs5'
#' @param include.error Option to include the margin of error rows. Defaults to FALSE.
#' @param include.total Option to include the total count row. Defaults to FALSE.
#' @return A tibble of your specific variable rows.
#' @examples
#' get_variables('B02001')
#' @export
#' @seealso \code{\link{tidycensus::load_variables}}
get_variables <- function(var, year = 2015, dataset = 'acs5', include.error = FALSE, include.total = FALSE){
  # Subset data according to var id
  all_vars = tidycensus::load_variables(year = year, dataset = dataset)
  frame = dplyr::filter(all_vars, stringr::str_detect(name, var))

  # Option to remove margin of error estimates
  if(!include.error){
    frame = dplyr::filter(frame, stringr::str_detect(name, 'E'))
  }

  # Option to remove total count rows
  if(!include.total){
    frame = dplyr::filter(frame, !stringr::str_detect(name, '001E|001M'))
  }
  frame
}
