# fichier _targets.R

library(targets)

tar_option_set(packages = c("dplyr", "readr"))

source("mesfonctions_pour_faire_ceci.R", encoding = "utf-8")

# on crée un fichier à partir d'un des jeux d'exemples
raw_file_path <- "data/donnes_entrees.csv"
dir.create("data")
readr::write_csv(doremifasolData::filosofi_com_2016, raw_file_path)

list(
  
  tar_target(csv_file, raw_file_path, format = "file"),
  
  tar_target(
    raw_filosofi_epci, readr::read_csv(csv_file),
  ),
  tar_target(
    grandes_villes, garde_grandes_villes(raw_filosofi_epci, seuil = 10000)
  ),
  tar_target(
    prop_sup_25k, grandes_villes %>% dplyr::summarise(mean(MED16 > 25000)*100)
  )
)
