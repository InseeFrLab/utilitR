remotes::install_github("inseefrlab/doremifasol")

# Créer un dossier
unlink("fichiers_plats", recursive = TRUE)
dir.create("fichiers_plats")

# Télécharger les données grâce à doremifasol
options(doremifasol.telDir = "fichiers_plats")
doremifasol::telechargerFichier("BPE_ENS")
doremifasol::telechargerFichier("DECES_COM_0918")

# Décompresser les fichiers .zip
invisible(
  lapply(
    list.files("fichiers_plats", pattern = "\\.zip$", full.names = TRUE), 
    utils::unzip,
    overwrite = TRUE, 
    exdir = "fichiers_plats"
  )
)
