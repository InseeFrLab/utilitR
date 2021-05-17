remotes::install_github("inseefrlab/doremifasol")

# Créer un dossier
unlink("fichiers_plats", recursive = TRUE)
dir.create("fichiers_plats")

# Télécharger les données grâce à doremifasol
doremifasol::telechargerDonnees(
  "BPE_ENS", 
  telDir = "fichiers_plats")

doremifasol::telechargerDonnees(
  "DECES_COM_0918", 
  telDir = "fichiers_plats")

# Lister les fichiers et dézipper si besoin
lapply(
  list.files("fichiers_plats"), 
  function(x) {
    print(paste0("On traite le fichier : ", x))
    if (stringr::str_detect(x, "zip$")) {
      utils::unzip(
        paste0("fichiers_plats", "/", x), 
        overwrite = TRUE, 
        exdir = "fichiers_plats"
      )
    } else {
      return(NULL)
    }
  }
)
