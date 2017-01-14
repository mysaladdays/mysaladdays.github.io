library(igraph)
library(shiny)
library(networkD3)

# Basic Static Graph
data1=read.csv("grangermqv.csv",header=TRUE)
data2=read.csv("grangermqv3.csv",header=TRUE)
data3=read.csv("grangermqv5.csv",header=TRUE)
#nodes=data.frame(name=c("AAPL","AIG","BAC","CITI","JNJ","JPM","MSFT","WFC","XOM","SPY","XLK","XLF"),type=c(1,2,2,2,3,2,1,2,4,5,5,5),
#la=c("Tech","Finance","Finance","Finance","Health","Finance","Tech","Finance","Energy","Index","Index","Index"))
#write.csv(nodes,"nodes.csv")
nodes=read.csv("nodes.csv",header=TRUE)
links1=data.frame(from=data1$source,to=data1$target,order=data1$Order,sign=data1$Sign)
links2=data.frame(from=data2$source,to=data2$target,order=data2$Order,sign=data2$Sign)
links3=data.frame(from=data3$source,to=data3$target,order=data3$Order,sign=data3$Sign)


#### Server ####
server <- function(input, output) {
  
  output$force1 <- renderForceNetwork({
    forceNetwork(Links = links1-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
  
    output$force2 <- renderForceNetwork({
    forceNetwork(Links = links2-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
  
    output$force3 <- renderForceNetwork({
    forceNetwork(Links = links3-1, Nodes = nodes, Source = "from", 
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
