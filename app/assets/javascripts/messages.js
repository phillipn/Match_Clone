$(document).on('turbolinks:load', function() {
  $("#messages").height($(window).height() - "200px");
  $("#messages").scrollTop(100000)

  function update(){
    $('.new').each(function(index, element){
      var time = $(this).data('time')

      if(time == '1'){
        $(this).text(" a minute ago")
      } else {
        $(this).text(" " + time + " minutes ago")
      }

      $(this).data('time', parseInt($(this).data('time')) + 1)
    })
  }
  setInterval(update, 60000)
})
