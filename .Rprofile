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
knitr::opts_chunk$set(out.width='75%', fig.align='center') 


print_html_only <- function(x){
  if (knitr::is_html_output()) return(x)
  return("")
}

print_latex_only <- function(x){
  if (knitr::is_latex_output()) return(x)
  return("")
}

