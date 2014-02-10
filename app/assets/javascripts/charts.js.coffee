jQuery ->
  if $("#curator_ratings_reviews").length
    data = $('#curator_ratings_reviews').data('curator-ratings')
    new Morris.Line(
      element: "curator_ratings_reviews"
      data: data
      xkey: "curated_at"
      ykeys: ["review_count"]
      labels: ["Reviews"]
      hideHover: 'auto'
      xLabelFormat: (curated_at) ->
        d = new Date(curated_at)
        (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear()
      dateFormat: (curated_at) ->
        d = new Date(curated_at)
        d.toDateString()
    )

  if $("#morris_line_review").length
    data = $('#morris_line_review').data('curator-ratings')
    meta_data = $('#morris_line_review').data('chart-metadata')
    new Morris.Line
      element: "morris_line_review"
      data: data
      xkey: "created_at"
      ykeys: meta_data[0].ykeys
      labels: meta_data[0].labels
      hideHover: 'auto'
      xLabelFormat: (curated_at) ->
        d = new Date(curated_at)
        (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear()
      dateFormat: (curated_at) ->
        d = new Date(curated_at)
        d.toDateString()

  if $("#donut_ratings").length
    data = $('#donut_ratings').data('curator-ratings')
    new Morris.Donut
      element: "donut_ratings"
      data: data

  if $("#donut_reviews").length
    data = $('#donut_reviews').data('curator-ratings')
    new Morris.Donut
      element: "donut_reviews"
      data: data

  if $("#morris_bar_ratings").length
    data = $('#morris_bar_ratings').data('curator-ratings')
    Morris.Bar({
      element: 'morris_bar_ratings',
      data: data,
      xkey: 'name',
      ykeys: ['rating'],
      labels: ['Rating'],
      numLines: 6,
      hideHover: 'auto'
    });

  if $("#rickshaw_line_ratings").length
    data_series = $('#rickshaw_line_ratings').data('curator-reviews')
    graph_rickshaw_line_ratings = new Rickshaw.Graph
      element: document.getElementById("rickshaw_line_ratings_chart")
      height: 150
      renderer: "line"
      series: data_series
    legend = new Rickshaw.Graph.Legend
      element: document.querySelector("#rickshaw_line_ratings_legend")
      graph: graph_rickshaw_line_ratings
    shelving = new Rickshaw.Graph.Behavior.Series.Toggle
      graph: graph_rickshaw_line_ratings
      legend: legend
    hoverDetail = new Rickshaw.Graph.HoverDetail
      graph: graph_rickshaw_line_ratings
      formatter: (series, x, y) ->
        content = series.name + ": " + y
        content
      xFormatter: (x) ->
        date = moment.unix(x)
        date.format("dddd, MMMM D, YYYY")
    xAxis = new Rickshaw.Graph.Axis.Time
      graph: graph_rickshaw_line_ratings
    yAxis = new Rickshaw.Graph.Axis.Y
      graph: graph_rickshaw_line_ratings
      orientation: "left"
      ticks: 6
      tickValues: [0, 1, 2, 3, 4, 5]
      tickSize: 6
      tickFormat: Rickshaw.Fixtures.Number.formatKMBT
      element: document.getElementById("rickshaw_line_ratings_y_axis")
    graph_rickshaw_line_ratings.render()

    resize = ->
      graph_rickshaw_line_ratings.configure
        width: $('#rickshaw_line_ratings').width()

      graph_rickshaw_line_ratings.render()

    window.addEventListener "resize", resize
    resize()


  if $("#rickshaw_line_reviews").length
    data_series = $('#rickshaw_line_reviews').data('curator-reviews')
    graph_rickshaw_line_reviews = new Rickshaw.Graph(
      element: document.getElementById("rickshaw_line_reviews_chart")
      height: 300
      renderer: "line"
      series: data_series
    )
    legend = new Rickshaw.Graph.Legend
      element: document.querySelector("#rickshaw_line_reviews_legend")
      graph: graph_rickshaw_line_reviews
    shelving = new Rickshaw.Graph.Behavior.Series.Toggle
      graph: graph_rickshaw_line_reviews
      legend: legend
    hoverDetail = new Rickshaw.Graph.HoverDetail
      graph: graph_rickshaw_line_reviews
      formatter: (series, x, y) ->
        content = series.name + ": " +parseInt(y)
        content
      xFormatter: (x) ->
        date = moment.unix(x)
        date.format("dddd, MMMM D, YYYY")
    xAxis = new Rickshaw.Graph.Axis.Time(graph: graph_rickshaw_line_reviews)
    yAxis = new Rickshaw.Graph.Axis.Y
      graph: graph_rickshaw_line_reviews
      orientation: "left"
      tickFormat: Rickshaw.Fixtures.Number.formatKMBT
      element: document.getElementById("rickshaw_line_reviews_y_axis")
    graph_rickshaw_line_reviews.render()

    resize = ->
      graph_rickshaw_line_reviews.configure
        width: $('#rickshaw_line_reviews').width()

      graph_rickshaw_line_reviews.render()

    window.addEventListener "resize", resize
    resize()
