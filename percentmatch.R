
bl_t <- bl[1:100, 1:100]

percent_match <- function (x) {
 #  x <- bl_t
  t <- as.tibble(t(x))
  t[t == ""] <- NA
  id <- x[[1]]
  nr <- nrow(t)
  nc <- ncol(t)
  m <- vector(mode = "numeric", length = nc-1)
  pm <- vector(mode = "numeric", length = nc)
  id_m <- vector(mode = "character", length = nc)
  
  for (i in 1:nc) {
   # i = 1
    # i = 4
    n <- t[,i]
    tt <- t[,-i]
    for (j in 1:(nc-1)) {
      m[j] <- sum(n[,1] == tt[,j], na.rm = TRUE) / sum(!is.na(n[,1]))
    }
    pm[i] <- max(m)
    id_m[i] <- tt[1,which.max(m)]
    if (i %% 10 == 0) { 
      print(i) 
      }
  }
  out <- tibble(id, pm, id_m)
  return(out)
}

pm_bl <- percent_match(bl)
qplot(pm_bl$pm)
pm_el <- percent_match(el)
qplot(pm_el$pm)
