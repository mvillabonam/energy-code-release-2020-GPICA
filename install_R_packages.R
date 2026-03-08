# Install R packages

# Install reticulate from CRAN binary to avoid requiring Rtools on Windows.
install.packages("reticulate", repos="http://cran.us.r-project.org")

list.of.packages <- c("readr","tidyverse", "haven","Rcpp", "imputeTS",
 "ggplot2", "DescTools", "mvtnorm", "magrittr", "dplyr", 
 "testit", "stringr", "readstata13", "viridis", "gridExtra", 
 "grid", "lattice", "ncdf4", "narray", "tidyr", "cowplot", 
 "data.table", "gdata", "logr", "miceadds", "R.utils","rlist",
 "pacman","ggnewscale","sp")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos="http://cran.us.r-project.org")

# rgdal/maptools were retired from CRAN and are unavailable in recent R releases.
# Try to install them if available, but do not fail setup when they are missing.
optional.packages <- c("rgdal", "maptools")
available <- rownames(available.packages(repos = "http://cran.us.r-project.org"))
to.install <- optional.packages[optional.packages %in% available]
if (length(to.install)) {
  install.packages(to.install, repos = "http://cran.us.r-project.org")
}
# if the above packages fail for you:
# on OS X, you may need to download GDAL from http://www.kyngchaos.com/software/frameworks/
# and then run the following line:
# install.packages('rgdal', type = "source", configure.args=c('--with-proj-include=/Library/Frameworks/PROJ.framework/Headers', '--with-proj-lib=/Library/Frameworks/PROJ.framework/unix/lib'))

# If you encounter other R issues, it might be worth trying out updating R:
# # on windows: 
# if(!require(installr)) {
#   install.packages("installr"); 
#   require(installr)
# } #load / install+load installr
# updateR()

# on Mac: download latest installer from https://www.r-project.org/
# the code has been tested on R 4.1.1
		