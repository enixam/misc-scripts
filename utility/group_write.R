# group_write aims to split a data frame by unique values / combinations of columns
# and write data associated with it into csv files separately 
# it relies on grouping functions from dplyr and `purrr::iwalk`
# for alternatives that can only split by one column see examples of group_walk  

group_write <- function(df, ..., dir = "") {
  gf <- dplyr::group_by(df, ...)
  if (!dplyr::is.grouped_df(gf)) {
    stop("You need to specify at least one grouping variable to split the data frame with.")
  }
  
  else {
    keys <- dplyr::group_keys(gf)
    
    names <- vector("list", 0)
    for (i in 1:nrow(keys)) {
      name <- paste(as.character(keys[i, ]), collapse = "-")
      names[[i]] <- name
    }
    out <- dplyr::group_split(gf)
    names(out) <- names
    
    # Without specifying a directory, files are written to the current working directory
    if (dir == "") {
      purrr::iwalk(out, ~ readr::write_csv(.x, paste0(.y, ".csv")))
    }
    else {
      # If the specified directory exists, write to that directory
      if (dir.exists(dir)) {
        purrr::iwalk(out, ~ readr::write_csv(.x, paste0(dir, "/", .y, ".csv")))
      }
      # If not, first create that directory
      else {
        dir.create(dir)
        purrr::iwalk(out, ~ readr::write_csv(.x, paste0(dir, "/", .y, ".csv")))
      }
    }
  }
}


