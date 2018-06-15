#!/usr/bin/env Rscript
########################################
## Instalación y preparación de Ambiente
########################################

# Corre la siguiente función para instalar los paquetes usados en este repositorio
instalar <- function(paquete) {
  if (!require(paquete,character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)) {
    install.packages(as.character(paquete), repos = 'http://cran.us.r-project.org')
    library(paquete, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  }
}

paquetes <- c('magrittr', 'dplyr', 'tidyr', 'readr',
              'ggplot2', 'stringr','readxl', 'aws.s3', 'corrplot','AWR.Athena',
              'devtools', 'httr','tm', 'jsonlite',
              'Matrix', 'tidytext', 'tagcloud', 'slam', 'tm', 'shinydashboard',
              'rlang', 'ggrepel', 'ggthemes', 'RJDBC')


lapply(paquetes, instalar)

devtools::install_github("gaborcsardi/dotenv")
library(dotenv)
devtools::install_github("bmschmidt/wordVectors")
devtools::install_github("edzer/sfr")
devtools::install_github("plataformapreventiva/dbrsocial", ref = "bug/jointables/dbrsocial1",auth_token=Sys.getenv("GITHUB_PATH"), build_vignettes=TRUE)
library(dbrsocial)
library(sf)
