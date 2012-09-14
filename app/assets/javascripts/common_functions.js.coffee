window.show_loading = () ->
  $('body').append("<div class='ui-widget-overlay' style='z-index: 1001'></div>")
  $('.ui-widget-overlay').css('width', $('body').width() + 'px')
  $('.ui-widget-overlay').css('height', $('body').height() + 'px')
  $('#loading_gif').css('top', ($('body').height()/2 - 150) + 'px' )
  $('#loading_gif').css('left', ($('body').width()/2 - 100) + 'px' )
  $('#loading_gif').show()

window.hide_loading = () ->
  $('.ui-widget-overlay').remove()
  $('#loading_gif').hide()
