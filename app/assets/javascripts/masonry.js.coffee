$('.grid').masonry
  itemSelector: '.grid-item'

$ ->
  $('.grid-item').hide()
  $('.grid-item').each((i) ->
    $(this).delay(i * 100).fadeIn(1000)
  )