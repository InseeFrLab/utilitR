garde_grandes_villes <- function(filosofi, seuil = 200000){
  return(
    filosofi %>% filter(NBPERSMENFISC16 > seuil)
  )
}
