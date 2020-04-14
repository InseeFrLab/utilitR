setHook("rstudio.sessionInit", function(newSession) {
  if (newSession && identical(getwd(), path.expand("~")))
  {
    message("hello")
    rstudioapi::openProject('~/documentationR')
  }
}, action = "append")
