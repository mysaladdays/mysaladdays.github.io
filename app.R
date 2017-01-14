setwd("https://www.dropbox.com/sh/3p0yhtbjj7zlxug/AABqp4jXUrY5DAKCynsuXVvVa?dl=0")
library(igraph)
library(shiny)
library(networkD3)

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

#### Run ####
shinyApp(ui = ui, server = server)
