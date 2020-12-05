# make showtext work in rstudio plot pane
if (rstudioapi::getVersion() <= "1.4") {
  trace(grDevices::png, exit = quote({
    showtext::showtext_begin()
  }), print = FALSE)
}

