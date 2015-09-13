library(shiny)

convert<-function(mweight,mheight,uweight,uheight,unit) {
  if (unit=='Metric') {
    uheight<-mheight/2.54
    uweight<-mweight*2.205
  } else {
    mheight<-uheight*2.54
    mweight<-uweight/2.205 
  }
  output<-list(mweight,mheight,uweight,uheight)
  return(output)
}

bodymassindex<-function(values) {
  mweight<-as.numeric(values[1])
  mheight<-as.numeric(values[2])
  mheight<-mheight/100  #in m
  bodymassindex<-mweight/(mheight*mheight)
  return(bodymassindex)
} 

obesitylevel<-function(bmi) {
  if (bmi<16) {
    obesitylevel<-'Severely underweight'
  } else if (bmi>=16 && bmi<18.5){
    obesitylevel<-'Underweight'
  } else if (bmi>=18.5 && bmi<25){
    obesitylevel<-'Normal'
  } else if (bmi>=25 && bmi<30){
    obesitylevel<-'Overweight'
  } else if (bmi>=30){
    obesitylevel<-'Obese'
  }  
  return(obesitylevel)
}

isbmibad<-function(level){
  v<-!identical(level,'Normal')
  return(v)
}

shinyServer(
  function(input, output) {    
    vals<-reactive({convert(as.numeric(input$mweight),as.numeric(input$mheight),
                            as.numeric(input$uweight),as.numeric(input$uheight),input$tabunit)})
    rbmi<-reactive({bodymassindex(vals())})
    rlevel<-reactive({obesitylevel(as.numeric(rbmi()))})
    output$unitsystem<-renderText(input$tabunit)
    output$bmi<-renderText({rbmi()})
    output$level<-renderText({rlevel()})
    output$levelui<-renderUI(
      if (isbmibad(rlevel())){
        p(rlevel(), style = "color:red")
      } else{
        p(rlevel(), style = "color:green")
      }
    )
  }
)