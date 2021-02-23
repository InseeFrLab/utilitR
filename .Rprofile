if (file.exists('~/.Rprofile')) sys.source('~/.Rprofile', envir = environment())



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

compresser_image <- 
  function(file_in, 
           file_out = NA, ratio_compression = 2, 
           xmax = 300, quality = 0.7, cutoff = 3000) {
    # Fonction de compression d'une image png
    # xmax <- 1920  # y pixel max
    # quality <- 0.7  # passed on to jpeg::writeJPEG()
    # cutoff <- 100000  # files smaller than this will not be touched
    # file_out <- "test.jpg"
    if (is.na(file_out)) {
      file_out <- sub(dossier_images, dossier_images_compressees, file_in)
    }
    if (is.na(file.size(file_in))) {
      stop(paste0("File ", file_in, " not found."))
    }
    else if (file.size(file_in) < cutoff) {  # in this case, just copy file
      if (!(file_in == file_out)) {
        file.copy(from = file_in, to = file_out, overwrite = TRUE)
      }
    } else {# if larger than cutoff
      # magick workflow
      image_raw <- magick::image_read(path = file_in)
      if (!is.na(ratio_compression)) {
        image_resized <- 
          magick::image_scale(
            image = image_raw, 
            geometry = as.character(as.integer(round(magick::image_info(image_raw)["width"] / ratio_compression))))
      } else if (magick::image_info(image_raw)["width"] > xmax) {  # only resize if smaller
        image_resized <- 
          magick::image_scale(
            image = image_raw, 
            geometry = as.character(xmax))
      } else {
        image_resized      <- image_raw
      }
      magick::image_write(image = image_resized, 
                          path = file_out, 
                          format = "png")
    }
  }

include_image <- function(x, compression = TRUE, ratio_compression = 2, ...) {
  # Fonction qui 1/ compresse  l'image si nécessaire; 2/ l'inclut dans le Rmd
  if (compression) {
    compresser_image(file_in = x, ...)
  }
  knitr::include_graphics(sub(dossier_images, dossier_images_compressees, x), ...)    
}


message(
  cat(
    c("Projet source de la documentation utilitR",
      "-----------------------------------------",
      "",
      "Pour pr\u00E9visualiser la version web de l'ouvrage: ",
      "   * Option 1: utiliser l'onglet 'Build' dans Rstudio;",
      "   * Option 2: taper dans la commande R:
         bookdown::render_book(\"index.Rmd\", output_dir = \"_public\", output_format = \"utilitr::html_document\")",
      "",
      "Ne pas oublier d'installer le package 'utilitr' avant pour disposer des mod\u00E8les de documents: 
         remotes::install_github(\"https://github.com/InseeFrLab/utilitr-template\")"),
    sep = "\n"
  )
)
