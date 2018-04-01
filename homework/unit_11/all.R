    rm(list=ls())
    
    library(knitr)
    library(ggplot2)
    library(dplyr)
    library(fpp2)
    library(MuMIn)
    library(xts)
    library(dygraphs)
    
    dbxroot <- "https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/"

    source('code/q01_a.R')
    source('code/q01_b.R')
    source('code/q01_c.R')
    
    source('code/q02_a.R')
    source('code/q02_b.R')
    source('code/q02_c.R')
    source('code/q02_d.R')
    
    source('code/q03_a.R')
    source('code/q03_b.R')
    source('code/q03_c.R')
    source('code/q03_d.R')