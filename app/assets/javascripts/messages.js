$(document).on('turbolinks:load', function() {
  $("#messages").height($(window).height() - "200px");
  $("#messages").scrollTop(100000)
})
