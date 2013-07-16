$ ->
  $('#star').ready(
    if $('#star-id').length
      star_id = $('#star-id').text()
      $.get(
        "http://evedata.herokuapp.com/celestials/#{star_id}"
        (data) ->
          console.log("selected solar system: " + data[0].name)
          
          $('#star-name').append("<b>#{data[0].name}</b>")
          $('#star-security').append("#{data[0].security}")
      )
  )
