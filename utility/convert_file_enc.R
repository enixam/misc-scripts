# This function converts the encoding of all files under a directory
# it uses `readr::guess_encoding` to determine encoding of the original file
# and convert it to UTF-8 or any other encoding
# if the input is a single file path, it creates a new file with the specified encoding under the same directory
# if the input is a directory, it creates a new directory alongside it with all converted files


convert_file_enc <- function(path, to = "UTF-8") {
  # if path is a single file
  if (file_test("-f", path)) {
    file <- path
    # extract file extension, for example file_ext is ".csv" for "food.csv"
    file_ext <- substring(file, regexpr("\\.([[:alnum:]])+$", file))
    # now out_file is "food-UTF-8.csv"
    out_file <- gsub(file_ext, paste0("-", to, file_ext), file)
    enc_likely <- as.data.frame(readr::guess_encoding(file))[1, 1]
    out <- iconv(readLines(file), from = enc_likely, to = to)
    writeLines(out, file(out_file, encoding = to))
  }
  
  # if path is a directory        
  else {
    file_names <- list.files(path)
    # directory for converted files 
    out_dir <- paste(path, to, sep = "/")
    dir.create(out_dir)
    for (file_name in file_names) {
      file_read_path <- paste(path, file_name, sep = "/")
      file_write_path <- paste(out_dir, file_name, sep = "/")
      enc_likely <- as.data.frame(readr::guess_encoding(file_read_path))[1, 1]
      out <- iconv(readLines(file_read_path), from = enc_likely, to = to)
      writeLines(out, file(file_write_path, encoding = to))
    }
  }
}

