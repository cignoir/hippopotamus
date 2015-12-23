$ ->
  $('.product').hide();
  $('.product').each((i) ->
      $(this).delay(i * 50).fadeIn(300)
  )