jQuery ->

  if ($("#datetimepicker").size() > 0)
    picker = $("#datetimepicker").datepicker
      language: "en"
      pick12HourFormat: true
      format: "MM/dd/yyyy HH:mm PP"

  if ($(".date-mask  ").size() > 0)
    $(".date-mask  ").mask("99/99/9999");
