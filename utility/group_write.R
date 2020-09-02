# group_write aims to split a data frame by unique values / combinations of columns
# and write data associated with it into csv files separately 
# it's a wrapper around group_split and group_walk
# for alternatives that does not control file name see examples of group_walk  


group_write <- function(df, ...) {
  gf <- dplyr::group_by(df, ...)
  if (!dplyr::is.grouped_df(gf)) {
    stop("You need to specify at least one grouping variable to split the data frame with.")
  }
  
  else {
    keys <- dplyr::group_keys(gf)
    vars <- dplyr::group_vars(gf)
    
    names <- character(0)
    for (var in vars) {
      names <- paste0(names, as.data.frame(keys)[, var], sep = "-")
    }
    names <- gsub("-$", "", names)
    out <- dplyr::group_split(df, ...)
    names(out) <- names
    
    purrr::iwalk(out, ~ readr::write_csv(.x, paste0(.y, ".csv")))
  }
}


