jQuery ->

  if ($("#datetimepicker").size() > 0)
    picker = $("#datetimepicker").datepicker
      language: "en"
      pick12HourFormat: true
      format: "MM/dd/yyyy HH:mm PP"

  if ($(".date-picker  ").size() > 0)
    $(".date-picker  ").datepicker
      language: "en"
      format: "mm/dd/yyyy"
