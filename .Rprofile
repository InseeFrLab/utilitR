if (file.exists('~/.Rprofile')) sys.source('~/.Rprofile', envir = environment())

# with_def <- (function() {
#   
#   glossary <- yaml::read_yaml("resources/glossary.yml")
#   glossary <- as.data.frame(do.call(rbind, glossary), stringsAsFactors = FALSE)
#   
#   function(term, def) {
#     if (missing(def)) {
#       def <- unlist(glossary[glossary$name == tolower(term), "desc"])
#       # quick and dirty pour aussi matcher les pluriels
#       if (length(def) == 0) def <- unlist(glossary[paste0(glossary$name, "s") == tolower(term), "desc"])
#       # quick and dirty pour aussi matcher les infinitif
#       if (length(def) == 0) def <- unlist(glossary[paste0(glossary$name, "r") == tolower(term), "desc"])
#     }
#     sprintf('<abbr title="%s"><b>%s</b></abbr>', def, term)
#   }
#   
# })()


render_rmd <- function(x) return(cat(htmltools::includeText(x)))


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




# Créer un dossier pour les images compressées (s'il n'existe pas déjà)
# Copier les images si elles ne sont pas déja dans le dossier
dossier_images <- './pics' # This folder must exist in the repo
dossier_images_compressees <- './pics_resized'
if (!dir.exists(dossier_images_compressees)) { 
  dir.create(dossier_images_compressees)
}

invisible(
  file.copy(list.files(dossier_images, full.names = TRUE), dossier_images_compressees, recursive=TRUE, overwrite = TRUE)
)


reminder_image <- function(path = "moncheminperso"){
  cat(
    sprintf(
      paste(
        "```{r, echo = FALSE}",
        "include_image(\"%s\")",
        "```",
        sep = "\n"
      ), path)
  )
}

