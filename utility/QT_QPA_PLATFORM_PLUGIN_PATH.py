# fix plotting error when making matplotlib graphics inside RStudio
import os as os
path = 'C:/Users/Lenovo/AppData/Local/r-miniconda/envs/r-reticulate/Library/plugins/platforms'
os.environ['QT_QPA_PLATFORM_PLUGIN_PATH'] = path
