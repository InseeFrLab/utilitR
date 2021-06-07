remotes::install_github("inseefrlab/doremifasol")
install.packages("esquisse")

# Télécharger les données grâce à doremifasol
options(doremifasol.telDir = "~")
doremifasol::telechargerFichier("BPE_ENS")
doremifasol::telechargerFichier("DECES_COM_0918")

fichiers_zip <- list.files(pattern = "\\.zip$", full.names = TRUE)

# Décompresser les fichiers .zip
invisible(
  lapply(
    fichiers_zip, 
    utils::unzip,
    overwrite = TRUE
  )
)

# Supprimer les fichiers .zip
unlink(fichiers_zip)
