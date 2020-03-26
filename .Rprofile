if (file.exists('~/.Rprofile')) sys.source('~/.Rprofile', envir = environment())


colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    sprintf("\\textcolor{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color, 
            x)
  } else x
}


import::from("magrittr","%>%")
knitr::opts_chunk$set(out.width='75%') 
