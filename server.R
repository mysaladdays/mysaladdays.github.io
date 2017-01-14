setwd("C:/Users/Xu/Documents/Research/results")
library(igraph)
library(shiny)
library(networkD3)
rsconnect::setAccountInfo(name='mysaladdays',
                          token='B3B93232AE0E1AB5B0DD365F6B0C878A',
                          secret='6kF9F2hatQSvC5JYJM1mRfWu14qCViXbySN6exMB')
# Basic Static Graph
data=read.csv("grangermqv.csv",header=TRUE)
#nodes=data.frame(name=c("AAPL","AIG","BAC","CITI","JNJ","JPM","MSFT","WFC","XOM","SPY","XLK","XLF"),type=c(1,2,2,2,3,2,1,2,4,5,5,5),
#la=c("Tech","Finance","Finance","Finance","Health","Finance","Tech","Finance","Energy","Index","Index","Index"))
#write.csv(nodes,"nodes.csv")
nodes=read.csv("nodes.csv",header=TRUE)
links=data.frame(from=data$source,to=data$target,order=data$Order,sign=data$Sign)


#### Server ####
server <- function(input, output) {
  
  output$force1 <- renderForceNetwork({
    forceNetwork(Links = links-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
}