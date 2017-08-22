setwd(dirname(parent.frame(3)$ofile))

data_folder <- 'data'

download_file <- function(file_path, data_source_url){
  destination_path <- file.path(data_folder, file_path)
if (!file.exists(destination_path)) {
  download.file(data_source_url ,destination_path, method="auto") 
}
}

all_gho_data <- list(
  estimate_cases.csv = "http://apps.who.int//gho//athena//data//GHO//MALARIA002?filter=COUNTRY:*&x-sideaxis=COUNTRY&x-topaxis=GHO;YEAR&profile=verbose&format=csv"
  , reported_deaths.csv = "http://apps.who.int//gho/athena//data//GHO//MALARIA001?filter=COUNTRY:*&x-sideaxis=COUNTRY&x-topaxis=GHO;YEAR&profile=verbose&format=csv"
  , reported_indigenous_confirmed_cases.csv = "http://apps.who.int//gho//athena//data//GHO//WHS3_48?filter=COUNTRY:*&x-sideaxis=COUNTRY&x-topaxis=GHO;YEAR&profile=verbose&format=csv"
  )

mapply(download_file, names(all_gho_data), all_gho_data)