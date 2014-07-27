library(shiny)
data(trees)
n <- nrow(trees)

Girth <- trees$Girth
Height <- trees$Height
Volume <- trees$Volume

shinyServer(function(input, output) {

  output$treePlot <- renderPlot({

   n_obs <- input$n_obs
   observations_indices <- 1:n_obs
    
    plot(x=trees[observations_indices,input$predictor1], y=trees[observations_indices,"Volume"],
         col='green',
         pch=19,
         cex=1.5,
         xlab=input$predictor1,
         ylab="Volume",
         main=paste0("Scatterplot of ",input$predictor1," and Volume"))
    if(input$grid==TRUE) grid()
    if(input$trend==TRUE){
      model <- lm(paste0("Volume ~ ",input$predictor1),data=trees)
      abline(model)
    }
    if(input$conf==TRUE){
      conf_x <- data.frame(seq(min(trees[,input$predictor1]), max(trees[,input$predictor1]), 0.1))
      colnames(conf_x) <- input$predictor1
      model <- lm(paste0("Volume ~ ",input$predictor1),data=trees)
      pred <- predict(model,
                      newdata=conf_x,
                      interval="confidence",
                      level=input$conf_level/100)
      lines(conf_x[,1], pred[,2], lty=2)
      lines(conf_x[,1], pred[,3], lty=2) 
    }
  })
})


