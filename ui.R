setwd("C:/Users/Xu/Documents/Research/results")
library(igraph)
library(shiny)
library(networkD3)
rsconnect::setAccountInfo(name='mysaladdays',
                          token='B3B93232AE0E1AB5B0DD365F6B0C878A',
                          secret='6kF9F2hatQSvC5JYJM1mRfWu14qCViXbySN6exMB')

#### UI ####

ui <- shinyUI(fluidPage(
  
  titlePanel("Jump Spillover Effects Network"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Jump Spillover Effects Network Monthly", forceNetworkOutput("force1")),
      tabPanel("Jump Spillover Effects Network Monthly Large Jumps at 3-Sigma Level", forceNetworkOutput("force2")),
      tabPanel("Jump Spillover Effects Network Monthly Large Jumps at 5-Sigma Level", forceNetworkOutput("force3"))
    )
  )
))