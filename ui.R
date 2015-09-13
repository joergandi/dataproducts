shinyUI(pageWithSidebar(
  headerPanel("Body-Mass-Index based obesity classification"),
  sidebarPanel(
    tabsetPanel(
      id ="tabunit",
      tabPanel("Metric", 
               textInput("mheight","Your height (cm)",value="175"),
              textInput("mweight","Your weight (kg)",value="70")    
      ),
      tabPanel("US",
               textInput("uheight","Your height (in)",value="69"),
               textInput("uweight","Your weight (lbs)",value="166")
      )
    ),
    submitButton("Submit"),
    tags$br(),
    p("Select a unit system (metric or us), enter your height and weight and press the submit button.")
  ),
  mainPanel(
    h3('Selected unit system:'),
    textOutput('unitsystem'),
    h3('Your Body-Mass-Index:'),
    textOutput('bmi'),
    h3('Your obesity level:'),
    uiOutput('levelui'),
    tags$div(HTML("<br>Based on your input, the body-mass-index is computed according
                 to the formula of <a href=https://dx.doi.org/10.1016%2F0021-9681%2872%2990027-6>
                  Indices of relative weight and obesity</a> which is then classified according to the 
                  <a href=http://www.who.int/bmi/index.jsp?introPage=intro_3.html>WHO recommendation</a>.
                  <br>Note that the relevance of the BMI is disputed, see
                  <a href=http://www.npr.org/templates/story/story.php?storyId=106268439>this article</a>."))
    )
))