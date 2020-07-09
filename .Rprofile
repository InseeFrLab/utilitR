if (file.exists('~/.Rprofile')) sys.source('~/.Rprofile', envir = environment())


colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    sprintf("\\textcolor{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color, 
            x)
  } else x
}


knitr::opts_chunk$set(out.width='75%', fig.align='center') 
options(bookdown.render.file_scope = FALSE)

print_html_only <- function(x){
  if (knitr::is_html_output()) return(x)
  return("")
}

print_latex_only <- function(x){
  if (knitr::is_latex_output()) return(x)
  return("")
}


screen_files <- function(){
  
  masterfile <- paste(readLines("_bookdown.yml"),
                      collapse = " ")
  masterfile <- gsub(
    '(\\[|\\]|\\")', "",
    regmatches(masterfile,
               gregexpr("\\[.+?\\]",
                        masterfile))[[1]]
  )
  masterfile <- unlist(
    strsplit(
      x = masterfile,
      split = ","
    )
  )
  masterfile <- trimws(masterfile)
  masterfile <- masterfile[endsWith(masterfile, suffix = ".Rmd")]
  
  return(masterfile)  
}

get_hash <- function(){
  
  list_files <- screen_files()
  
  system2 <- function(...) {
    stopifnot(!any(names(list(...)) %in% "intern"))
    result <- base::system(..., intern = TRUE)
    print(result)
  }
  
  return(
    sapply(
      list_files, function(k)
        system2(paste0("git log -n 1 --pretty=format:%h ","./", k))
    )
  )
  
}

add_space <- function(){
  
  files <- screen_files()
  
  lapply(files, function(f) writeLines(c(readLines(f)," "),
                                       con = f)
  )
  
}

# needed for bookdown 0.20
options(bookdown.render.file_scope = FALSE)



import::from("magrittr","%>%")
