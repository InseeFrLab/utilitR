#!/usr/bin/env Rscript

# This script installs the list TeX Live packages declared in
# _latex_requirements.txt file

local({
  in_file <- file.path(rprojroot::find_rstudio_root_file(), "_latex_requirements.txt")
  if (!isTRUE(file.exists(in_file))) stop("_latex_requirements.txt: File not found")
  tinytex::tlmgr_install(unique(readLines(in_file)))
})
