setHook("rstudio.sessionInit", function(newSession) {
  if (newSession && identical(getwd(), path.expand("~")))
  {
    message("Ouverture du projet documentationR")
    rstudioapi::openProject('~/documentationR')
  }
}, action = "append")
