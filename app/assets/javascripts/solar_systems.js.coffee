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
  
  $('#star-moons').ready(
    if $('#star-id').length
      star_id = $('#star-id').text()
      $.get(
        "http://evedata.herokuapp.com/celestials"
        { solar_system_id: star_id, limit: 100, group_id: 8 }
        (data) ->
          $.each(data, (key, val) ->
            if $('#star-moons').text().match(data[key].name)
              console.log "#{data[key].name} is already present"
            else
              $('#star-moons').append("<div id='#{data[key].id}'>#{data[key].name}</div>")
          )
      )
  )
