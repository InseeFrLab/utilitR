# malhereusement nécessaire car  knitr::current_input renvoit faussement .rmarkdown
nom_fichier <- sub("rmarkdown", "qmd", knitr::current_input(dir=FALSE))
last_date <- system(paste0("git log -1 --format=%as -- ", nom_fichier), intern = TRUE)
last_date <- format(as.Date(last_date), format = "%d/%m/%Y")
if(length(last_date) > 0) {
  cat("**Dernière modification :** ", last_date)
}