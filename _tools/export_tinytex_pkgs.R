#!/usr/bin/env Rscript

# This script writes the list of installed TeX Live packages to
# _latex_requirements.txt file

local({
  out_file <- file.path(rprojroot::find_rstudio_root_file(), "_latex_requirements.txt")
  installed_pkgs <- tinytex::tlmgr(c('info', '--list', '--only-installed', '--data', 'name'), stdout = TRUE, .quiet = TRUE)
  writeLines(installed_pkgs, con = out_file)
  message("List of installed TeX Live packages written to file:\n", out_file)
})
