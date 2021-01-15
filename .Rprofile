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

# needed for bookdown 0.20
options(bookdown.render.file_scope = FALSE)




# Créer un dossier pour les images compressées (s'il n'existe pas déjà)
dossier_images <- './pics' # This folder must exist in the repo
dossier_images_compressees <- './pics_resized'
if (!dir.exists(dossier_images_compressees)) { 
  dir.create(dossier_images_compressees)
}
# Copier les images si elles ne sont pas déja dans le dossier
file.copy(list.files(dossier_images, full.names = TRUE), dossier_images_compressees, recursive=TRUE, overwrite = TRUE)

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
