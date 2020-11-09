#!/usr/bin/env Rscript
if (!requireNamespace("covr", quietly = TRUE)) {
  install.packages("covr")
}
if (!requireNamespace("DT", quietly = TRUE)) {
  install.packages("DT")
}
Sys.setenv(NOT_CRAN = "true")
res <- covr::package_coverage("/var/local/R/devpkg")
print(res)
covr::report(res, "/home/rstudio/public/index.html", browse = FALSE)
