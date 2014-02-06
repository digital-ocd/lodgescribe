jQuery ->

  if ($("#datetimepicker").size() > 0)
    picker = $("#datetimepicker").datetimepicker
      language: "en"
      pick12HourFormat: true,
      format: "MM/dd/yyyy HH:mm PP"