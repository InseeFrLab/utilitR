
convert_extension <- function(ext){
  pattern <- paste0(ext, '$')
  from <- list.files(pattern = pattern, recursive = TRUE)
  to <- sub(pattern, tolower(ext), from)
  file.rename(from, to)
}

upper_extension <- function(ext){
  pattern <- paste0(ext, '$')
  from <- list.files(pattern = pattern, recursive = TRUE)
  if (length(from)>1L){
    stop(
      sprintf("Les fichiers suivants ont une majustcule %s",
              paste(from, collapse = "; "))
    )
  } else{
    message("Pas de probleme d'extension")
  }
}

upper_extension("PNG")
