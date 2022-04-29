options(shiny.maxRequestSize = 200 * 1024 ^ 2)

shinyServer(function(input, output, session) {
  #Level 1
  observe({
    if (input$Submit > 0) {
      isolate({
        if (input$Variable == "1") {
          if (input$input == "Upload input data" && !is.null(input$Upload)) {
            datainfoai <- file.info(input$Upload$datapath)
            if (datainfoai$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <- data.table::fread(
                  input$Upload$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) < 2) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else if (length(data[1,]) == 2) {
                names(data) <- c("group", "value")
                outcolor <- input$selectcolora
                heighmap <- paste0(input$Teemapheight, "px")
                widtmap <- paste0(input$Teemapwidth, "px")
                output$Image <- renderImage({
                  outfiles <- tempfile(fileext = '.png')
                  png(outfiles,
                      width = 800,
                      height = 600)
                  p <- treemap(
                    data,
                    index = "group",
                    vSize = "value",
                    type = "index",
                    palette = outcolor,
                    fontsize.labels = input$GLabelsize,
                    title = input$PlotTitle,
                    fontsize.title = input$Titlesize
                  )
                  dev.off()
                  list(
                    src = outfiles,
                    contentType = 'image/png',
                    width = widtmap,
                    height = heighmap,
                    alt = "This is alternate text"
                  )
                }, deleteFile = TRUE)
                
              }
            }
          } else {
            NULL
          }
          
          if (input$input == "Paste input data" && !is.null(input$Pastes)) {
            if (input$Pastes == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <- data.table::fread(
                input$Pastes,
                stringsAsFactors = F,
                fill = T)
              if (length(data[1,]) < 2) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else if (length(data[1,]) == 2) {
                names(data) <- c("group", "value")
                outcolor <- input$selectcolora
                heighmap <- paste0(input$Teemapheight, "px")
                widtmap <- paste0(input$Teemapwidth, "px")
                output$Image <- renderImage({
                  outfiles <- tempfile(fileext = '.png')
                  png(outfiles,
                      width = 800,
                      height = 600)
                  p <- treemap(
                    data,
                    index = "group",
                    vSize = "value",
                    type = "index",
                    palette = outcolor,
                    fontsize.labels = input$GLabelsize,
                    title = input$PlotTitle,
                    fontsize.title = input$Titlesize
                  )
                  dev.off()
                  list(
                    src = outfiles,
                    contentType = 'image/png',
                    width = widtmap,
                    height = heighmap,
                    alt = "This is alternate text"
                  )
                }, deleteFile = TRUE)
              }
            }
          } else {
            NULL
          }
          
        } else if (input$Variable == "2") {
          if (input$inputdataa == "Upload input data" && !is.null(input$Uploaddata)) {
            datainfoai <- file.info(input$Uploaddata$datapath)
            if (datainfoai$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <- data.table::fread(
                  input$Uploaddata$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) != 3) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "value", "value1")
                outcolor <- input$selectcolora
                heighmap <- paste0(input$Teemapheight, "px")
                widtmap <- paste0(input$Teemapwidth, "px")
                output$Image <- renderImage({
                  outfiles <- tempfile(fileext = '.png')
                  png(outfiles,
                      width = 800,
                      height = 600)
                  p <- treemap(
                    data,
                    index = "group",
                    vSize = "value",
                    vColor = "value1",
                    type = "value",
                    fontsize.legend = input$legendsize,
                    title.legend = input$colorvalue,
                    fontsize.labels = input$GLabelsize,
                    title = input$PlotTitle,
                    fontsize.title = input$Titlesize,
                    palette = outcolor
                  )
                  dev.off()
                  list(
                    src = outfiles,
                    contentType = 'image/png',
                    width = widtmap,
                    height = heighmap,
                    alt = "This is alternate text"
                  )
                }, deleteFile = TRUE)
              }
           }
          } else {
            NULL
          }
          
          if (input$inputdataa == "Paste input data" && !is.null(input$Pastedata)) {
            if (input$Pastedata == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <-
                data.table::fread(input$Pastedata,
                                  stringsAsFactors = F,
                                  fill = T)
              if (length(data[1,]) < 2) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else if (length(data[1,]) == 2) {
                names(data) <- c("group", "value")
                outcolor <- input$selectcolora
                heighmap <- paste0(input$Teemapheight, "px")
                widtmap <- paste0(input$Teemapwidth, "px")
                output$Image <- renderImage({
                  outfiles <- tempfile(fileext = '.png')
                  png(outfiles,
                      width = 800,
                      height = 600)
                  p <- treemap(
                    data,
                    index = "group",
                    vSize = "value",
                    type = "index",
                    palette = outcolor,
                    fontsize.labels = input$GLabelsize,
                    title = input$PlotTitle,
                    fontsize.title = input$Titlesize
                  )
                  dev.off()
                  list(
                    src = outfiles,
                    contentType = 'image/png',
                    width = widtmap,
                    height = heighmap,
                    alt = "This is alternate text"
                  )
                }, deleteFile = TRUE)
              } else {
                names(data) <- c("group", "value", "value1")
                outcolor <- input$selectcolora
                heighmap <- paste0(input$Teemapheight, "px")
                widtmap <- paste0(input$Teemapwidth, "px")
                output$Image <- renderImage({
                  outfiles <- tempfile(fileext = '.png')
                  png(outfiles,
                      width = 800,
                      height = 600)
                  p <- treemap(
                    data,
                    index = "group",
                    vSize = "value",
                    vColor = "value1",
                    type = "value",
                    fontsize.legend = input$legendsize,
                    title.legend = input$colorvalue,
                    fontsize.labels = input$GLabelsize,
                    title = input$PlotTitle,
                    fontsize.title = input$Titlesize,
                    palette = outcolor
                  )
                  dev.off()
                  list(
                    src = outfiles,
                    contentType = 'image/png',
                    width = widtmap,
                    height = heighmap,
                    alt = "This is alternate text"
                  )
                }, deleteFile = TRUE)
              }
            }
          } else {
            NULL
          }
        }
      })
    } else {
      NULL
    }
    # download PDF
    output$downloadtreemap.pdf <- downloadHandler(filename = "treemap.pdf",
                                                  content <- function(file) {
                                                    pdf(file,
                                                        width = input$treemapWidth,
                                                        height = input$treemapHeight)
                                                    p <- treemap(
                                                      data,
                                                      index = "group",
                                                      vSize = "value",
                                                      vColor = "value1",
                                                      type = "value",
                                                      fontsize.legend = input$legendsize,
                                                      title.legend = input$colorvalue,
                                                      fontsize.labels = input$GLabelsize,
                                                      title = input$PlotTitle,
                                                      fontsize.title = input$Titlesize,
                                                      palette = outcolor
                                                    )
                                                    dev.off()
                                                  },
                                                  contentType = 'application/pdf')
    
    output$downloadtreema.pdf <- downloadHandler(filename = "treemap.pdf",
                                                 content <- function(file) {
                                                   pdf(file,
                                                       width = input$treemapWidth,
                                                       height = input$treemapHeight)
                                                   p <- treemap(
                                                     data,
                                                     index = "group",
                                                     vSize = "value",
                                                     type = "index",
                                                     palette = outcolor,
                                                     fontsize.labels = input$GLabelsize,
                                                     title = input$PlotTitle,
                                                     fontsize.title = input$Titlesize
                                                   )
                                                   dev.off()
                                                 },
                                                 contentType = 'application/pdf')
    
    # download SVG
    output$downloadtreemap.svg <- downloadHandler(filename = "treemap.svg",
                                                  content <- function(file) {
                                                    svg(file,
                                                        width = input$treemapWidth,
                                                        height = input$treemapHeight)
                                                    p <- treemap(
                                                      data,
                                                      index = "group",
                                                      vSize = "value",
                                                      vColor = "value1",
                                                      type = "value",
                                                      fontsize.legend = input$legendsize,
                                                      title.legend = input$colorvalue,
                                                      fontsize.labels = input$GLabelsize,
                                                      title = input$PlotTitle,
                                                      fontsize.title = input$Titlesize,
                                                      palette = outcolor
                                                    )
                                                    dev.off()
                                                  },
                                                  contentType = 'image/svg')
    
    output$downloadtreema.svg <- downloadHandler(filename = "treemap.svg",
                                                 content <- function(file) {
                                                   svg(file,
                                                       width = input$treemapWidth,
                                                       height = input$treemapHeight)
                                                   p <- treemap(
                                                     data,
                                                     index = "group",
                                                     vSize = "value",
                                                     type = "index",
                                                     palette = outcolor,
                                                     fontsize.labels = input$GLabelsize,
                                                     title = input$PlotTitle,
                                                     fontsize.title = input$Titlesize
                                                   )
                                                   dev.off()
                                                 },
                                                 contentType = 'image/svg')
  })
  # paste example
  observe({
    if (input$Pasteexampl > 0) {
      isolate({
        examp <- readLines("Example_data_11.txt")
        updateTextAreaInput(session, "Pastes", value = paste0(examp, collapse = "\n"))
      })
    } else {
      NULL
    }
  })
  observe({
    if (input$Pasteexample > 0) {
      isolate({
        examp <- readLines("Example_data_1.txt")
        updateTextAreaInput(session, "Pastedata", value = paste0(examp, collapse = "\n"))
      })
    } else {
      NULL
    }
  })
  # download exampl data
  output$Download <- downloadHandler(filename <- function() {
    paste('Example_data_11.txt')
  },
  content <- function(file) {
    input_filee <- "Example_data_11.txt"
    example_date <-
      read.table(
        input_filee,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_date,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
  
  output$Downloaddata <- downloadHandler(filename <- function() {
    paste('Example_data_1.txt')
  },
  content <- function(file) {
    input_file <- "Example_data_1.txt"
    example_dat <-
      read.table(
        input_file,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_dat,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
  
  
  
  #Level 2
  observe({
    if (input$submit1 > 0) {
      isolate({
        if (input$Variabl == "1") {
          if (input$inputdatan == "Upload input data" &&
              !is.null(input$Uploadndata)) {
            datainfoo <- file.info(input$Uploadndata$datapath)
            if (datainfoo$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <-
                data.table::fread(
                  input$Uploadndata$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) < 3) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "value")
                outcol <- input$selectcolor
                heightmap <- paste0(input$treeheight, "px")
                widthmap <- paste0(input$treewidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup"),
                  vSize = "value",
                  type = "index",
                  palette = outcol,
                  fontsize.labels = c(17, 14),
                  fontface.labels = c(2, 1),
                  fontsize.title = 12,
                  align.labels = list(c("center", "center"),
                                      c("right", "bottom")),
                  inflate.labels = F
                )
                if (input$selecttype == "2") {
                  ggmar <- function() {
                    return(d3tree2(p ,  rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3tree2Output(
                      outputId = "Treemapsd2",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    ggout
                  })
                  output$Treemapsd2 <- renderHighchart({
                    ggmar()
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "3") {
                  ggmar <- function() {
                    return(d3tree(p, rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3treeOutput(
                      outputId = "Treemapsd3",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    ggout
                  })
                  output$Treemapsd3 <- renderHighchart({
                    ggmar()
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "1") {
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup"),
                      vSize = "value",
                      type = "index",
                      fontface.labels = c(2, 1),
                      palette = outcol,
                      fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                      title = input$TreeplotTitle,
                      fontsize.title = input$Title_size,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = widthmap,
                      height = heightmap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                }
              }
            }
          } else {
            NULL
          }
          if (input$inputdatan == "Paste input data" &&
              !is.null(input$Pastendata)) {
            if (input$Pastendata == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <-
                data.table::fread(input$Pastendata,
                                  stringsAsFactors = F,
                                  fill = T)
              if (length(data[1,]) < 3) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "value")
                outcol <- input$selectcolor
                heightmap <- paste0(input$treeheight, "px")
                widthmap <- paste0(input$treewidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup"),
                  vSize = "value",
                  type = "index",
                  palette = outcol,
                  fontsize.labels = c(17, 14),
                  fontface.labels = c(2, 1),
                  fontsize.title = 12,
                  align.labels = list(c("center", "center"),
                                      c("right", "bottom")),
                  inflate.labels = F
                )
                if (input$selecttype == "2") {
                  ggmar <-
                    function() {
                      return(d3tree2(p , rootname = input$Treemap_plotTitle))
                    }
                  ggout <-
                    d3tree2Output(
                      outputId = "Treemapsd2",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    ggout
                  })
                  output$Treemapsd2 <- renderHighchart({
                    ggmar()
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "3") {
                  ggmar <- function() {
                    return(d3tree(p ,  rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3treeOutput(
                      outputId = "Treemapsd3",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    ggout
                  })
                  output$Treemapsd3 <- renderHighchart({
                    ggmar()
                  })
                  output$myImage <- renderImage({
                    outfilen <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "1") {
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup"),
                      vSize = "value",
                      type = "index",
                      fontface.labels = c(2, 1),
                      palette = outcol,
                      fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                      title = input$TreeplotTitle,
                      fontsize.title = input$Title_size,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = widthmap,
                      height = heightmap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                }
              }
            }
          } else {
            NULL
          }
          
        } else if (input$Variabl == "2") {
          if (input$inputdata == "Upload input data" &&
              !is.null(input$Upload_data)) {
            datainfo <- file.info(input$Upload_data$datapath)
            if (datainfo$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <-
                data.table::fread(
                  input$Upload_data$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) != 4) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "value", "value1")
                outcol <- input$selectcolor
                heightmap <- paste0(input$treeheight, "px")
                widthmap <- paste0(input$treewidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup"),
                  vSize = "value",
                  type = "value",
                  palette = outcol,
                  fontsize.legend = input$legend_size,
                  title.legend = input$color_value,
                  fontsize.labels = c(17, 14),
                  fontface.labels = c(2, 1),
                  fontsize.title = 12,
                  align.labels = list(c("center", "center"),
                                      c("right", "bottom")),
                  inflate.labels = F
                )
                if (input$selecttype == "2") {
                  ggmar <- function() {
                    return(d3tree2(p ,  rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3tree2Output(
                      outputId = "Treemapsd2",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    ggout
                  })
                  output$Treemapsd2 <- renderHighchart({
                    ggmar()
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "3") {
                  ggmar <- function() {
                    return(d3tree(p, rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3treeOutput(
                      outputId = "Treemapsd3",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    ggout
                  })
                  output$Treemapsd3 <- renderHighchart({
                    ggmar()
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "1") {
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup"),
                      vSize = "value",
                      vColor = "value1",
                      type = "value",
                      fontface.labels = c(2, 1),
                      palette = outcol,
                      fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                      fontsize.legend = input$legend_size,
                      title.legend = input$color_value,
                      title = input$TreeplotTitle,
                      fontsize.title = input$Title_size,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = widthmap,
                      height = heightmap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                }
              }
            }
          } else {
            NULL
          }
          if (input$inputdata == "Paste input data" &&
              !is.null(input$Paste_data)) {
            if (input$Paste_data == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <-
                data.table::fread(input$Paste_data,
                                  stringsAsFactors = F,
                                  fill = T)
              if (length(data[1,]) != 4) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "value", "value1")
                outcol <- input$selectcolor
                heightmap <- paste0(input$treeheight, "px")
                widthmap <- paste0(input$treewidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup"),
                  vSize = "value",
                  vColor = "value1",
                  type = "value",
                  palette = outcol,
                  fontsize.legend = input$legend_size,
                  title.legend = input$color_value,
                  fontsize.labels = c(17, 14),
                  fontface.labels = c(2, 1),
                  fontsize.title = 12,
                  align.labels = list(c("center", "center"),
                                      c("right", "bottom")),
                  inflate.labels = F
                )
                if (input$selecttype == "2") {
                  ggmar <-
                    function() {
                      return(d3tree2(p , rootname = input$Treemap_plotTitle))
                    }
                  ggout <-
                    d3tree2Output(
                      outputId = "Treemapsd2",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    ggout
                  })
                  output$Treemapsd2 <- renderHighchart({
                    ggmar()
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "3") {
                  ggmar <- function() {
                    return(d3tree(p ,  rootname = input$Treemap_plotTitle))
                  }
                  ggout <-
                    d3treeOutput(
                      outputId = "Treemapsd3",
                      height = heightmap,
                      width = widthmap
                    )
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    ggout
                  })
                  output$Treemapsd3 <- renderHighchart({
                    ggmar()
                  })
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$selecttype == "1") {
                  output$myImage <- renderImage({
                    outfile <- tempfile(fileext = '.png')
                    png(outfile,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup"),
                      vSize = "value",
                      vColor = "value1",
                      type = "value",
                      fontface.labels = c(2, 1),
                      palette = outcol,
                      fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                      title.legend = input$color_value,
                      fontsize.legend = input$legend_size,
                      title = input$TreeplotTitle,
                      fontsize.title = input$Title_size,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfile,
                      contentType = 'image/png',
                      width = widthmap,
                      height = heightmap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap2 <- renderUI({
                    NULL
                  })
                  output$Treemapsd2 <- renderHighchart({
                    NULL
                  })
                  output$TReemap3 <- renderUI({
                    NULL
                  })
                  output$Treemapsd3 <- renderHighchart({
                    NULL
                  })
                  
                }
              }
            }
          } else {
            NULL
          }
        }
      })
    } else {
      NULL
    }
    # download PDF
    output$downtreemapn.pdf <- downloadHandler(filename = "treemap.pdf",
                                               content <- function(file) {
                                                 pdf(file,
                                                     width = input$mapHeight,
                                                     height = input$mapWidth)
                                                 p <- treemap(
                                                   data,
                                                   index = c("group", "subgroup"),
                                                   vSize = "value",
                                                   type = "index",
                                                   fontface.labels = c(2, 1),
                                                   palette = outcol,
                                                   fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                                                   title = input$TreeplotTitle,
                                                   fontsize.title = input$Title_size,
                                                   align.labels = list(c("center", "center"),
                                                                       c("right", "bottom")),
                                                   inflate.labels = F
                                                 )
                                                 dev.off()
                                               },
                                               contentType = 'application/pdf')
    
    # download SVG
    output$downtreemapn.pdf <- downloadHandler(filename = "treemap.svg",
                                               content <- function(file) {
                                                 svg(file,
                                                     width = input$mapHeight,
                                                     height = input$mapWidth)
                                                 p <- treemap(
                                                   data,
                                                   index = c("group", "subgroup"),
                                                   vSize = "value",
                                                   type = "index",
                                                   fontface.labels = c(2, 1),
                                                   palette = outcol,
                                                   fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                                                   title = input$TreeplotTitle,
                                                   fontsize.title = input$Title_size,
                                                   align.labels = list(c("center", "center"),
                                                                       c("right", "bottom")),
                                                   inflate.labels = F
                                                 )
                                                 dev.off()
                                               },
                                               contentType = 'image/svg')
    # download PDF
    output$downtreemap.pdf <- downloadHandler(filename = "treemap.pdf",
                                              content <- function(file) {
                                                pdf(file,
                                                    width = input$mapHeight,
                                                    height = input$mapWidth)
                                                p <- treemap(
                                                  data,
                                                  index = c("group", "subgroup"),
                                                  vSize = "value",
                                                  vColor = "value1",
                                                  type = "value",
                                                  fontface.labels = c(2, 1),
                                                  palette = outcol,
                                                  fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                                                  fontsize.legend = input$legend_size,
                                                  title.legend = input$color_value,
                                                  title = input$TreeplotTitle,
                                                  fontsize.title = input$Title_size,
                                                  align.labels = list(c("center", "center"),
                                                                      c("right", "bottom")),
                                                  inflate.labels = F
                                                )
                                                
                                                dev.off()
                                              },
                                              contentType = 'application/pdf')
    
    # download SVG
    output$downtreemap.svg <- downloadHandler(filename = "treemap.svg",
                                              content <- function(file) {
                                                svg(file,
                                                    width = input$mapHeight,
                                                    height = input$mapWidth)
                                                p <- treemap(
                                                  data,
                                                  index = c("group", "subgroup"),
                                                  vSize = "value",
                                                  vColor = "value1",
                                                  type = "value",
                                                  fontface.labels = c(2, 1),
                                                  palette = outcol,
                                                  fontsize.labels = c(input$GLabels_size, input$SLabels_size),
                                                  fontsize.legend = input$legend_size,
                                                  title.legend = input$color_value,
                                                  title = input$TreeplotTitle,
                                                  fontsize.title = input$Title_size,
                                                  align.labels = list(c("center", "center"),
                                                                      c("right", "bottom")),
                                                  inflate.labels = F
                                                )
                                                dev.off()
                                              },
                                              contentType = 'image/svg')
  })
  # paste example
  observe({
    if (input$Paste_example > 0) {
      isolate({
        exam <- readLines("Example_data_2.txt")
        updateTextAreaInput(session, "Paste_data", value = paste0(exam, collapse = "\n"))
      })
    }
    else {
      NULL
    }
  })
  observe({
    if (input$Pastenexample > 0) {
      isolate({
        exam <- readLines("Example_data_22.txt")
        updateTextAreaInput(session, "Pastendata", value = paste0(exam, collapse = "\n"))
      })
    }
    else {
      NULL
    }
  })
  # download exampl data
  output$Exampledatatxt <- downloadHandler(filename <- function() {
    paste('Example_data_2.txt')
  },
  content <- function(file) {
    input_file <- "Example_data_2.txt"
    example_dat <-
      read.table(
        input_file,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_dat,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
  
  output$Exampledatatxtn <- downloadHandler(filename <- function() {
    paste('Example_data_22.txt')
  },
  content <- function(file) {
    input_file <- "Example_data_22.txt"
    example_dat <-
      read.table(
        input_file,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_dat,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
  
  #Level 3
  observe({
    if (input$Smit > 0) {
      isolate({
        if (input$Variab == "2") {
          if (input$inputdataaa == "Upload input data" &&
              !is.null(input$Uploadmm)) {
            datainfoaa <- file.info(input$Uploadmm$datapath)
            if (datainfoaa$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <-
                data.table::fread(
                  input$Uploadmm$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) != 5) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <-
                  c("group",
                    "subgroup",
                    "subsubgroup",
                    "value",
                    "value1")
                OutColors <- input$color
                heimap <- paste0(input$theight, "px")
                wimap <- paste0(input$twidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup", "subsubgroup"),
                  vSize = "value",
                  vColor = "value1",
                  type = "value",
                  fontsize.legend = input$legendS,
                  title.legend = input$Colvalue,
                  fontsize.labels = c(28, 18, 11),
                  fontface.labels = c(2, 1),
                  palette = OutColors,
                  fontsize.title = 12,
                  align.labels = list(
                    c("center", "center"),
                    c("right", "bottom"),
                    c("right", "bottom")
                  ),
                  inflate.labels = F
                )
                if (input$plottype == "2") {
                  ggmor <- function() {
                    return(d3tree2(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3tree2Output(
                      outputId = "Treemapsd4",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    ggou
                  })
                  output$Treemapsd4 <-
                    renderHighchart({
                      ggmor()
                    })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "3") {
                  ggmor <- function() {
                    return(d3tree(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3treeOutput(
                      outputId = "Treemapsd5",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    ggou
                  })
                  output$Treemapsd5 <-
                    renderHighchart({
                      ggmor()
                    })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "1") {
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup", "subsubgroup"),
                      vSize = "value",
                      vColor = "value1",
                      type = "value",
                      fontface.labels = c(2, 1),
                      palette = OutColors,
                      fontsize.labels = c(
                        input$GLabelsS,
                        input$SLabelsS,
                        input$SsLabelsS
                      ),
                      fontsize.legend = input$legendS,
                      title.legend = input$Colvalue,
                      title = input$TreeMapTitle,
                      fontsize.title = input$TitleS,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = wimap,
                      height = heimap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <-
                    renderHighchart({
                      NULL
                    })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <-
                    renderHighchart({
                      NULL
                    })
                }
              }
            }
          } else {
            NULL
          }
          
          if (input$inputdataaa == "Paste input data" &&
              !is.null(input$Paste)) {
            if (input$Paste == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <-
                data.table::fread(input$Paste,
                                  stringsAsFactors = F,
                                  fill = T)
              if (length(data[1,]) != 5) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <-
                  c("group",
                    "subgroup",
                    "subsubgroup",
                    "value",
                    "value1")
                OutColors <- input$color
                heimap <- paste0(input$theight, "px")
                wimap <- paste0(input$twidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup", "subsubgroup"),
                  vSize = "value",
                  vColor = "value1",
                  type = "value",
                  fontsize.legend = input$legendS,
                  title.legend = input$Colvalue,
                  fontsize.labels = c(17, 14, 9),
                  fontface.labels = c(2, 1),
                  palette = OutColors,
                  fontsize.title = 12,
                  align.labels = list(
                    c("center", "center"),
                    c("right", "bottom"),
                    c("right", "bottom")
                  ),
                  inflate.labels = F
                )
                
                if (input$plottype == "2") {
                  ggmor <- function() {
                    return(d3tree2(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3tree2Output(
                      outputId = "Treemapsd4",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    ggou
                  })
                  output$Treemapsd4 <-
                    renderHighchart({
                      ggmor()
                    })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "3") {
                  ggmor <- function() {
                    return(d3tree(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3treeOutput(
                      outputId = "Treemapsd5",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    ggou
                  })
                  output$Treemapsd5 <- renderHighchart({
                    ggmor()
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "1") {
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup", "subsubgroup"),
                      vSize = "value",
                      vColor = "value1",
                      type = "value",
                      fontface.labels = c(2, 1),
                      palette = OutColors,
                      fontsize.labels = c(
                        input$GLabelsS,
                        input$SLabelsS,
                        input$SsLabelsS
                      ),
                      fontsize.legend = input$legendS,
                      title.legend = input$Colvalue,
                      title = input$TreeMapTitle,
                      fontsize.title = input$TitleS,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = wimap,
                      height = heimap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  
                }
              }
            }
          } else {
            NULL
          }
          
        } else if (input$Variab == "1") {
          if (input$inputdataam == "Upload input data" &&
              !is.null(input$Uploadm)) {
            datainfoaam <- file.info(input$Uploadm$datapath)
            if (datainfoaam$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <-
                data.table::fread(
                  input$Uploadm$datapath,
                  stringsAsFactors = F,
                  fill = T
                )
              if (length(data[1,]) < 4) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "subsubgroup", "value")
                OutColors <- input$color
                heimap <- paste0(input$theight, "px")
                wimap <- paste0(input$twidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup", "subsubgroup"),
                  vSize = "value",
                  type = "index",
                  fontsize.labels = c(28, 18, 11),
                  fontface.labels = c(2, 1),
                  palette = OutColors,
                  fontsize.title = 12,
                  align.labels = list(
                    c("center", "center"),
                    c("right", "bottom"),
                    c("right", "bottom")
                  ),
                  inflate.labels = F
                )
                if (input$plottype == "2") {
                  ggmor <- function() {
                    return(d3tree2(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3tree2Output(
                      outputId = "Treemapsd4",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    ggou
                  })
                  output$Treemapsd4 <- renderHighchart({
                    ggmor()
                  })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "3") {
                  ggmor <- function() {
                    return(d3tree(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3treeOutput(
                      outputId = "Treemapsd5",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    ggou
                  })
                  output$Treemapsd5 <- renderHighchart({
                    ggmor()
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "1") {
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup", "subsubgroup"),
                      vSize = "value",
                      type = "index",
                      fontface.labels = c(2, 1),
                      palette = OutColors,
                      fontsize.labels = c(
                        input$GLabelsS,
                        input$SLabelsS,
                        input$SsLabelsS
                      ),
                      title = input$TreeMapTitle,
                      fontsize.title = input$TitleS,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = wimap,
                      height = heimap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  
                }
              }
            }
          } else {
            NULL
          }
          
          if (input$inputdataam == "Paste input data" &&
              !is.null(input$Pastem)) {
            if (input$Pastem == "") {
              sendSweetAlert(session = session,
                             title = "No input data received!",
                             type = "error")
            } else {
              data <-
                data.table::fread(input$Pastem,
                                  stringsAsFactors = F,
                                  fill = T)
              if (length(data[1,]) < 4) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !",
                  type = "error",
                  text = "Please check the input data format!"
                )
              } else {
                names(data) <- c("group", "subgroup", "subsubgroup", "value")
                OutColors <- input$color
                heimap <- paste0(input$theight, "px")
                wimap <- paste0(input$twidth, "px")
                p <- treemap(
                  data,
                  index = c("group", "subgroup", "subsubgroup"),
                  vSize = "value",
                  type = "index",
                  fontsize.labels = c(17, 14, 9),
                  fontface.labels = c(2, 1),
                  palette = OutColors,
                  fontsize.title = 12,
                  align.labels = list(
                    c("center", "center"),
                    c("right", "bottom"),
                    c("right", "bottom")
                  ),
                  inflate.labels = F
                )
                
                if (input$plottype == "2") {
                  ggmor <- function() {
                    return(d3tree2(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3tree2Output(
                      outputId = "Treemapsd4",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    ggou
                  })
                  output$Treemapsd4 <- renderHighchart({
                    ggmor()
                  })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "3") {
                  ggmor <- function() {
                    return(d3tree(p, rootname = input$TreemapTitle))
                  }
                  ggou <-
                    d3treeOutput(
                      outputId = "Treemapsd5",
                      height = heimap,
                      width = wimap
                    )
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    ggou
                  })
                  output$Treemapsd5 <- renderHighchart({
                    ggmor()
                  })
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = 800,
                      height = 600,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                } else if (input$plottype == "1") {
                  output$Images <- renderImage({
                    outfilee <- tempfile(fileext = '.png')
                    png(outfilee,
                        width = 800,
                        height = 600)
                    p <- treemap(
                      data,
                      index = c("group", "subgroup", "subsubgroup"),
                      vSize = "value",
                      type = "index",
                      fontface.labels = c(2, 1),
                      palette = OutColors,
                      fontsize.labels = c(
                        input$GLabelsS,
                        input$SLabelsS,
                        input$SsLabelsS
                      ),
                      title = input$TreeMapTitle,
                      fontsize.title = input$TitleS,
                      align.labels = list(
                        c("center", "center"),
                        c("right", "bottom"),
                        c("right", "bottom")
                      ),
                      inflate.labels = F
                    )
                    dev.off()
                    list(
                      src = outfilee,
                      contentType = 'image/png',
                      width = wimap,
                      height = heimap,
                      alt = "This is alternate text"
                    )
                  }, deleteFile = TRUE)
                  output$TReemap4 <- renderUI({
                    NULL
                  })
                  output$Treemapsd4 <- renderHighchart({
                    NULL
                  })
                  output$TReemap5 <- renderUI({
                    NULL
                  })
                  output$Treemapsd5 <- renderHighchart({
                    NULL
                  })
                }
              }
            }
          } else {
            NULL
          }
        }
      })
    } else {
      NULL
    }
    # download PDF
    output$downmap.pdf <- downloadHandler(filename = "treemap.pdf",
                                          content <- function(file) {
                                            pdf(file,
                                                width = input$mHeight,
                                                height = input$mWidth)
                                            p <- treemap(
                                              data,
                                              index = c("group", "subgroup", "subsubgroup"),
                                              vSize = "value",
                                              vColor = "value1",
                                              type = "value",
                                              fontface.labels = c(2, 1),
                                              palette = OutColors,
                                              fontsize.labels = c(input$GLabelsS, input$SLabelsS, input$SsLabelsS),
                                              fontsize.legend = input$legendS,
                                              title.legend = input$Colvalue,
                                              title = input$TreeMapTitle,
                                              fontsize.title = input$TitleS,
                                              align.labels = list(
                                                c("center", "center"),
                                                c("right", "bottom"),
                                                c("right", "bottom")
                                              ),
                                              inflate.labels = F
                                            )
                                            dev.off()
                                          },
                                          contentType = 'application/pdf')
    
    # download SVG
    output$downmap.svg <- downloadHandler(filename = "treemap.svg",
                                          content <- function(file) {
                                            svg(file,
                                                width = input$mHeight,
                                                height = input$mWidth)
                                            p <- treemap(
                                              data,
                                              index = c("group", "subgroup", "subsubgroup"),
                                              vSize = "value",
                                              vColor = "value1",
                                              type = "value",
                                              fontface.labels = c(2, 1),
                                              palette = OutColors,
                                              fontsize.labels = c(input$GLabelsS, input$SLabelsS, input$SsLabelsS),
                                              fontsize.legend = input$legendS,
                                              title.legend = input$Colvalue,
                                              title = input$TreeMapTitle,
                                              fontsize.title = input$TitleS,
                                              align.labels = list(
                                                c("center", "center"),
                                                c("right", "bottom"),
                                                c("right", "bottom")
                                              ),
                                              inflate.labels = F
                                            )
                                            dev.off()
                                          },
                                          contentType = 'image/svg')
    # download PDF
    output$downmapm.pdf <- downloadHandler(filename = "treemap.pdf",
                                           content <- function(file) {
                                             pdf(file,
                                                 width = input$mHeight,
                                                 height = input$mWidth)
                                             p <- treemap(
                                               data,
                                               index = c("group", "subgroup", "subsubgroup"),
                                               vSize = "value",
                                               type = "index",
                                               fontface.labels = c(2, 1),
                                               palette = OutColors,
                                               fontsize.labels = c(input$GLabelsS, input$SLabelsS, input$SsLabelsS),
                                               title = input$TreeMapTitle,
                                               fontsize.title = input$TitleS,
                                               align.labels = list(
                                                 c("center", "center"),
                                                 c("right", "bottom"),
                                                 c("right", "bottom")
                                               ),
                                               inflate.labels = F
                                             )
                                             dev.off()
                                           },
                                           contentType = 'application/pdf')
    
    # download SVG
    output$downmapm.svg <- downloadHandler(filename = "treemap.svg",
                                           content <- function(file) {
                                             svg(file,
                                                 width = input$mHeight,
                                                 height = input$mWidth)
                                             p <- treemap(
                                               data,
                                               index = c("group", "subgroup", "subsubgroup"),
                                               vSize = "value",
                                               type = "index",
                                               fontface.labels = c(2, 1),
                                               palette = OutColors,
                                               fontsize.labels = c(input$GLabelsS, input$SLabelsS, input$SsLabelsS),
                                               fontsize.title = input$TitleS,
                                               align.labels = list(
                                                 c("center", "center"),
                                                 c("right", "bottom"),
                                                 c("right", "bottom")
                                               ),
                                               inflate.labels = F
                                             )
                                             dev.off()
                                           },
                                           contentType = 'image/svg')
    
  })
  
  #Paste data
  observe({
    if (input$PasteE > 0) {
      isolate({
        exampl <- readLines("Example_data_3.txt")
        updateTextAreaInput(session, "Paste", value = paste0(exampl, collapse = "\n"))
      })
    } else {
      NULL
    }
  })
  #Paste data
  observe({
    if (input$PasteEm > 0) {
      isolate({
        exampl <- readLines("Example_data_33.txt")
        updateTextAreaInput(session, "Pastem", value = paste0(exampl, collapse = "\n"))
      })
    } else {
      NULL
    }
  })
  #Download example data
  output$Exampledata <- downloadHandler(filename <- function() {
    paste('Example_data_3.txt')
  },
  content <- function(file) {
    input_file <- "Example_data_3.txt"
    example_dat <-
      read.table(
        input_file,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_dat,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
  #Download example data
  output$Exampledatam <- downloadHandler(filename <- function() {
    paste('Example_data_33.txt')
  },
  content <- function(file) {
    input_file <- "Example_data_33.txt"
    example_dat <-
      read.table(
        input_file,
        header = F,
        as.is = T,
        sep = "\t",
        quote = ""
      )
    write.table(
      example_dat,
      file = file,
      row.names = F,
      quote = F,
      sep = "\t"
    )
  }, contentType = 'text/csv')
})