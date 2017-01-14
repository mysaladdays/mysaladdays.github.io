library(igraph)
library(shiny)
library(networkD3)

# Basic Static Graph
data1=read.csv("grangermqv.csv",header=TRUE)
data2=read.csv("grangermqv3.csv",header=TRUE)
data3=read.csv("grangermqv5.csv",header=TRUE)
data4=read.csv("grangerwqv.csv",header=TRUE)
data5=read.csv("grangerwqv3.csv",header=TRUE)
data6=read.csv("grangerwqv5.csv",header=TRUE)
nodes=read.csv("nodes.csv",header=TRUE)
links1=data.frame(from=data1$source,to=data1$target,order=data1$Order,sign=data1$Sign)
links2=data.frame(from=data2$source,to=data2$target,order=data2$Order,sign=data2$Sign)
links3=data.frame(from=data3$source,to=data3$target,order=data3$Order,sign=data3$Sign)
links4=data.frame(from=data4$source,to=data4$target,order=data4$Order,sign=data4$Sign)
links5=data.frame(from=data5$source,to=data5$target,order=data5$Order,sign=data5$Sign)
links6=data.frame(from=data6$source,to=data6$target,order=data6$Order,sign=data6$Sign)

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
  
      output$force4 <- renderForceNetwork({
    forceNetwork(Links = links4-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
  
      output$force5 <- renderForceNetwork({
    forceNetwork(Links = links5-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
  
      output$force6 <- renderForceNetwork({
    forceNetwork(Links = links6-1, Nodes = nodes, Source = "from", 
                 Target = "to", NodeID = "name", Nodesize="size", fontSize=15, 
                 linkDistance=170, Group = "la", opacity = 1,opacityNoHover = FALSE, 
                 zoom=TRUE, legend=TRUE)
  })
  
}

#### UI ####

ui <- shinyUI(fluidPage(
  
  titlePanel("Risk Contagion Network"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Risk Contagion Network Monthly", forceNetworkOutput("force1")),
      tabPanel("Risk Contagion Network Monthly Large Jumps at 3-Sigma Level", forceNetworkOutput("force2")),
      tabPanel("Risk Contagion Network Monthly Large Jumps at 5-Sigma Level", forceNetworkOutput("force3")),
      tabPanel("Risk Contagion Network Weekly", forceNetworkOutput("force4")),
      tabPanel("Risk Contagion Network Weekly Large Jumps at 3-Sigma Level", forceNetworkOutput("force5")),
      tabPanel("Risk Contagion Network Weekly Large Jumps at 5-Sigma Level", forceNetworkOutput("force6"))
    )
  )
))

#### Run ####
shinyApp(ui = ui, server = server)
