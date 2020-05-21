setHook("rstudio.sessionInit", function(newSession) {
  if (newSession && identical(getwd(), path.expand("~")))
  {
    message("Ouverture du projet documentationR")
    rstudioapi::openProject('~/documentationR')
  }
}, action = "append")

.libPaths(c("/usr/local/lib/R/site-library", "/usr/local/lib/R/library"))
