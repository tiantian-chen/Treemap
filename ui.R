library(shiny)
library(treemap)
library(d3treeR)
library(shinyBS)
library(highcharter)
library(shinythemes)
library(shinyWidgets)
library(htmltools)
library(rmarkdown)

shinyUI(
  navbarPage(
    title = "shinyTreeMap",
    theme = shinytheme("flatly"),
    windowTitle = "make TreeMap plots in R with shiny",
    #Single Treemap
    tabPanel(
      "Single Treemap",
      sidebarPanel(
        h2("Data type"),
        radioButtons(
          "Variable",
          h4("check the number of variables"),
          choices = list("Single variable" = 1,
                         "Double variable" = 2),
          selected = 1
        ),
        conditionalPanel(
          condition = "input.Variable == '1'",
          selectInput(
            "input",
            h4(
              "Input Data",
              bsButton(
                "bsn1",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bsn1",
            'Select Input data type',
            "You can upload or paste input data. The input data should contain two columns, each corresponding to the value of the groupGroup",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.input == 'Upload input data'",
            fileInput("Upload", label = "", multiple = FALSE),
            downloadButton("Download", "Download example data")
          ),
          conditionalPanel(
            condition = "input.input == 'Paste input data'",
            textAreaInput(
              "Pastes",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "Pasteexampl",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          )
        ),
        conditionalPanel(
          condition = "input.Variable == '2'",
          selectInput(
            "inputdataa",
            h4(
              "Input Data",
              bsButton(
                "bs100",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bs100",
            'Select Input data type',
            "You can upload or paste input data. The input data should contain three columns corresponding to group, value corresponding to group, and Value1 respectively",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.inputdataa == 'Upload input data'",
            fileInput("Uploaddata", label = "", multiple = FALSE),
            downloadButton("Downloaddata", "Download example data")
          ),
          conditionalPanel(
            condition = "input.inputdataa == 'Paste input data'",
            textAreaInput(
              "Pastedata",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "Pasteexample",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          ),
        ),
        selectInput(
          "selectcolora",
          h4(
            "Plot color",
            bsButton(
              "bs101",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          choices = list(
            "Red Gradient" = "-RdGy",
            "Grey Bright" = "Set2",
            "Yollow Bright" = "Set3",
            "Orange Bright" = "Paired",
            "Purple Bright" = "Spectral",
            "Light color" = "Pastel1",
            "Purple Gradient" = "RdPu",
            "Green Gradient" = "RdYlGn"
          ),
          selected = "Set3"
        ),
        bsPopover(
          "bs101",
          "The colors used to render the data can be randomly assigned by the application or specified by the user. By default, the colors specified by shiny are used. To customize a color for the data, the user should select a color for each data",
          trigger = "focus"
        ),
        conditionalPanel(
          condition = "input.Variable == '2'",
          textInput("colorvalue", h4(
            "Color value",
            bsButton(
              "bs102",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ), value = "Regional population"),
          bsPopover("bs102", "Users can customize legends", trigger = "focus")
        ),
        textInput(
          "PlotTitle",
          h4(
            "Plot title:",
            bsButton(
              "bs103",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          value = c("GDP and Population")
        ),
        bsPopover("bs103", "Modify image title", trigger = "focus"),
        textInput("Teemapheight", "Plot height", value = 600),
        textInput("Teemapwidth", "Plot width", value = 800),
        conditionalPanel(
          condition = "input.Variable == '2'",
          sliderInput(
            "legendsize",
            h4(
              "legend size:",
              bsButton(
                "bs104",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 17
          ),
          bsPopover("bs104", "Legend size", trigger = "focus")
        ),
        sliderInput(
          "Titlesize",
          h4(
            "Title size:",
            bsButton(
              "bs105",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          min = 0,
          max = 100,
          value = 25
        ),
        bsPopover("bs105", "Modify the image title size", trigger = "focus"),
        sliderInput(
          "GLabelsize",
          h4(
            "GroupLabels size:",
            bsButton(
              "bs106",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          min = 0,
          max = 100,
          value = 20
        ),
        bsPopover("bs106", "Modify the group label size", trigger = "focus"),
        checkboxInput("downloadratio", "Adjust the image download ratio", FALSE),
        conditionalPanel(
          condition = "input.downloadratio",
          numericInput("treemapHeight", "Plot download height", value =
                         "7"),
          numericInput("treemapWidth", "Plot download width", value =
                         "10")
        ) ,
        actionButton(
          "Submit",
          strong("Submit!"),
          styleclass = "success",
          width = '100%'
        )
      ),
      
      mainPanel(
        conditionalPanel(
          condition = "input.Variable == '2'",
          downloadButton("downloadtreemap.pdf", "Download PDF File"),
          downloadButton("downloadtreemap.svg", "Download SVG File")
        ),
        conditionalPanel(
          condition = "input.Variable == '1'",
          downloadButton("downloadtreema.pdf", "Download PDF File"),
          downloadButton("downloadtreema.svg", "Download SVG File")
        ),
        br(),
        br(),
        imageOutput("Image")
      )
    ),
    
    #Double Treemap
    tabPanel(
      "Double Treemap",
      sidebarPanel(
        h2("Data type"),
        radioButtons(
          "Variabl",
          h4("check the number of variables"),
          choices = list("Single variable" = 1,
                         "Double variable" = 2),
          selected = 1
        ),
        conditionalPanel(
          condition = "input.Variabl == '1'",
          selectInput(
            "inputdatan",
            h3(
              "Input Data",
              bsButton(
                "bs00q",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bs00q",
            'Select Input data type',
            "Input data can be uploaded or pasted. The input data should contain three columns corresponding to group, subgroup, and value corresponding to subgroup",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.inputdatan == 'Upload input data'",
            fileInput("Uploadndata", label = "", multiple = FALSE),
            downloadButton("Exampledatatxtn", "Download example data")
          ),
          conditionalPanel(
            condition = "input.inputdatan == 'Paste input data'",
            textAreaInput(
              "Pastendata",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "Pastenexample",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          ),
        ),
        conditionalPanel(
          condition = "input.Variabl == '2'",
          selectInput(
            "inputdata",
            h3(
              "Input Data",
              bsButton(
                "bs00",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bs00",
            'Select Input data type',
            "Input data can be uploaded or pasted. The input data should contain four columns, corresponding to group, subgroup, value and Value1 of subgroup respectively",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.inputdata == 'Upload input data'",
            fileInput("Upload_data", label = "", multiple = FALSE),
            downloadButton("Exampledatatxt", "Download example data")
          ),
          conditionalPanel(
            condition = "input.inputdata == 'Paste input data'",
            textAreaInput(
              "Paste_data",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "Paste_example",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          ),
        ),
        selectInput(
          "selectcolor",
          h4(
            "Plot color",
            bsButton(
              "bs01",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          choices = list(
            "Red Gradient" = "-RdGy",
            "Grey Bright" = "Set2",
            "Yollow Bright" = "Set3",
            "Orange Bright" = "Paired",
            "Purple Bright" = "Spectral",
            "Light color" = "Pastel1",
            "Purple Gradient" = "RdPu",
            "Green Gradient" = "RdYlGn"
          ),
          selected = "Set3"
        ),
        bsPopover(
          "bs01",
          "The colors used to render the data can be randomly assigned by the application or specified by the user. By default, the colors specified by shiny are used. To customize a color for the data, the user should select a color for each data",
          trigger = "focus"
        ),
        selectInput(
          "selecttype",
          h4(
            "Plot type",
            bsButton(
              "bsq02",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          choices = list(
            "Static treemap" = 1,
            "Advanced interactive treemap" = 2,
            "Interactive treemap" = 3
          ),
          selected = 2
        ),
        bsPopover("bsq02", "Changing diagram types", trigger = "focus"),
        conditionalPanel(
          condition = "input.selecttype == '1'",
          textInput(
            "TreeplotTitle",
            h4(
              "Plot title:",
              bsButton(
                "bs09",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            value = c("GDP and Population")
          ),
          bsPopover("bs09", "Modify image title", trigger = "focus")
        ),
        conditionalPanel(condition = "input.selecttype == '2' || input.selecttype == '3'",
                         textInput(
                           "Treemap_plotTitle",
                           h4(
                             "Plot title:",
                             bsButton(
                               "bs05",
                               label = "",
                               icon = icon("question"),
                               style = "info",
                               size = "small"
                             )
                           ),
                           value = c("GDP and Population")
                         ),),
        bsPopover("bs05", "Modify image title", trigger = "focus"),
        conditionalPanel(
          condition = "input.Variabl == '2'",
          conditionalPanel(
            condition = "input.selecttype == '1' || input.selecttype == '2'",
            textInput("color_value", h4(
              "Color value",
              bsButton(
                "bs03",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ), value = "Regional population")
          ),
          bsPopover("bs03", "Users can customize legends", trigger = "focus"),
        ),
        textInput("treeheight", "Plot height", value = 600),
        textInput("treewidth", "Plot width", value = 800),
        conditionalPanel(
          condition = "input.Variabl == '2'",
          conditionalPanel(
            condition = "input.selecttype == '1' || input.selecttype == '2'",
            sliderInput(
              "legend_size",
              h4(
                "legend size:",
                bsButton(
                  "bs04",
                  label = "",
                  icon = icon("question"),
                  style = "info",
                  size = "small"
                )
              ),
              min = 0,
              max = 100,
              value = 17
            )
          ),
          bsPopover("bs04", "Legend size", trigger = "focus")
        ),
        conditionalPanel(
          condition = "input.selecttype == '1'",
          
          sliderInput(
            "Title_size",
            h4(
              "Title size:",
              bsButton(
                "bs06",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 25
          ),
          sliderInput(
            "GLabels_size",
            h4(
              "GroupLabels size:",
              bsButton(
                "bs07",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 20
          ),
          sliderInput(
            "SLabels_size",
            h4(
              "SubgroupLabels size:",
              bsButton(
                "bs08",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 15
          ),
        ),
        bsPopover("bs06", "Modify the image title size", trigger = "focus"),
        bsPopover("bs07", "Modify the group label size", trigger = "focus"),
        bsPopover("bs08", "Modify the subgroup label size", trigger = "focus"),
        checkboxInput("downratio", "Adjust the image download ratio", FALSE),
        conditionalPanel(
          condition = "input.downratio",
          numericInput("mapHeight", "Plot download height", value =
                         "9"),
          numericInput("mapWidth", "Plot download width", value =
                         "9")
        ) ,
        actionButton(
          "submit1",
          strong("Submit!"),
          styleclass = "success",
          width = '100%'
        )
      ),
      
      mainPanel(
        conditionalPanel(
          condition = "input.Variabl == '2'",
          conditionalPanel(
            condition = "input.selecttype == '1'",
            downloadButton("downtreemap.pdf", "Download PDF File"),
            downloadButton("downtreemap.svg", "Download SVG File")
          )
        ),
        conditionalPanel(
          condition = "input.Variabl == '1'",
          conditionalPanel(
            condition = "input.selecttype == '1'",
            downloadButton("downtreemapn.pdf", "Download PDF File"),
            downloadButton("downtreemapn.svg", "Download SVG File")
          )
        ),
        br(),
        br(),
        uiOutput("TReemap3"),
        uiOutput("TReemap2"),
        imageOutput("myImage")
      )
    ),
    
    #Triple Treemap
    tabPanel(
      "Triple Treemap",
      sidebarPanel(
        h2("Data type"),
        radioButtons(
          "Variab",
          h4("check the number of variables"),
          choices = list("Single variable" = 1,
                         "Double variable" = 2),
          selected = 1
        ),
        conditionalPanel(
          condition = "input.Variab == '1'",
          selectInput(
            "inputdataam",
            h3(
              "Input Data",
              bsButton(
                "bsam1",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bsam1",
            'Select Input data type',
            "Input data can be uploaded or pasted. The input data should contain four columns corresponding to group, subgroup, subsubGroup and value corresponding to subsubgroup",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.inputdataam == 'Upload input data'",
            fileInput("Uploadm", label = "", multiple = FALSE),
            downloadButton("Exampledatam", "Download example data")
          ),
          conditionalPanel(
            condition = "input.inputdataam == 'Paste input data'",
            textAreaInput(
              "Pastem",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "PasteEm",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          ),
        ),
        conditionalPanel(
          condition = "input.Variab == '2'",
          selectInput(
            "inputdataaa",
            h3(
              "Input Data",
              bsButton(
                "bsa1",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            choices = c("Upload input data", "Paste input data"),
            "Paste input data"
          ),
          bsPopover(
            "bsa1",
            'Select Input data type',
            "You can upload or paste input data. The input data should contain five columns corresponding to group, subGroup, subsubGroup, value and Value1 of subsubGroup",
            trigger = "focus"
          ),
          conditionalPanel(
            condition = "input.inputdataaa == 'Upload input data'",
            fileInput("Uploadmm", label = "", multiple = FALSE),
            downloadButton("Exampledata", "Download example data")
          ),
          conditionalPanel(
            condition = "input.inputdataaa == 'Paste input data'",
            textAreaInput(
              "Paste",
              label = "",
              width = "100%",
              resize = "vertical",
              height = "200px",
              placeholder = "Paste text to upload data"
            ),
            actionButton(
              "PasteE",
              strong("Paste example data"),
              styleclass = "info",
              width = '100%'
            )
          )
        ),
        selectInput(
          "color",
          h4(
            "Plot color",
            bsButton(
              "bsa2",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          choices = list(
            "Red Gradient" = "-RdGy",
            "Grey Bright" = "Set2",
            "Yollow Bright" = "Set3",
            "Orange Bright" = "Paired",
            "Purple Bright" = "Spectral",
            "Light color" = "Pastel1",
            "Purple Gradient" = "RdPu",
            "Green Gradient" = "RdYlGn"
          ),
          selected = "Set3"
        ),
        bsPopover(
          "bsa2",
          "The colors used to render the data can be randomly assigned by the application or specified by the user. By default, the colors specified by shiny are used. To customize a color for the data, the user should select a color for each data",
          trigger = "focus"
        ),
        selectInput(
          "plottype",
          h4(
            "Plot type",
            bsButton(
              "bsqa3",
              label = "",
              icon = icon("question"),
              style = "info",
              size = "small"
            )
          ),
          choices = list(
            "Static treemap" = 1,
            "Advanced interactive treemap" = 2,
            "Interactive treemap" = 3
          ),
          selected = 2
        ),
        bsPopover("bsqa3", "Changing diagram types", trigger = "focus"),
        conditionalPanel(
          condition = "input.plottype == '1'",
          textInput(
            "TreeMapTitle",
            h4(
              "Plot title:",
              bsButton(
                "bsa4",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            value = c("GDP and Population")
          ),
          bsPopover("bsa4", "Modify image title", trigger = "focus")
        ),
        conditionalPanel(condition = "input.plottype == '2' || input.plottype == '3'",
                         textInput(
                           "TreemapTitle",
                           h4(
                             "Plot title:",
                             bsButton(
                               "bsa5",
                               label = "",
                               icon = icon("question"),
                               style = "info",
                               size = "small"
                             )
                           ),
                           value = c("GDP and Population")
                         ),),
        bsPopover("bsa5", "Modify image title", trigger = "focus"),
        conditionalPanel(
          condition = "input.Variab == '2'",
          conditionalPanel(
            condition = "input.plottype == '1' || input.plottype == '2'",
            textInput("Colvalue", h4(
              "Color value",
              bsButton(
                "bsa6",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ), value = "Regional population"),
          ),
          bsPopover("bsa6", "Users can customize legends", trigger = "focus")
        ),
        textInput("theight", "Plot height", value = 600),
        textInput("twidth", "Plot width", value = 800),
        conditionalPanel(
          condition = "input.Variab == '2'",
          conditionalPanel(
            condition = "input.plottype == '1' || input.plottype == '2'",
            sliderInput(
              "legendS",
              h4(
                "legend size:",
                bsButton(
                  "bsa7",
                  label = "",
                  icon = icon("question"),
                  style = "info",
                  size = "small"
                )
              ),
              min = 0,
              max = 100,
              value = 17
            )
          ),
          bsPopover("bsa7", "Legend size", trigger = "focus")
        ),
        conditionalPanel(
          condition = "input.plottype == '1'",
          sliderInput(
            "TitleS",
            h4(
              "Title size:",
              bsButton(
                "bsa8",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 25
          ),
          sliderInput(
            "GLabelsS",
            h4(
              "GroupLabels size:",
              bsButton(
                "bsa9",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 20
          ),
          sliderInput(
            "SLabelsS",
            h4(
              "SubgroupLabels size:",
              bsButton(
                "bsa10",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 15
          ),
          sliderInput(
            "SsLabelsS",
            h4(
              "Sub-subgroupLabels size:",
              bsButton(
                "bsa11",
                label = "",
                icon = icon("question"),
                style = "info",
                size = "small"
              )
            ),
            min = 0,
            max = 100,
            value = 15
          ),
        ),
        bsPopover("bsa8", "Modify the image title size", trigger = "focus"),
        bsPopover("bsa9", "Modify the group label size", trigger = "focus"),
        bsPopover("bsa10", "Modify the subgroup label size", trigger = "focus"),
        bsPopover("bsa11", "Modify the size of subgroup labels", trigger = "focus"),
        checkboxInput("doratio", "Adjust the image download ratio", FALSE),
        conditionalPanel(
          condition = "input.doratio",
          numericInput("mHeight", "Plot download height", value =
                         "9"),
          numericInput("mWidth", "Plot download width", value =
                         "9")
        ) ,
        actionButton(
          "Smit",
          strong("Submit!"),
          styleclass = "success",
          width = '100%'
        )
      ),
      
      mainPanel(
        conditionalPanel(
          condition = "input.Variab == '2'",
          conditionalPanel(
            condition = "input.plottype == '1'",
            downloadButton("downmap.pdf", "Download PDF File"),
            downloadButton("downmap.svg", "Download SVG File"),
          )
        ),
        conditionalPanel(
          condition = "input.Variab == '1'",
          conditionalPanel(
            condition = "input.plottype == '1'",
            downloadButton("downmapm.pdf", "Download PDF File"),
            downloadButton("downmapm.svg", "Download SVG File"),
          )
        ),
        br(),
        br(),
        uiOutput("TReemap5"),
        uiOutput("TReemap4"),
        imageOutput("Images")
      )
    ),
    #About
    tabPanel("About",
             includeMarkdown("Instruction.md"))
  )
)